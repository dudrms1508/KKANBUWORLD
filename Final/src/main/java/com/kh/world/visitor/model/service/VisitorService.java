package com.kh.world.visitor.model.service;

import java.util.List;

import com.kh.world.member.model.vo.Member;
import com.kh.world.minihome.model.vo.MemberMinihome;
import com.kh.world.minihome.model.vo.Minihome;
import com.kh.world.visitor.model.vo.ReportCategory;
import com.kh.world.visitor.model.vo.Visitor;
import com.kh.world.visitor.model.vo.VisitorReply;

public interface VisitorService {

	int insertVisitor(int userNo, int minihomeNo, String content, String secret);

	List<Visitor> findAllVisitor(int minihomeNo);

	int insertReply(int writerNo, int visitorNo, String content);

	Visitor findVisitorByNo(int visitorNo);

	int updateVisitor(int visitorNo, String content);

	int deleteVisitor(int visitorNo);
	
	List<ReportCategory> findReportCategory();

	int insertReport(String userId, String reportCode, int visitorNo, String categoryCode, String content);

	MemberMinihome findUserByminihomeNo(int minihomeNo);

	int updateReply(int userNo, int visitorNo, int vreNo, String content);

	VisitorReply findReplyByNo(int vreNo);

	int deleteReply(int vreNo, int userNo);

	int insertDepthReply(VisitorReply reply);

	int updateDepth(VisitorReply reply);

	int deleteDepth(VisitorReply reply);



}
