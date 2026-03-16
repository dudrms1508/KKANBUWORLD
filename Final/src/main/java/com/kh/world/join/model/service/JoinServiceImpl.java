package com.kh.world.join.model.service;

import java.util.Random;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.world.join.model.mapper.JoinMapper;
import com.kh.world.member.model.vo.Member;

@Service
public class JoinServiceImpl implements JoinService {
	@Autowired
	private JavaMailSender mailSender;

	@Autowired
	private JoinMapper mapper;
	
	private int authNumber; 

	
	@Override
	public String joinEmail(String email) {
		this.makeRandomNumber();
		String setFrom = ".com"; // email-config에 설정한 자신의 이메일 주소를 입력 
		String toMail = email;
		String title = "회원 가입 인증 이메일 입니다."; // 이메일 제목 
		String content = 
				"깐부월드를 방문해주셔서 감사합니다." + 	//html 형식으로 작성 ! 
                "<br><br>" + 
			    "인증 번호는 " + authNumber + "입니다." + 
			    "<br>" + 
			    "해당 인증번호를 인증번호 확인란에 기입하여 주세요."; //이메일 내용 삽입
		mailSend(setFrom, toMail, title, content);
		// 이메일 테스트
		System.out.println(content);
		return Integer.toString(authNumber);
	}
	


	@Override
	public String updateEmailPass(String emailaddress) {
		this.makeRandomNumber();
		String setFrom = ".com"; // email-config에 설정한 자신의 이메일 주소를 입력 
		String toMail = emailaddress;
		String title = "깐부월드 회원정보 변경 인증 이메일 입니다."; // 이메일 제목 
		String content = 
				"이메일을 변경하시려면 아래의 인증번호로 인증해주세요." + 	//html 형식으로 작성 ! 
                "<br><br>" + 
			    "인증 번호는 " + authNumber + "입니다." + "<br>";
		mailSend(setFrom, toMail, title, content); // 이메일 전송
		// 이메일 테스트
		System.out.println(content);
		
		return Integer.toString(authNumber);
	}
	
	
	//이메일 전송 메소드
	private void mailSend(String setFrom, String toMail, String title, String content) {
		MimeMessage message = mailSender.createMimeMessage();
		// true 매개값을 전달하면 multipart 형식의 메세지 전달이 가능.문자 인코딩 설정도 가능하다.
		try {
			MimeMessageHelper helper = new MimeMessageHelper(message,true,"utf-8");
			helper.setFrom(setFrom);
			helper.setTo(toMail);
			helper.setSubject(title);
			// true 전달 > html 형식으로 전송 , 작성하지 않으면 단순 텍스트로 전달.
			helper.setText(content,true);
			mailSender.send(message);
		} catch (MessagingException e) {
			e.printStackTrace();
		}
	}
	
	// 랜덤 인증번호 생성 메소드
	private void makeRandomNumber() {
		// 난수의 범위 111111 ~ 999999 (6자리 난수)
		Random r = new Random();
		int checkNum = r.nextInt(888888) + 111111;
		System.out.println("인증번호 : " + checkNum);
		authNumber = checkNum;
	}


	// 아이디 중복검사
	@Override
	public Boolean duplicatedIdCheck(String id) {
		int result = 0;
		Boolean duplicatedId = false;
		
		result = mapper.countMemberById(id);
		
		if(result > 0) {
			duplicatedId = true;
		} else {
			duplicatedId = false;
		}
		
		
		return duplicatedId;
	}

	// 이메일 중복검사
	@Override
	public Boolean duplicatedEmailCheck(String email) {
		int result = 0;
		
		Boolean duplicatedEmail = false;
		
		result = mapper.countMemberByEmail(email);
		
		if(result > 0) {
			duplicatedEmail = true;
		} else {
			duplicatedEmail = false;
		}
		
		return duplicatedEmail;
	}


	@Override
	public Boolean duplicatedPhoneCheck(String phone) {
		int result = 0;
		
		Boolean duplicatedPhone = false;
		
		result = mapper.countMemberByPhone(phone);
		
		if(result > 0) {
			duplicatedPhone = true;
		} else {
			duplicatedPhone = false;
		}
		
		return duplicatedPhone;
	}


	// 회원가입 insert
	@Transactional
	@Override
	public int insertMember(Member member) {
		
		return mapper.insertMember(member);
	}


	// 회원가입 member insert 성공 후 minihome 자동 생성
	@Override
	@Transactional
	public int insertNewMinihome(int no, String profile) {
		
		return mapper.insertNewMinihome(no, profile);
	}


//	@Override
//	public String getAccessToken(String code) {
//		// TODO Auto-generated method stub
//		return null;
//	}

	
	
}
