package com.kh.world.member.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;

import com.kh.world.join.model.service.ApiService;
import com.kh.world.member.model.service.MemberService;
import com.kh.world.member.model.vo.Member;


@Controller
//Model객체에 loginMember라는 키값으로 Attribute가 추가되면 해당 Attribute세션 스코프에 추가하는 어노테이션이다.
@RequestMapping("/webpage/member")
@SessionAttributes(value = {"loginMember", "kakaoToken"})
public class MemberController {
	@Autowired
	private MemberService service;
	
	@Autowired
	private ApiService kakaoService;
	
	@GetMapping("/login")
	public String login() {
		
		return "webpage/member/login";
	}
	
	
	@PostMapping("/login")
	public ModelAndView login(ModelAndView modelAndView,
					@RequestParam String id, 
					@RequestParam String password
			) {
		Member loginMember = service.login(id, password);
		
		if (loginMember != null) {
			
			modelAndView.addObject("loginMember",loginMember);
			modelAndView.setViewName("redirect:/");
		
		}else {
			modelAndView.addObject("msg","아이디나 패스워드가 일치하지 않습니다.");
			modelAndView.addObject("location", "/");
			modelAndView.setViewName("common/msg");
		}
		return modelAndView;
	}
	
	@GetMapping("/logout")
	public String logout(SessionStatus status,
						 @SessionAttribute(value = "kakaoToken", required = false) String kakaoToken) {
		status.setComplete();
		
		if(kakaoToken != null) {
			System.out.println("카카오 토큰 있음");
			// 카카오 토큰 로그아웃
			kakaoService.getLogout(kakaoToken);
			
		} else {
			System.out.println("카카오 토큰 없음");
		}

		status.setComplete();
		
		return "redirect:/"; 
	}
	
	
	@GetMapping("/findid")
	public String findid() {
		return "webpage/member/findid";
	}
	
	
	
	@PostMapping("/findid2")
	public ModelAndView findid(ModelAndView modelAndView,
								@RequestParam String name,
								@RequestParam int phone,
								@RequestParam int birth
			) {
		String id = null;
		Member member = null;
		Map<String, Object> map =new HashMap<String, Object>();
		map.put("name", name);
		map.put("phone", phone);
		map.put("birth", birth);
		
		member = service.findId(map);
		System.out.println(member);
		
	      if(member != null) {
	    	  id = member.getId();
	    	  String[] arr = id.split("");
	    	  for (int i = 0; i < arr.length; i++) {
	    		  if(i>2) {
	    			  arr[i]="*";
	    		  }
	    		  id =  String.join("", arr);
	    	  } 
	    	  
	      }else {
	      }
		
	      modelAndView.addObject("member",member);
	      modelAndView.addObject("id",id);
	      modelAndView.addObject("/webpage/member/findid2");
		
		return modelAndView;
	}

	
	
	
	
	
	@GetMapping("/findpwd")
	public String findpwd() {
		return "webpage/member/findpwd";
	}
	@PostMapping("/findpwd")
	public ModelAndView findpwd(ModelAndView modelAndView,
						@RequestParam String name,
						@RequestParam String id,
						@RequestParam int phone,
						@RequestParam String email,
						@RequestParam int birth 
							) {
		
		Member member = null;
		Map<String, Object> map =new HashMap<String, Object>();
		String password = null;
		int result = 0;
		
		map.put("name", name);
		map.put("id", id);
		map.put("phone", phone);
		map.put("email", email);
		map.put("birth", birth);
		
		member = service.findPwd(map);
		System.out.println(member);
		
		password = service.createPwd();
		System.out.println(password);
		
		
		if(member != null) {
			
			result = service.updatePwd(member,password);
			service.writeEmail(member,password);
			
			if(result > 0){
		    	modelAndView.addObject("member",member);
		    	modelAndView.addObject("msg","이메일로 임시비밀번호를 보냈습니다.");
				modelAndView.addObject("location", "/");
		    }else {
		    	
		    }
		}else {
			modelAndView.addObject("msg","입력하신 정보가 정확하지 않습니다.");
			modelAndView.addObject("location", "/webpage/member/findpwd");
		}
		modelAndView.setViewName("common/msg");
		
		
		return modelAndView;
	}
}	
