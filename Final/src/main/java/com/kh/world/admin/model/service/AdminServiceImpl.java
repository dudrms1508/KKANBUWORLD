package com.kh.world.admin.model.service;

import java.util.List;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.world.admin.model.mapper.AdminMapper;
import com.kh.world.admin.model.vo.Product;
import com.kh.world.admin.model.vo.QNA;
import com.kh.world.admin.model.vo.Report;
import com.kh.world.common.util.PageInfo;
import com.kh.world.member.model.vo.Member;

@Service
public class AdminServiceImpl implements AdminService {
	
	@Autowired
	private AdminMapper mapper;
	
	@Autowired
	private JavaMailSender mailSender;
	
	//공통코드
	@Override
	public int getMemberCount() {
		return mapper.selectMemberCount();
	}
	
	
	//회원관리
	@Override
	public List<Member> findAllMember(PageInfo pageInfo) {
		int limit = pageInfo.getListLimit();
		int offset = (pageInfo.getCurrentPage() -1) * limit;
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return mapper.selectAllMember(rowBounds);
	}
	
	@Override
	public Member findMemberById(String id) {
		
		return mapper.selectMemberById(id);
	}
	
	//회원정지삭제
	@Override
	public int save(int no, String state) {
		int result = 0;
		result = mapper.changeStatus(no, state);
		return result;
	}

	//상품관리
	@Override
	public int getProductCount(String product) {
		return mapper.selectProductCount(product);
	}

	@Override
	public List<Product> findAllProduct(PageInfo pageInfo, String product) {
		int limit = pageInfo.getListLimit();
		int offset = (pageInfo.getCurrentPage() -1) * limit;
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return mapper.selectAllProduct(rowBounds, product);
	}
	
	@Override
	public int deleteProduct(int no, String state) {
		int result = 0;
		if (state.equals("NULL")) {		
			result = mapper.deleteProduct(no);			
		}else {
			result = mapper.productStatus(no, state);
		}
		return result;
	}

	
	@Override
	@Transactional
	public int save(Product product) {
		int result = 0;
		
		if (product.getProductCode() > 0) {
			//update
			result = mapper.updateProduct(product);
			
		}else {
			//insert
			result = mapper.insertProduct(product);
		}
		
		return result;
	}
	
	//문의
	@Override
	public List<QNA> findAllQna(PageInfo pageInfo) {
		int limit = pageInfo.getListLimit();
		int offset = (pageInfo.getCurrentPage() -1) * limit;
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return mapper.selectAllQna(rowBounds);
	}
	
	@Override
	public QNA findQnaByNo(int no) {
		
		return mapper.selectQnaByNo(no);
	}

	@Override
	public int getTableCount(String table) {
		
		return mapper.selectTableCount(table);
	}

	@Override
	public int deleteQna(int no) {
		int result = mapper.deleteQnaByNo(no);
	
		return result;
	}
	
	//신고
	@Override
	public List<Report> findAllReport(PageInfo pageInfo) {
		int limit = pageInfo.getListLimit();
		int offset = (pageInfo.getCurrentPage() -1) * limit;
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return mapper.selectAllReport(rowBounds);
	}
	
	@Override
	public int deleteReport(int no) {
		int result = mapper.deleteReportByNo(no);
		
		return result;
	}


	//이메일
	@Override
	public void sendEmail(String email) {
		String setFrom = ".com"; 
		String toMail = email;
		String title = "깐부월드 고객센터 입니다."; 
		String content = 
				"접수가 완료 됐습니다. 확인 후 조치하겠습니다."  + 
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

	
}
