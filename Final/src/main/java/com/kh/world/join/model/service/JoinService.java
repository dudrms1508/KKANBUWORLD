package com.kh.world.join.model.service;

import com.kh.world.member.model.vo.Member;

public interface JoinService {

	//이메일 보낼 양식! 
	public String joinEmail(String email);

	public Boolean duplicatedIdCheck(String id);

	public Boolean duplicatedEmailCheck(String email);

	public Boolean duplicatedPhoneCheck(String phone);

	public int insertMember(Member member);

//	public String getAccessToken(String code);
	// 이메일 변경
	public String updateEmailPass(String emailaddress);

	public int insertNewMinihome(int no, String profile);


}
