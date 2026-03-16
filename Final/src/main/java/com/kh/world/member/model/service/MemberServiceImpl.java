package com.kh.world.member.model.service;

import java.util.HashMap;
import java.util.Map;
import java.util.Random;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;

import com.kh.world.member.model.mapper.MemberMapper;
import com.kh.world.member.model.vo.Member;
import com.kh.world.minihome.model.vo.MemberMinihome;

@Service
public class MemberServiceImpl implements MemberService {
	@Autowired
	private MemberMapper mapper;
	
	@Autowired
	private JavaMailSender mailSender;
	
//	@Autowired
//	private BCryptPasswordEncoder passwordEncoder;
	
	
	
	@Override
	public Member login(String id, String password) {
		Member member = null;
		
		
		member = this.findMemberById(id);
		
		if(member !=  null &&password.equals(member.getPassword())/* && passwordEncoder.matches(password, member.getPassword())*/) {
			return member;
		}else {
			return null;
		}
	}


	private Member findMemberById(String id) {
		
		return mapper.selectMemberById(id);
	}



	@Override
	public Member findPwd(Map<String, Object> map) {
		
		return mapper.findPwd(map);
	}


	@Override
	public Member findId(Map<String, Object> map) {
		return mapper.findId(map);
	}


	@Override
	public String createPwd() {
		 int index = 0;
	        char[] charSet = new char[] {
	                '0', '1', '2', '3', '4', '5', '6', '7', '8', '9',
	                'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M',
	                'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z',
	                'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm',
	                'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z'
	        };    //배열안의 문자 숫자는 원하는대로

	        StringBuffer password = new StringBuffer();
	        Random random = new Random();

	        for (int i = 0; i < 15 ; i++) {
	            double rd = random.nextDouble();
	            index = (int) (charSet.length * rd);

	            password.append(charSet[index]);
	        }	
		return password.toString(); 
	}


	@Override
	public int updatePwd(Member member, String password) {
		int result = 0;
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("member", member);
		map.put("password", password);
		
		result = mapper.updatePwd(map);
		
		return result;
	}


	@Override
	public void writeEmail(Member member, String password) {
		String setFrom = ".com"; 
		String toMail = member.getEmail();
		String title = "깐부월드 변경된  임시비밀번호입니다."; 
		String content = 
				"깐부월드를 방문해주셔서 감사합니다." + 	
                "<br><br>" + 
                member.getName()+ "님의 임시 비밀번호는 " + password + "입니다." + 
			    "<br><br>" + 
			    "감사합니다."; 
		mailSend(setFrom, toMail, title, content);
		// 이메일 테스트
		System.out.println(content);
		
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


		@Override
		public MemberMinihome findMinihomeByNo(int userNo) {
			
			return mapper.findMinihomeByNo(userNo);
		}


		@Override
		public int getAcorn(int userNo) {
			// TODO Auto-generated method stub
			return mapper.getAcorn(userNo);
		}

}