package com.kh.world.qna.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.kh.world.admin.model.vo.QNA;
import com.kh.world.admin.model.vo.QNA_Category;
import com.kh.world.member.model.vo.Member;
import com.kh.world.qna.model.service.QNAService;

@Controller
@RequestMapping("/webpage/qna")
@SessionAttributes(value = {"loginMember"})
public class QNAController {
	@Autowired
	private QNAService service;
	
	
	@GetMapping("/insert")
	public ModelAndView insert(ModelAndView modelAndView) {
		List<QNA_Category> qnacategory = service.findAll();
		
		modelAndView.addObject("qnacategory",qnacategory);
		
		modelAndView.setViewName("/webpage/qna/insert");
		
		return modelAndView;
	}
	
	@PostMapping("/insert")
	public ModelAndView insert(ModelAndView modelAndView,
							   @SessionAttribute("loginMember") Member loginMember,
							   @ModelAttribute QNA qna
							   ) {
		int result = 0;

		
		result = service.save(qna,loginMember);
		
		

		if (result > 0) {
			modelAndView.addObject("msg","문의하기가 정상적으로 완료되었습니다.");
			modelAndView.addObject("location","/");
		}else {
			modelAndView.addObject("msg","문의하기 실패!.");
			modelAndView.addObject("location","/");
		}
		modelAndView.setViewName("common/msg");
		
		
		return modelAndView;
	}

}
