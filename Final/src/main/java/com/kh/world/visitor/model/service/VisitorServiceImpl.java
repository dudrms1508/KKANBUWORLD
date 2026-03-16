package com.kh.world.visitor.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.world.minihome.model.vo.MemberMinihome;
import com.kh.world.minihome.model.vo.Minihome;
import com.kh.world.visitor.model.mapper.VisitorMapper;
import com.kh.world.visitor.model.vo.ReportCategory;
import com.kh.world.visitor.model.vo.Visitor;
import com.kh.world.visitor.model.vo.VisitorReply;

@Service
public class VisitorServiceImpl implements VisitorService {
	@Autowired
	private VisitorMapper mapper;
	
	@Override
	@Transactional
	public int insertVisitor(int userNo, int minihomeNo, String content, String secret) {
		
		return mapper.insertVisitor(userNo, minihomeNo, content, secret);
	}

	// 해당 미니홈피번호에 해당하는 방명록 전부 가져오기
	@Override
	public List<Visitor> findAllVisitor(int minihomeNo) {
		
		return mapper.findAllVisitor(minihomeNo);
	}

	@Override
	@Transactional
	public int insertReply(int writerNo, int visitorNo, String content) {
		
		return mapper.insertReply(writerNo, visitorNo, content);
	}

	@Override
	public Visitor findVisitorByNo(int visitorNo) {
		
		return mapper.findVisitorByNo(visitorNo);
	}

	@Override
	@Transactional
	public int updateVisitor(int visitorNo, String content) {
		
		return mapper.updateVisitor(visitorNo, content);
	}

	@Override
	public int deleteVisitor(int visitorNo) {
		
		return mapper.deleteVisitor(visitorNo, "N");
	}
	
	@Override
	public List<ReportCategory> findReportCategory() {
		
		return mapper.findReportCategory();
	}

	@Override
	@Transactional
	public int insertReport(String userId, String reportCode, int visitorNo, String categoryCode, String content) {
		
		return mapper.insertReport(userId, reportCode, visitorNo, categoryCode, content);
	}

	
	@Override
	public MemberMinihome findUserByminihomeNo(int minihomeNo) {
		
		return mapper.findUserByminihomeNo(minihomeNo);
	}

	// 댓글 수정
	@Override
	@Transactional
	public int updateReply(int userNo, int visitorNo, int vreNo, String content) {
		
		return mapper.updateReply(userNo, visitorNo, vreNo, content);
	}

	@Override
	public VisitorReply findReplyByNo(int vreNo) {
		
		return mapper.findReplyByNo(vreNo);
	}

	@Override
	public int deleteReply(int vreNo, int userNo) {
		
		return mapper.deleteReply(vreNo, userNo, "N");
	}

	
	@Override
	@Transactional
	public int insertDepthReply(VisitorReply reply) {
		
		return mapper.insertDepthReply(reply);
	}

	@Override
	@Transactional
	public int updateDepth(VisitorReply reply) {
		
		return mapper.updateDepth(reply);
	}

	@Override
	@Transactional
	public int deleteDepth(VisitorReply reply) {
		
		return mapper.deleteDepth(reply);
	}


}
