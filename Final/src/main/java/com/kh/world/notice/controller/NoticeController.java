package com.kh.world.notice.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.kh.world.common.util.PageInfo;
import com.kh.world.member.model.vo.Member;
import com.kh.world.notice.model.service.NoticeService;
import com.kh.world.notice.model.vo.Notice;


@Controller
@RequestMapping("/webpage/notice")
@SessionAttributes(value = {"loginMember","list"})
public class NoticeController {
	@Autowired
	private NoticeService service;
	
	@GetMapping("/list")
	public ModelAndView list(ModelAndView modelAndView,
								@RequestParam(required = false) String type,
								@RequestParam(required = false) String keyword,
								@RequestParam(defaultValue = "1") int page) {
		
			
			int listCount = service.getNoticeCount(type, keyword);
			PageInfo pageInfo = new PageInfo(page, 5, listCount, 5);
			List<Notice> list = service.getNoticeList(pageInfo);
			
			modelAndView.addObject("list",list);
			modelAndView.addObject("pageInfo",pageInfo);
			modelAndView.setViewName("/webpage/notice/list");
		
		
		
		return modelAndView;
	}
	@GetMapping("/searchList")
	public ModelAndView searchList(ModelAndView modelAndView,
								@RequestParam(required = false) String type,
								@RequestParam(required = false) String keyword,
								@RequestParam(defaultValue = "1") int page) {
		System.out.println(type);
		System.out.println(keyword);
		int listCount = service.getNoticeCount(type,keyword);
		PageInfo pageInfo = new PageInfo(page, 5, listCount, 5);
//		List<Notice> list = service.getNoticeList(pageInfo);
		
		List<Notice> list = service.search(type,keyword, pageInfo);
		System.out.println(list);
		
		if(list != null) {
			
			modelAndView.addObject("list",list);
			modelAndView.addObject("type",type);
			modelAndView.addObject("keyword",keyword);
			modelAndView.addObject("pageInfo",pageInfo);
			modelAndView.setViewName("/webpage/notice/searchList");
		}else {
			modelAndView.addObject("msg","조회되는 공지사항이 없습니다.");
			modelAndView.addObject("location","/webpage/notice/list");
			modelAndView.setViewName("common/msg");
		}
			
		
		
		
		return modelAndView;
	}
	
	@GetMapping("/view")
	public ModelAndView view(ModelAndView modelAndView,
							@ModelAttribute Notice notice,
							@RequestParam int no
							) {
//		System.out.println(notice);
		notice = service.selectNoticeByNo(no);
		modelAndView.addObject("notice",notice);
		
		Notice notice1 = null;
		
		notice1 = service.selectNoticeByRownum(no);
		
		int pre = notice1.getRownum() + 1;
		int next = notice1.getRownum() - 1;
		
		Notice noticePre = null;
		Notice noticeNext = null;
		
		
		
		noticePre = service.selectNoticeRownum(pre);
		noticeNext = service.selectNoticeRownum(next);
		
//		System.out.println(noticePre);
//		System.out.println(noticeNext);
		
		
		modelAndView.addObject("noticePre",noticePre);
		modelAndView.addObject("noticeNext",noticeNext);
		
		
		modelAndView.setViewName("webpage/notice/view");
		return modelAndView;
	}
	
	
	@GetMapping("/insert")
	public ModelAndView insert(ModelAndView modelAndView,
								@SessionAttribute("loginMember") Member loginMember) {
		int result = 0;
		result = service.isAdmin(loginMember);
		
		if(result >0) {
			
			modelAndView.addObject("/webpage/notice/insert");
		}else {
			modelAndView.addObject("msg","공지사항 등록권한이 없습니다.");
			modelAndView.addObject("location","/webpage/notice/list");
			modelAndView.setViewName("common/msg");
		}
		return modelAndView;
		
	}
	@PostMapping("/insert")
	public ModelAndView insert(ModelAndView modelAndView,
								@ModelAttribute Notice notice,
								@SessionAttribute("loginMember") Member loginMember
								) {
		int result = 0;
		result = service.save(notice, loginMember);
		
		if (result > 0) {
			modelAndView.addObject("msg","문의하기가 정상적으로 완료되었습니다.");
			modelAndView.addObject("location","/webpage/notice/list");
		}else {
			modelAndView.addObject("msg","문의하기 실패!.");
			modelAndView.addObject("location","/webpage/notice/insert");
		}
		modelAndView.setViewName("common/msg");
		return modelAndView;
	}
	
	@GetMapping("/update")
	public ModelAndView update(ModelAndView modelAndView,
								@RequestParam int no
								) {
		
		Notice notice =null;
		notice = service.selectNoticeByNo(no);
		modelAndView.addObject("notice", notice);
		
		modelAndView.setViewName("webpage/notice/update");
		return modelAndView;
	}
	
	@PostMapping("/update")
	public ModelAndView update(ModelAndView modelAndView,
			@ModelAttribute Notice notice,
			@SessionAttribute("loginMember") Member loginMember
			) {
		int result = 0;
		
		if (notice != null && loginMember.getRole().equals("Y")) {
			result = service.save(notice, loginMember);
			if (result > 0) {
				modelAndView.addObject("msg","공지사항이 수정되었습니다.");
				modelAndView.addObject("location","/webpage/notice/list");
			}else {
				modelAndView.addObject("msg","공지사항 수정 실패했습니다!.");
				modelAndView.addObject("location","/webpage/notice/list");
			}
		}else {
			modelAndView.addObject("msg","잘못된 접근 입니다.");
			modelAndView.addObject("location","/webpage/notice/list");
		}
		
		modelAndView.setViewName("common/msg");
		return modelAndView;
	}
	
//	@GetMapping("/search")
//	public ModelAndView search(ModelAndView modelAndView,
//								@RequestParam String type,
//								@RequestParam(value="keyword", required = false) String keyword,
//								@RequestParam(defaultValue = "1") int page
//			) {
//		List<Notice> list =null;
//		int listCount = service.getNoticeCount();
//		PageInfo pageInfo = new PageInfo(page, 5, listCount, 5);
//		
//		list = service.search(type,keyword);
//		System.out.println(list);
//		
//		if(list != null) {
//			
//			modelAndView.addObject("list",list);
//			modelAndView.addObject("pageInfo",pageInfo);
//			modelAndView.addObject("location", "/webpage/notice/list");
//		}else {
//			modelAndView.addObject("msg","조회되는 공지사항이 없습니다.");
//			modelAndView.addObject("location","/webpage/notice/list");
//		}
//		modelAndView.setViewName("common/msg");
//		
//			
//		
//		return modelAndView;
//	}
	
	@GetMapping("/delete")
	public ModelAndView delete(ModelAndView modelAndView,
								@RequestParam("no") int no ,
								@SessionAttribute("loginMember") Member loginMember
			) {
		int result = 0;
		Notice notice = null;
		
		
		notice = service.selectNoticeByNo(no);
		
		if (notice != null && loginMember.getRole().equals("Y")) {
			result = service.deleteNotice(no);
			if (result > 0) {
				modelAndView.addObject("msg","공지사항이 삭제되었습니다.");
				modelAndView.addObject("location","/webpage/notice/list");
			}else {
				modelAndView.addObject("msg","공지사항 삭제를 실패하였습니다.");
				modelAndView.addObject("location","/webpage/notice/list");
			}
		}else {
			modelAndView.addObject("msg","잘못된 접근 입니다.");
			modelAndView.addObject("location","/webpage/notice/list");
		}
		modelAndView.addObject("location","/webpage/notice/list");
		modelAndView.setViewName("common/msg");
		
		return modelAndView;
	}
	
	
}
