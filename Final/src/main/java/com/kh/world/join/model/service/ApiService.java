package com.kh.world.join.model.service;

import java.util.Map;

import com.kh.world.member.model.vo.Member;

public interface ApiService {

	String getReturnAccessToken(String code);

	Map<String, Object> getUserInfo(String access_token);

	void getLogout(String kakaoCheck);

	void unlink(String kakaoCheck);

	Member findMemberKakaoById(String kakaoId);

	int insertKakaoMember(Member member);

}
