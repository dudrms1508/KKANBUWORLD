package com.kh.world.diary.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.kh.world.diary.model.service.DiaryService;
import com.kh.world.diary.model.vo.Diary;
import com.kh.world.diary.model.vo.DiaryReply;
import com.kh.world.member.model.vo.Member;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/minihome")
@SessionAttributes(value = {"loginMember"})
public class DiaryController {
	
	@Autowired
	private DiaryService service;
	
	//@Autowired
	//private ResourceLoader resourceLoader;
	
	// (view 페이지 나오고 여러가지 view 테스트용)다이어리 뷰 다음에 작성페이지 이동
	@GetMapping("/test/{minihomeNo}")
	private ModelAndView diarytest(ModelAndView modelAndView,
						@SessionAttribute("loginMember") Member loginMember,
						@PathVariable("minihomeNo") int minihomeNo ) {
		
		modelAndView.setViewName("minihome/diary/test");
		modelAndView.addObject("minihomeNo", minihomeNo);
		
		return modelAndView;	
	}
	
	// (수영님이랑 맞춰야 함) 홈에서 미니홈피 테스트로 보내주는 controller
	@GetMapping("/homeTest/{minihomeNo}")
	public String minihomeTest(@PathVariable("minihomeNo") int minihomeNo,
								Model model) {
		
		model.addAttribute("minihomeNo", minihomeNo);
		
		return "minihome/diary/homeTest";
	}
	
	
	// (수영님이랑 맞춰야 함)홈에서 오른쪽 탭버튼 클릭하면 다이어리로 이동 
	@GetMapping("/diaryList/{minihomeNo}")
	public String diaryTest(
						@PathVariable("minihomeNo") int minihomeNo,
						Model model) {
		
		System.out.println("diaryList로 포워딩 : " + minihomeNo);	
		model.addAttribute("minihomeNo", minihomeNo);
		
		return "minihome/diary/diaryList";
	}
	
	
	// 다이어리 뷰 페이지로 이동 (iframe 영역)
	// 글쓰고 나서 적용되는 페이지
	@GetMapping("/diaryView/{minihomeNo}")
	private ModelAndView diaryView(
						ModelAndView modelAndView,
						@SessionAttribute("loginMember") Member loginMember,
						@PathVariable("minihomeNo") int minihomeNo) {
		
		int writer = loginMember.getNo();
		int dNo = 0;
		List<DiaryReply> reply = service.findReplyByNo(dNo);
		/* dNo = reply.get(0).getDreNo(); */
		
		// 다이이러 DB 내용 불러오기
		List<Diary> diaryList = service.findAllDiary(writer, minihomeNo);
		System.out.println(diaryList);
		
		/* int dNo = diaryList.get(0).getDNo(); */
		
		/* modelAndView.addObject("dNo", dNo); */
		modelAndView.addObject("reply", reply);
		modelAndView.addObject("diaryList", diaryList);
		modelAndView.addObject("minihomeNo", minihomeNo);
		modelAndView.setViewName("minihome/diary/diaryView");
		
		return modelAndView;	
	}
	
	
	@PostMapping("/diaryView/{minihomeNo}")
	private ModelAndView diaryViewWirte(
				ModelAndView modelAndView,
				@SessionAttribute("loginMember") Member loginMember,
				@PathVariable("minihomeNo") int minihomeNo) {

			modelAndView.addObject("minihomeNo", minihomeNo);
			modelAndView.setViewName("minihome/diary/diaryView");
	
		return modelAndView;	
	}
			
	
	// 다이어리 뷰 다음에 작성페이지 이동
	@GetMapping("/diaryWrite/{minihomeNo}")
	private ModelAndView diaryWirte(ModelAndView modelAndView,
						@SessionAttribute("loginMember") Member loginMember,
						@PathVariable("minihomeNo") int minihomeNo ) {
		
		modelAndView.setViewName("minihome/diary/diaryWrite");
		modelAndView.addObject("minihomeNo", minihomeNo);
		
		return modelAndView;	
	}
	
	
	// 다이어리 insert
	@PostMapping("/diaryWrite/{minihomeNo}")
	public ModelAndView diaryWrite(ModelAndView modelAndView,
                                   @ModelAttribute Diary diary,
                                   @RequestParam("title") String title,
                                   @RequestParam("content") String content,
                                   @SessionAttribute("loginMember") Member loginMember,
                                   @PathVariable("minihomeNo") int minihomeNo) {

	       System.out.println("다이어리의 minihomeNo"+minihomeNo);
	       int result = 0;
	       int dNo = 0;
	       int writer = 0;
	
	       // 작성한 게시글 데이터를 데이터 베이스에 저장 
	       diary.setMinihomeNo(minihomeNo);
	       writer = loginMember.getNo();
	       
	       result = service.saveDiary(dNo, loginMember.getNo(), minihomeNo, diary, title, content);
	       
	       System.out.println("writer 결과는"+ writer);
	       System.out.println("result 결과는"+ result);
	
	       if (result > 0) {
	           // 정상적으로 insert 완료
	           modelAndView.addObject("msg", "insert!");
	           modelAndView.addObject("location", "/minihome/diaryView/" + minihomeNo);
	       } else {
	           // insert 실패
	           modelAndView.addObject("msg", "실패!");
	           modelAndView.addObject("location", "/minihome/diary/diaryView");
	       }
	       modelAndView.setViewName("common/msg");

	       return modelAndView;
	}
	
	
	// 다이어리 글 update 뷰 보여주기
	@GetMapping("/diaryUpdate/{minihomeNo}/{dNo}")
	public ModelAndView diaryUpdateView(ModelAndView modelAndView,
									@SessionAttribute("loginMember") Member loginMember,
									@PathVariable("minihomeNo") int minihomeNo,
									@PathVariable("dNo") int dNo
									) {
		
		System.out.println("UPDATE_minihomeNo"+minihomeNo);
		System.out.println("diaryUpdate minihomeNo는 " + minihomeNo);
		
		// Diary 게시글 No 찾기
		int userNo = loginMember.getNo();
		
		
		 Diary diary = service.findDiaryByNo(userNo, dNo); 
		 diary.setDNo(dNo);
		 
		/*
		 * System.out.println("dNo는 " + dNo); System.out.println("업데이트하는 다이어리 정보 " +
		 * diary);
		 */
		 
		modelAndView.addObject("minihomeNo", minihomeNo);
		modelAndView.addObject("diary", diary);
		modelAndView.setViewName("minihome/diary/diaryUpdate");
		
		return modelAndView;
	}

	// 다이어리 update
	@PostMapping("/diaryUpdate/{minihomeNo}/{dNo}")
	public ModelAndView diaryUpdate(ModelAndView modelAndView,
                                   @ModelAttribute Diary diary,
                                   @RequestParam("title") String title,
                                   @RequestParam("content") String content,
                                   @SessionAttribute("loginMember") Member loginMember,
                                   @PathVariable("minihomeNo") int minihomeNo,
                                   @PathVariable int dNo) {

	       System.out.println("다이어리의 minihomeNo"+minihomeNo);
	       int result = 0;
	       int writer = 0;
	
	       // 작성한 게시글 데이터를 데이터 베이스에 저장 
	       diary.setMinihomeNo(minihomeNo);
	       diary.setDNo(dNo);
	       writer = loginMember.getNo();
	       
	       System.out.println("update시, dno는>" + dNo);
	       
	       result = service.saveDiary(dNo, loginMember.getNo(), minihomeNo, diary, title, content);
	       
	       System.out.println("writer 결과는"+ writer);
	       System.out.println("result 결과는"+ result);
	
	       if (result > 0) {
	           // 정상적으로 update 완료
	           modelAndView.addObject("msg", "정상적으로 수정");
	           modelAndView.addObject("location", "/minihome/diaryView" + "/" + minihomeNo);
	       } else {
	           // update 실패
	           modelAndView.addObject("msg", "수정 실패!");
	           modelAndView.addObject("location", "/minihome/diary/diaryView");
	       }
	       modelAndView.setViewName("common/msg");

	       return modelAndView;
	}
	
	
	// 다이어리 글 delete 하기
	@GetMapping("/diaryDelete/{minihomeNo}/{dNo}")
	public ModelAndView diaryDelete(ModelAndView modelAndView,
									@SessionAttribute("loginMember") Member loginMember,
									@PathVariable int minihomeNo,
									@PathVariable int dNo) {
		
		System.out.println("diaryUpdate minihomeNo는 " + minihomeNo);
		int result = 0;
		
		// Diary 게시글 No 찾기
		int userNo = loginMember.getNo();
		
		Diary diary = service.findDiaryByNo(userNo, dNo);
		diary.setDNo(dNo);
		
		if(diary != null && diary.getWriter() == loginMember.getNo()) {
			result = service.deleteDiary(dNo);
			
			if(result > 0) {
				modelAndView.addObject("msg", "다이어리 글이 정상적으로 삭제되었습니다.");
				modelAndView.addObject("location", "/minihome/diaryView" + "/" + minihomeNo);
			} else {
				modelAndView.addObject("msg", "다이어리 글 삭제를 실패하였습니다.");
				modelAndView.addObject("location", "/minihome/diaryView" + "/" + minihomeNo);
			}
		} else {			
			modelAndView.addObject("msg", "잘못된 접근입니다.");
			modelAndView.addObject("location", "/minihome/diaryView" + "/" + minihomeNo);		
		}
		
		modelAndView.setViewName("common/msg");
		
		return modelAndView;
	}
	
	

	 // 다이어리 댓글 달기
	 @PostMapping("/diaryReply/{minihomeNo}/{dNo}") 
	 public ModelAndView diaryReply(ModelAndView modelAndView,
			 				@ModelAttribute DiaryReply diaryReply,
							@SessionAttribute("loginMember") Member loginMember,
							@RequestParam("content") String content,
							@PathVariable("minihomeNo") int minihomeNo,
							@PathVariable("dNo") int dNo) {
	 
		 int result = 0;
		 int writer = loginMember.getNo();
		 
		 System.out.println("content" + content);
		 System.out.println("ddddddd"+writer + minihomeNo + dNo + diaryReply + content);
		 result = service.saveDiaryReply(writer, minihomeNo, dNo, diaryReply, content);
		 
		 System.out.println("댓글의 dno는?" + dNo);
		 System.out.println("writer는?" + writer);
		 
		 if (result > 0) {
		 // 정상적으로 댓글 등록
		 modelAndView.addObject("msg", "정상적으로 댓글 등록");
		 modelAndView.addObject("location", "/minihome/diaryView" + "/" + minihomeNo);
		 } else {
		 // update 실패
		 modelAndView.addObject("msg", "댓글 등록 실패!");
		 modelAndView.addObject("location", "/minihome/diaryView" + "/" + minihomeNo);
		 }
		 modelAndView.setViewName("common/msg");
		 
		 return modelAndView;
	 }

	
	
}
