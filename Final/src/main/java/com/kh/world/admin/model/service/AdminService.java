package com.kh.world.admin.model.service;

import java.util.List;
import com.kh.world.admin.model.vo.Product;
import com.kh.world.admin.model.vo.QNA;
import com.kh.world.admin.model.vo.Report;
import com.kh.world.common.util.PageInfo;
import com.kh.world.member.model.vo.Member;

public interface AdminService {
	//회원관리
	int getMemberCount();

	List<Member> findAllMember(PageInfo pageInfo);
		
	int save(int no, String state);
	
	//문의
	List<QNA> findAllQna(PageInfo pageInfo);	
	QNA findQnaByNo(int no);
	int deleteQna(int no);
	
	//신고
	List<Report> findAllReport(PageInfo pageInfo);	
	void sendEmail(String email);
	int deleteReport(int no);
	
	//상품관리
	int getProductCount(String product);
	
	List<Product> findAllProduct(PageInfo pageInfo, String product);
	
	int save(Product product);

	int deleteProduct(int no, String state);

	int getTableCount(String table);

	Member findMemberById(String id);




	

	


	

	
	
}
