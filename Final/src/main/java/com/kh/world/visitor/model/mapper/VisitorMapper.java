package com.kh.world.visitor.model.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.kh.world.member.model.vo.Member;
import com.kh.world.minihome.model.vo.MemberMinihome;
import com.kh.world.minihome.model.vo.Minihome;
import com.kh.world.visitor.model.vo.ReportCategory;
import com.kh.world.visitor.model.vo.Visitor;
import com.kh.world.visitor.model.vo.VisitorReply;

@Mapper
public interface VisitorMapper {

	int insertVisitor(@Param("userNo") int userNo, @Param("minihomeNo") int minihomeNo, 
					@Param("content") String content, @Param("secret") String secret);

	List<Visitor> findAllVisitor(int minihomeNo);

	int insertReply(@Param("writerNo") int writerNo, @Param("visitorNo") int visitorNo, @Param("content") String content);

	Visitor findVisitorByNo(int visitorNo);

	int updateVisitor(@Param("visitorNo") int visitorNo, @Param("content") String content);

	int deleteVisitor(@Param("visitorNo") int visitorNo, @Param("status") String status);
	
	List<ReportCategory> findReportCategory();

	int insertReport(@Param("userId") String userId, @Param("reportCode") String reportCode, @Param("visitorNo") int visitorNo, 
						@Param("categoryCode") String categoryCode, @Param("content") String content);

	MemberMinihome findUserByminihomeNo(int minihomeNo);

	int updateReply(@Param("userNo") int userNo, @Param("visitorNo") int visitorNo, @Param("vreNo") int vreNo, @Param("content") String content);

	VisitorReply findReplyByNo(int vreNo);

	int deleteReply(@Param("vreNo") int vreNo, @Param("userNo") int userNo, @Param("status") String status);

	int insertDepthReply(VisitorReply reply);

	int updateDepth(VisitorReply reply);

	int deleteDepth(VisitorReply reply);


}
