package com.kh.world.member.model.service;

import java.util.Map;

import com.kh.world.member.model.vo.Member;
import com.kh.world.minihome.model.vo.MemberMinihome;


public interface MemberService {

	Member login(String id, String password);

	Member findPwd(Map<String, Object> map);

	Member findId(Map<String, Object> map);

	String createPwd();

	int updatePwd(Member member, String password);

	void writeEmail(Member member, String password);

	MemberMinihome findMinihomeByNo(int userNo);

	int getAcorn(int userNo);

}