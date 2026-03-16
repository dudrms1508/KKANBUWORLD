package com.kh.world.miniBoard.controller;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.Resource;
import org.springframework.core.io.ResourceLoader;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kh.world.common.util.MultipartFileUtil;
import com.kh.world.common.util.PageInfo;
import com.kh.world.member.model.service.MemberService;
import com.kh.world.member.model.vo.Member;
import com.kh.world.miniBoard.model.service.BoardService;
import com.kh.world.miniBoard.model.vo.Board;
import com.kh.world.miniBoard.model.vo.Reply;
import com.kh.world.minihome.model.vo.MemberMinihome;

import lombok.extern.slf4j.Slf4j;

@Slf4j //로그를 찍을수있는 어노테이션
@Controller
@RequestMapping("/board")
public class BoardController {
	@Autowired
	private BoardService service;
	
	@Autowired
	private MemberService memberService;
	
	@Autowired
	private ResourceLoader resourceLoader;
	
	@GetMapping("/home/{minihomeNo}")
	public ModelAndView board(ModelAndView modelAndView,
				  			@PathVariable("minihomeNo") int minihomeNo,
				  			@SessionAttribute("loginMember") Member loginMember
			  ) {
		//로그인한 아이디 미니홈피
		int userNo = loginMember.getNo();
		MemberMinihome memberMinihome = memberService.findMinihomeByNo(userNo);
		modelAndView.addObject("memberMinihome", memberMinihome);

		modelAndView.setViewName("minihome/board/board");
		
		return modelAndView;
	}
	
	@GetMapping("/list")
	public ModelAndView list(ModelAndView modelAndView, @RequestParam(defaultValue = "1") int page) {
		int listCount = service.getBoardCount();
		
		log.info("Page : {}", page);
		log.info("ListCount : {}", listCount);
		
		PageInfo pageInfo = new PageInfo(page, 10, listCount, 10);
		List<Board> list = service.getBoardList(pageInfo);
		
		
		modelAndView.addObject("pageInfo", pageInfo);
		modelAndView.addObject("list", list);
		modelAndView.setViewName("minihome/board/list");
		
		return modelAndView;
	}

	@GetMapping("/view")
	public ModelAndView view(ModelAndView modelAndView, @RequestParam int no) {
		Board board = null;
		List<Reply> replylist= null;
		
		log.info("no : {}", no);
		
		replylist = service.findReplyByNo(no);
		board = service.findBoardByNo(no);
		
		modelAndView.addObject("board", board);
		modelAndView.addObject("replylist", replylist);
		
		modelAndView.setViewName("minihome/board/view");
		
		return modelAndView;
	}
	
	@GetMapping("/delete")
	public ModelAndView delete(ModelAndView modelAndView, @RequestParam int no,
				@SessionAttribute("loginMember") Member loginMember) {
		int result = 0;
		Board board = null;
		
		board = service.findBoardByNo(no);
		
		if (board != null && board.getWriterId().equals(loginMember.getId())) {
			result = service.delete(no);
			
			if (result > 0) {
				modelAndView.addObject("msg", "게시글 삭제 완료.");
				modelAndView.addObject("location", "/board/list");				
			} else {
				modelAndView.addObject("msg", "응 삭제 실패~");
				modelAndView.addObject("location", "/board/view?no=" + no);								
			}
			
		} else {
			modelAndView.addObject("msg", "잘못된 접근입니다.");
			modelAndView.addObject("location", "/board/list");
		}
	
		modelAndView.setViewName("common/msg");
		
		return modelAndView;
	}
	
	@GetMapping("/write")
	public String write() {
		log.info("게시글 작성 페이지 요청");
		
		return "minihome/board/write";
	}
	
	@PostMapping("/write")
	public ModelAndView write(
			ModelAndView modelAndView,
			@ModelAttribute Board board,
			@RequestParam("upfile") MultipartFile upfile,
			@SessionAttribute("loginMember") Member loginMember) {
		
		int result = 0;
		
		//파일을 업로드하지 않으면 true, 파일을 업로드하면 false를 리턴한다.
		log.info("upfile,isEmpty() : {}", upfile.isEmpty());
		//파일을 업로드하지 않으면 빈문자열 ""을, 파일을 업로드하면 "파일명"으로 출력이 된다.
		log.info("upfile.getOriginalFilename() : {}", upfile.getOriginalFilename());
		
		// 1. 파일을 업로드 했는지 확인 후 파일을 저장
		if (upfile != null && !upfile.isEmpty()) {
			String location = null;
			String renameFileName = null;
			
			try {
				                                       //어디서부터 읽어올지 경로를 설정
				location = resourceLoader.getResource("resources/upload/board").getFile().getPath();
				
				renameFileName = MultipartFileUtil.save(upfile, location);
				
				System.out.println(renameFileName);
				
			} catch (IOException e) {
				e.printStackTrace();
			}
			
			if (renameFileName != null) {
				board.setOriginalFileName(upfile.getOriginalFilename());
				board.setRenamedFileName(renameFileName);
			}
		}
		// 2. 작성한 게시글 데이터를 데이터 베이스에 저장
		board.setWriterNo(loginMember.getNo());
		
		result = service.save(board);
		
		if (result > 0) {
			modelAndView.addObject("msg", "게시글 등록 완료");
			modelAndView.addObject("location", "/board/list");			
		}else {
			modelAndView.addObject("msg", "오류 입니다. 다시 시도하세요");
			modelAndView.addObject("location", "/board/write");
		}
		
		modelAndView.setViewName("common/msg");
		
		return modelAndView;
	}
	
	@PostMapping("/reply")
	public ModelAndView reply(
			ModelAndView modelAndView,
			@ModelAttribute Reply reply,
			@ModelAttribute Board board,
			@SessionAttribute("loginMember") Member loginMember) {
		
		int result = 0;
		
		reply.setWriterNo(loginMember.getNo());
		
		result = service.save(reply);
		
		if (result > 0) {
			modelAndView.addObject("msg", "댓글 등록 완료");
			modelAndView.addObject("location", "/board/view?no=" + reply.getBoardNo());			
		}else {
			modelAndView.addObject("msg", "다시 시도하세요");
			modelAndView.addObject("location", "/board/write");
		}
		
		modelAndView.setViewName("common/msg");
		
		return modelAndView;
	}
	
	@GetMapping("/update")
	public ModelAndView update(
			ModelAndView modelAndView, @RequestParam int no,
			@SessionAttribute("loginMember") Member loginMember) {
		Board board = null;
		
		log.info("no : {}", no);
		log.info(loginMember.toString());
		
		board = service.findBoardByNo(no);
		
		if (board != null && board.getWriterId().equals(loginMember.getId())){
			modelAndView.addObject("board", board);
			modelAndView.setViewName("minihome/board/update");
		}else {
			modelAndView.addObject("msg", "잘못된 접근입니다");
			modelAndView.addObject("location", "board/list");
			modelAndView.setViewName("common/msg");
		}
			
		return modelAndView;
	}
	
	@PostMapping("/update")
	public ModelAndView update(
			ModelAndView modelAndView,
			@RequestParam("upfile") MultipartFile upfile,
			@RequestParam int no, @RequestParam String title, @RequestParam String content, 
			@SessionAttribute("loginMember") Member loginMember) {
		int result = 0;
		Board board = null;
		
		log.info("{}, {}, {}", new Object[] {no, title, content});
		
		board = service.findBoardByNo(no);
		
		if (board != null && board.getWriterId().equals(loginMember.getId())){
			if (upfile != null && !upfile.isEmpty()) {
				String location = null;
				String renamedFileName = null;
				
				try {
					location = resourceLoader.getResource("resources/upload/board").getFile().getPath();
					
					//이전에 업로드된 첨부파일 삭제
					if (board.getRenamedFileName() != null) {
						MultipartFileUtil.delete(location + "/" + board.getRenamedFileName());
					}
					
					renamedFileName = MultipartFileUtil.save(upfile, location);
				} catch (IOException e) {
					e.printStackTrace();
				}
				
				if (renamedFileName != null) {
					board.setOriginalFileName(upfile.getOriginalFilename());
					board.setRenamedFileName(renamedFileName);
				}
			}
			
			board.setTitle(title);
			board.setContent(content);
			
			System.out.println(board);
			
			result = service.save(board);
			
			if (result > 0) {
				modelAndView.addObject("msg", "게시글이 정상적으로 수정되었습니다.");
				modelAndView.addObject("location", "/board/view?no=" + board.getNo());
			}else {
				modelAndView.addObject("msg", "게시글 수정을 실패하였습니다.");
				modelAndView.addObject("location", "/board/update?no=" + board.getNo());
			}
			
			
		}else {
			modelAndView.addObject("msg", "잘못접근하셨습니다");
			modelAndView.addObject("location", "/board/list");
			
		}
		
		modelAndView.setViewName("common/msg");
		
		return modelAndView;
	}
	
}
