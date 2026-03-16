package com.kh.world.admin.model.mapper;

import java.util.List;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.RowBounds;

import com.kh.world.admin.model.vo.Product;
import com.kh.world.admin.model.vo.QNA;
import com.kh.world.admin.model.vo.Report;
import com.kh.world.member.model.vo.Member;

@Mapper
public interface AdminMapper {
	
	//회원관리
	int selectMemberCount();

	List<Member> selectAllMember(RowBounds bounds);
	
	int changeStatus(@Param("no") int no, @Param("state") String state);
	
	//상품관리
	int selectProductCount(@Param("product") String product);

	List<Product> selectAllProduct(RowBounds rowBounds, @Param("product") String product);

	int insertProduct(Product product);
	
	int updateProduct(Product product);

	int productStatus(@Param("no") int no, @Param("state") String state);
	
	int deleteProduct(@Param("no") int no);
	
	int selectTableCount(@Param("table") String table);

	//문의관리
	List<QNA> selectAllQna(RowBounds rowBounds);
	QNA selectQnaByNo(@Param("no") int no);
	int deleteQnaByNo(int no);

	//신고
	List<Report> selectAllReport(RowBounds rowBounds);

	Member selectMemberById(String id);

	int deleteReportByNo(int no);





}
