package com.kh.world.qna.model.service;

import java.util.List;

import com.kh.world.admin.model.vo.QNA;
import com.kh.world.admin.model.vo.QNA_Category;
import com.kh.world.member.model.vo.Member;

public interface QNAService {

	int save(QNA qna, Member loginMember);

	List<QNA_Category> findAll();




}
