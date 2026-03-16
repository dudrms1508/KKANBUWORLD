package com.kh.world.search.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.world.member.model.vo.Member;
import com.kh.world.search.model.service.UserSearchService;

@Controller
public class UserSearchController {
	
	@Autowired
	private UserSearchService userSearchservice;
	
	// 회원 목록 가져오기
//	@GetMapping("/userSearch")
//	public String userSearch() {
//		
//		return "webpage/ilchon/memberList";
//	}
	
	// 회원 검색
	@GetMapping("/userSearch")
	private ModelAndView userSearch(ModelAndView modelAndView,
									@RequestParam(value="searchUser", defaultValue = "", required = false) String searchUser) {
		
		List<Member> list = userSearchservice.findByName(searchUser); 
		
		System.out.println(list);
		
		modelAndView.addObject("list", list);
		
		modelAndView.setViewName("/webpage/ilchon/memberList");
		
		return modelAndView;
		
		// 검색 조건 추가
//		if (list != null) {
//			
//			modelAndView.addObject("list", list);
//			modelAndView.setViewName("/webpage/ilchon/memberList");
//			
//		} else {
//			
//			modelAndView.addObject("msg","찾으려는 친구의 이름을 입력 해주세요");
//			modelAndView.addObject("location","/");
//			modelAndView.setViewName("common/msg");
//		}
			
//		} else if (searchUser.equals("")) {
//			
//			modelAndView.addObject("msg","찾으려는 친구의 이름을 입력 해주세요");
//			modelAndView.addObject("location","/");
//			modelAndView.setViewName("common/msg");
//			
//		} else if (list == null) {
//			
//			modelAndView.addObject("msg","이름을 다시 확인 해주세요");
//			modelAndView.addObject("location","/");
//			modelAndView.setViewName("common/msg");
//		}
		
//		return modelAndView;
	}
	
}