package com.kh.world.join.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.kh.world.join.model.service.JoinService;
import com.kh.world.member.model.vo.Member;
import com.kh.world.mypage.model.service.MypageService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class JoinController {
	@Autowired
	private JoinService service;
	
	@Autowired
	private MypageService mypageService;
	
	// 이용약관 페이지로 forward
	@GetMapping("/join/terms")
	public String terms() {
		
		return "webpage/join/terms";
	}
	
	@GetMapping("/join/terms/useTerms")
	public String userTerms() {
		
		return "webpage/join/useTerms";
	}
	
	
	// 회원가입 페이지로 forward + 약관 동의해야만 넘어가게 만들기
	@GetMapping("/join/signIn")
	public ModelAndView signIn(ModelAndView modelAndView,
							@RequestParam(required = false) String check14, 
							@RequestParam(required = false) String accountcheck,
							@RequestParam(required = false) String privatecheck) {
		
//		log.info("{}, {}, {}", new Object[] {check14, accountcheck, privatecheck});
		
		if(check14 != null && accountcheck != null && privatecheck != null) {
			
			if(check14.equals("on") && accountcheck.equals("on") && privatecheck.equals("on")) {
				
				modelAndView.setViewName("webpage/join/signIn");
				
				return modelAndView;
			} else {

				modelAndView.addObject("msg", "잘못된 접근입니다.");
				modelAndView.addObject("location", "/join/terms");
				modelAndView.setViewName("common/msg");
				
				return modelAndView;
			}
			
		} else {
			
			modelAndView.addObject("msg", "잘못된 접근입니다.");
			modelAndView.addObject("location", "/join/terms");
			modelAndView.setViewName("common/msg");
			
			return modelAndView;
		}
		
	}
	
	
	// 중복 검사 Controller
	@PostMapping("/join/check")
	@ResponseBody
	public Map<String, Object> duplicatedCheck(@RequestParam(required = false) String id, 
											@RequestParam(defaultValue = "0") String email,
											@RequestParam(defaultValue = "0") String phone) {
		
		Map<String, Object> map = new HashMap<>();
		
//		log.info("{}, {}, {}", new Object[] {id, email, phone});
		
		Boolean duplicatedId  = service.duplicatedIdCheck(id);
		Boolean duplicatedEmail = service.duplicatedEmailCheck(email);
		Boolean duplicatedPhone = service.duplicatedPhoneCheck(phone);
		
		
		map.put("duplicatedId", duplicatedId);
		map.put("duplicatedEmail", duplicatedEmail);
		map.put("duplicatedPhone", duplicatedPhone);
		
		return map;
	}
	
	
	
	@GetMapping("/join/mailCheck")
	@ResponseBody
	public String mailCheck(String emailaddress) {
//		System.out.println(emailaddress);
		
//		System.out.println(service.joinEmail(emailaddress));
		
		return service.joinEmail(emailaddress);
	}
	
	
	// 회원가입 완료
	@PostMapping("/join/signIn")
	public ModelAndView signIn(ModelAndView modelAndView,
							@ModelAttribute Member member,
							@RequestParam String year,
							@RequestParam String month,
							@RequestParam String day,
							@RequestParam String detailAddress) {
		int birthday = 0;
		int result = 0;
		String dayAdd = "";
		String profile = "";
		String memberAddress = "";
		
//		System.out.println(member);
//		log.info("{}, {}, {}, {}", new Object[] {year, month, day, detailAddress});
		
		// day 가공
		if(Integer.parseInt(day) < 10) {
			dayAdd = '0' + day;
		} else {
			dayAdd = day;
		}
		
//		System.out.println("birth : " + year + month + dayAdd);
		birthday = Integer.parseInt((year + month + dayAdd));
		// birth 바꿔주기
		member.setBirth(birthday);
		
		memberAddress = member.getAddress() + " " + detailAddress;
		// address 바꿔주기
		member.setAddress(memberAddress);

		
		if(member.getGender().equals("F")) {
			// 여자 미니미
			member.setMinimi("resources/image/join/minimi_female_gender.png");
			profile = "resources/image/join/profile_female.jpg";
			
		} else if(member.getGender().equals("M")) {
			// 남자 미니미
			member.setMinimi("resources/image/join/minimi_male_gender.png");
			profile = "resources/image/join/profile_male.jpg";

		} else {
			// 성별 없음 미니미
			member.setMinimi("resources/image/join/minimi_none_gender.jpg");
			profile = "resources/image/join/profile_none.jpg";
		}
		
		System.out.println("횐갑한 멤버 insert 전 member 객체" + member);
		
		// 멤버 insert
		result = service.insertMember(member);
//		System.out.println("횐갑한 멤버 insert 후 no값 가져오기" + member.getNo());
//		System.out.println("횐갑한 멤버 insert 후 member 객체 가져옴" + member);
		
		
		
		// 회원가입 성공 로직
		if(result > 0) {
			// 먼저 멤버객체 갱신
			member =  mypageService.findMemberById(member.getId());
			System.out.println("갱신한 멤버 객체 : " + member);
			
			
			// 미니홈도 만들어주기(insert)
			int minihomeResult = service.insertNewMinihome(member.getNo(), profile);
			
			if(minihomeResult > 0) {
				// 성공적으로 minihome 생성
				
				modelAndView.setViewName("common/msg");
				modelAndView.addObject("msg", "회원가입에 성공하였습니다. 홈으로 돌아가 로그인해주세요.");
				modelAndView.addObject("location", "/");
				
			} else {
				// 미니홈 실패 
				modelAndView.setViewName("common/msg");
				modelAndView.addObject("msg", "회원가입에 실패하였습니다. 다시 시도해 주세요.");
				modelAndView.addObject("location", "/");
				
				// 해당 멤버 삭제하기
				// delete
			}
			
		} else {
			modelAndView.setViewName("common/msg");
			modelAndView.addObject("msg", "회원가입에 실패하였습니다. 다시 시도해 주세요.");
			modelAndView.addObject("location", "/");		
		}
		
		return modelAndView;
	}
	
	
	
	
}
