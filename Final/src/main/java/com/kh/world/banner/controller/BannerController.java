package com.kh.world.banner.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.kh.world.banner.model.service.BannerService;
import com.kh.world.notice.model.service.NoticeService;
import com.kh.world.notice.model.vo.Notice;

@Controller
public class BannerController {
	@Autowired
	private BannerService bannerService;
	
	@Autowired
	private NoticeService service;

	// 공지사항 보여주기 확인
//	@GetMapping("/banner/preview")
//	public String preview() {
//		
//		return "webpage/notice/view";
//	}
	
	// 공지사항 최신 게시글 가져오기
	@ResponseBody
	@GetMapping("/preview")
	public Notice noticePreview(@RequestParam String table) {
		
		Notice notice = bannerService.getNoticeList(table);
		
		System.out.println(notice);
		
		return notice;
	}
	
	// 공지사항 게시글 번호 가져오기
	@GetMapping("/noticeView")
	public ModelAndView view(ModelAndView modelAndView,
							@ModelAttribute Notice notice
							) {
		
		int no = bannerService.findNoticeNo();
		
		System.out.println(no);
		
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
		
		modelAndView.addObject("noticePre",noticePre);
		modelAndView.addObject("noticeNext",noticeNext);
		
		modelAndView.setViewName("webpage/notice/view");
		return modelAndView;
	}

}