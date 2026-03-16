package com.kh.world.minihome.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.kh.world.member.model.vo.Member;
import com.kh.world.minihome.model.service.MinihomeProService;

@Controller
@RequestMapping("/minihome")
@SessionAttributes(value = {"loginMember"})
public class MinihomeProController {
	@Autowired
	private MinihomeProService service;
	
	@ResponseBody
	@GetMapping("/profileUpdate/{minihomeNo}")
	public int profileUpdate(@SessionAttribute("loginMember") Member loginMember,
							@RequestParam("content") String content,
							@PathVariable("minihomeNo") int minihomeNo) {
		
		int userNo = loginMember.getNo();
		int result = service.updateIntro(minihomeNo, userNo, content);
		
		
		return result;
	}

	@ResponseBody
	@GetMapping("/titleUpdate/{minihomeNo}")
	public int titleUpdate(@SessionAttribute("loginMember") Member loginMember,
			@RequestParam("title") String title,
			@PathVariable("minihomeNo") int minihomeNo) {
		
		int userNo = loginMember.getNo();
		int result = service.updateTitle(minihomeNo, userNo, title);
		
		return result;
	}
	
}
