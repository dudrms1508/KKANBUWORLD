package com.kh.world.message.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.kh.world.ilchon.model.vo.Ilchon;
import com.kh.world.ilchon.model.vo.Request;
import com.kh.world.member.model.vo.Member;
import com.kh.world.message.model.service.MessageService;
import com.kh.world.message.model.vo.Answer;
import com.kh.world.message.model.vo.Message;

import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/webpage/message")
@SessionAttributes("loginMember")
@AllArgsConstructor
public class MessageController {
	
	@Autowired
	private final MessageService service;
	
	
	// 친구 신청 쪽지 팝업 열기 (+ 내가 클릭한 상대방의 파라미터 값(member.no) 불러오기)
	@ResponseBody
	@GetMapping("/sendMessage")
	public ModelAndView ilchonMessage(
					ModelAndView modelAndView,
					@RequestParam int no,
					@SessionAttribute("loginMember") Member loginMember) {
		
		log.info("친구 신청 모달 요청");
		log.info("no: {}" + no);
		int userNo = loginMember.getNo();
		
		
		// 내가 친구하고 싶은 사람의 MemberNo을 통해 그 회원의 정보를 얻어오기
		Ilchon ilchon = service.findIlchonByNo(no, userNo);
		
		System.out.println("no"+no);
		System.out.println(ilchon);

		modelAndView.addObject("ilchon", ilchon);
		modelAndView.setViewName("/webpage/message/sendMessage");

		return modelAndView;
	}
	
	// 친구 신청 쪽지 내용 insert (메시지 DB에 저장)
	@PostMapping("/sendMessage")
	public ModelAndView request(
			ModelAndView modelAndView,
			@ModelAttribute Message message,
			@RequestParam int ilchonNo,
			@SessionAttribute("loginMember") Member loginMember) {

		log.info("sendMessage_친구에게 쪽지 내용 전달");
		int result = 0;
		int userNo = loginMember.getNo();
		
		Ilchon ilchon = service.findMyIlchonByNo(userNo, ilchonNo);
		
		// 내가 친구하고 싶은 사람의 MemberNo을 통해 그 회원의 정보를 얻어오기
		System.out.println(ilchonNo);
		System.out.println(userNo);
		
		message.setIlchonNo(ilchonNo);
		message.setUserNo(userNo);
		
		log.info("이제 정보 insert하자");
		result = service.sentMessage(message);
		
		if (result > 0) {
			// 정상적으로 보낸편지함 발송 완료
			modelAndView.addObject("msg", "쪽지 발송 완료!");
			modelAndView.addObject("script", "self.close()");
			// insert되면 보드의 primary 값 no 받는거임
			modelAndView.addObject("location", "/webpage/message/sent");
			//modelAndView.addObject("redirect:/sent");
		} else {
			// 보낸편지함 발송 실패
			modelAndView.addObject("msg", "쪽지 발송 실패!");
			modelAndView.addObject("redirect:/ilchonList");
		}
		modelAndView.setViewName("common/msg");

		return modelAndView;
	}
	
	// 내가 보낸 편지함 open
	@GetMapping("/sent")
	public ModelAndView sent(
			ModelAndView modelAndView,
			@SessionAttribute("loginMember") Member loginMember) {
		
		int no = 0;
		log.info("보낸 편지함");
		no = loginMember.getNo();
		
		List<Message> message = service.saveAllMessage(no);
		
		System.out.println("message : " + message);
		
		modelAndView.addObject("message", message);
		modelAndView.setViewName("/webpage/message/sent");
      
     return modelAndView;
	}
	
	// 내가 받은 편지함 open
	@GetMapping("/inbox")
	public ModelAndView receive(
			ModelAndView modelAndView,
			@SessionAttribute("loginMember") Member loginMember) {
		
		int no = 0;
		log.info("받은 편지함");
		
		// 로그인한 사람의 no 값을 파라미터로 넘겨
		no = loginMember.getNo();
		
		List<Message> message = service.receiveAllMessage(no);
		System.out.println("message를 어떻게? " + message);
		
		
		modelAndView.addObject("message", message);
		modelAndView.setViewName("/webpage/message/inbox");
      
     return modelAndView;
	}
	
	@PostMapping("/inbox")
	public ModelAndView receiveMessage(
			ModelAndView modelAndView,
			@SessionAttribute("loginMember") Member loginMember) {
		
		int no = 0;
		int mNo = 0;
		log.info("받은 편지함");
		
		// 로그인한 사람의 no 값을 파라미터로 넘겨
		no = loginMember.getNo();
		
		List<Message> message = service.receiveAllMessage(no);
		
		modelAndView.addObject("message", message);
		modelAndView.setViewName("/webpage/message/inbox");
      
     return modelAndView;
	}
	
	// 받은 편지함에서 message 내용 불러오기
	@ResponseBody
	@GetMapping("/answerMessage")
	public ModelAndView accept(
			ModelAndView modelAndView,
			@RequestParam int no) {
		
		System.out.println(no);
		
		log.info("수락하는 팝업");
		// 내가 누른 팝업창의 사람의 팝업 정보를 얻어온다.
		Message message = service.answerMessage(no);
		
		no = message.getMessageNo();
		
		System.out.println("inbox에서 no은?" + no);
		System.out.println(message);
		
		modelAndView.addObject("message", message);
		modelAndView.setViewName("/webpage/message/answerMessage");
		
		return modelAndView;
	}
	
	
	// 보낸 편지함의 message 내용 불러오기
	@ResponseBody
	@GetMapping("/readMessage")
	public ModelAndView read(
			ModelAndView modelAndView,
			@RequestParam int no) {
		
		System.out.println(no);
		
		log.info("내가 보낸 쪽지함");
		// 내가 보낸 팝업창의 정보를 얻어온다.
		Message message = service.readMessage(no);
		
		no = message.getMessageNo();
		
		System.out.println("sent에서 no은?" + no);
		System.out.println(message);
		
		modelAndView.addObject("message", message);
		modelAndView.setViewName("/webpage/message/readMessage");
		
		return modelAndView;
	}
	
	
	// 받은 편지함에서 message 내용 불러오기
	@PostMapping("/answerMessage")
	public ModelAndView answer(
			ModelAndView modelAndView,
			@ModelAttribute Answer answer,
			@ModelAttribute Message message,
			@RequestParam(defaultValue = "0") int no,
			@SessionAttribute("loginMember") Member loginMember) {
		
		log.info("@PostMapping(\"/answerMessage\") 메시지 답변 insert");
		
		System.out.println("loginMember"+ loginMember);
		
		int result = 0;
		int sender = loginMember.getNo();
		no = message.getMessageNo();
		
		// no 값을 파라미터로 넘겨 (받은 편지함 = 로그인한 user라는 것)
		// xml에서 메시지의 메시지 테이블의 messageNo = Answer 테이블의 messageNo 가 같을 때 메시지의 no를 찾아라
		answer = service.findMyMessage(no);
		
		log.info("답변 정보 insert하기)");
		//result = service.insertMessage(answer);
		
		System.out.println("inbox_loginMember"+ loginMember);
		
		if (result > 0) {
			// 정상적으로 답변 insert 완료
			modelAndView.addObject("msg", "답변 완료!");
			/* modelAndView.addObject("answer", answer); */
			modelAndView.addObject("location", "/webpage/ilchon/ilchonList");
		} else {
			// 답변 insert 실패
			modelAndView.addObject("msg", "답변 실패!");
			/* modelAndView.addObject("answer", answer); */
			modelAndView.addObject("redirect:/inbox");
		}
		modelAndView.setViewName("common/msg");

		return modelAndView;
	}
	
	

	

}
