package com.kh.world.join.model.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.kh.world.member.model.vo.Member;

@Mapper
public interface JoinMapper {

	int countMemberById(@Param("id") String id);

	int countMemberByEmail(String email);

	int countMemberByPhone(String phone);

	int insertMember(Member member);
	
	// 카카오 회원가입 insert
	int insertKakaoMember(Member member);

	int insertNewMinihome(@Param("no") int no, @Param("profile") String profile);
	
}
