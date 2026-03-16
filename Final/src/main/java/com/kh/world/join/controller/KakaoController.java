package com.kh.world.join.controller;

import java.io.IOException;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.PropertySource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.util.SystemPropertyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;

import com.kh.world.join.model.service.ApiService;
import com.kh.world.member.model.vo.Member;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@PropertySource("classpath:kakao.properties")
@SessionAttributes(value = {"loginMember", "kakaoToken"})
public class KakaoController {
	// 카카오 properties 선언
	@Value("${kakao.auth.url}")
	private String kakaoAuthUrl;
	
	// 카카오 properties 선언
	@Value("${kakao.api.key}")
	private String kakaoApiKey;
	
	// 카카오 properties 선언
	@Value("${kakao.redirect.uri}")
	private String redirectURI;

	@Autowired
	private ApiService kakaoService;
	
	
	
	// loginAPI 테스트로 포워딩
	// 로그인 테스트 페이지임
	@GetMapping("/api/loginAPI")
	public String loginAPI() {
		
		return "webpage/join/loginAPI";
	}
	
	// 버튼에 경로 줄거임
	// 카카오 로그인 페이지로 리다이렉트
//	@PostMapping(value = "/login/kakao")
	@RequestMapping(value = "/login/kakao")
	public String kakaoLogin() {
		StringBuffer loginUrl = new StringBuffer();

		String reqUrl = kakaoAuthUrl + "/oauth/authorize?client_id=" + kakaoApiKey + "&redirect_uri="+ redirectURI + "&response_type=code";
		
		loginUrl.append(reqUrl);
		
		return "redirect:" + loginUrl.toString();
		
//		System.out.println(reqUrl);
//		return reqUrl;
	}
	
	
	// api/kakaoLogin -> 카카오에서 설정한 로그인 버튼을 누르면 리다이렉트 되는 페이지
	@GetMapping("/api/kakaoLogin")
	public ModelAndView redirectkakao(@RequestParam String code, 
//									HttpSession session,
									ModelAndView modelAndView) throws IOException {
		int kakaoResult = 0;
		Member loginMember = new Member();
		
		// 접속 토큰
		System.out.println("코드 : " + code);
		
		// 접속 토큰 가져오기
		String kakaoToken = kakaoService.getReturnAccessToken(code);
		// 접속자 정보 map에 담아주기
		Map<String, Object> result = kakaoService.getUserInfo(kakaoToken);
		
		System.out.println(result.get("nickname"));
		System.out.println(result.get("id"));
		System.out.println(result.get("email"));
		
		String getId = (String) result.get("id"); // 고유 id 값
		String name = (String) result.get("nickname"); // 이름 못받아와서 이름에 nickname으로 넣기
		String email = (String) result.get("email"); // email 넣기
		
		String kakaoId = result.get("id") + "@kakao"; // db에 넣을 id 가공
		String kakaoPwd = getId;
		
		// ++추가 접속자 정보 member에 담아주기
		
		// 해당하는 id가 있으면 로그인 없으면 회원가입
		// 아이디 찾기
		Member member = kakaoService.findMemberKakaoById(kakaoId);
		
		if(member == null) {
			// 기존 회원이 아니면 회원가입 시키기 (db 넣기)
			System.out.println("기존 회원이 아님");
			
			loginMember.setId(kakaoId);
			loginMember.setName(name);
			loginMember.setPassword(kakaoPwd);
			
			// 이메일 null값 조건
			if(email != null) {
				
				loginMember.setEmail(email);
				
			} else {
				// 이메일 없으면 설정 안함
			}
			
			kakaoResult = kakaoService.insertKakaoMember(loginMember);
			
				// 회원가입 성공
				if(kakaoResult > 0) {
					System.out.println("loginMember : " + loginMember);
					System.out.println("카카오 토큰 : " + kakaoToken);
//					session.setAttribute("kakaoToken", kakaoToken);
					modelAndView.setViewName("common/msg");
					modelAndView.addObject("msg", "회원가입에 성공하였습니다. 로그인 해 주세요.");
					modelAndView.addObject("location", "/");
					
					// 다시 로그인하기
//					modelAndView.addObject("loginMember", loginMember);
//					modelAndView.addObject("kakaoToken", kakaoToken);
					
					
				} else {
					modelAndView.setViewName("common/msg");
					modelAndView.addObject("msg", "회원가입에 실패하였습니다.");
					modelAndView.addObject("location", "/webpage/join/loginAPI");
					
				}
			
		} else {
			// 있으면 홈으로 로그인시켜서 보내주기
			
			
			System.out.println("기존 회원임");
			System.out.println("loginMember : " + member);
			System.out.println("카카오 토큰 : " + kakaoToken);
			
			modelAndView.setViewName("redirect:/");
			modelAndView.addObject("kakaoToken", kakaoToken);
			modelAndView.addObject("loginMember", member); // 아이디로 찾은 null이 아닌 멤버를 loginMember로 세션에 넘겨준다.
			
		}
		
		return modelAndView;
		
		
	}
	
	
	// 카카오 로그아웃 (새션만 만료)
	@GetMapping("/api/logout")
	public String logout(SessionStatus status,
//						HttpSession session,
						@SessionAttribute("kakaoToken") String kakaoToken) {

		
//		session.removeAttribute(kakaoToken);
//		System.out.println("remove 후 : " + kakaoCheck);
//		session.removeAttribute("kakaoToken", kakaoToken);
		
		status.setComplete();

//		session.invalidate();
		
		System.out.println("invalidate 후 : " + kakaoToken);
		System.out.println("invalidate 후 : " + kakaoToken);
		
		
		return "redirect:/"; 
	}

	
	// delete 하기
	// 카카오 탈퇴 (토큰 만료 + 세션 만료 + 탈퇴도 구현)
	// 카카오로그인일때만 받는 토큰
	@GetMapping("/api/logout/kakao")
	public String logout(@SessionAttribute("loginMember") Member loginMember, 
						@SessionAttribute("kakaoToken") String kakaoToken,
//						HttpSession session,
						SessionStatus status) 
						throws IOException {
		
		
		System.out.println("카카오 logout 탔음");
		System.out.println("로그인한 회원 : " + loginMember);
		
		// 세션 없애기
		status.setComplete();
		
		if(kakaoToken == null) {
			System.out.println("kakaoToken : " + kakaoToken);
			System.out.println("세션 없음");
			
		} else {
			
			System.out.println("카카오 세션 있어서 로그아웃 처리중 ");
			
			
			System.out.println("kakaoCheck : " + kakaoToken);
			// 토큰 로그아웃
//			kakaoService.getLogout(kakaoCheck);
			
			// 연결 끊기 - 회원 탈퇴할 때 쓰기.. 연결 끊기
//			kakaoService.unlink((String)session.getAttribute("access_token"));
			kakaoService.unlink(kakaoToken);
//			session.invalidate();
			
			
			System.out.println("kakaoCheck : " + kakaoToken);
			
			
		}
		
		
		return "redirect:/";
	}
	
	
}
