package com.kh.world.member.model.mapper;

import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.kh.world.member.model.vo.Member;
import com.kh.world.minihome.model.vo.MemberMinihome;

@Mapper
public interface MemberMapper {

	Member selectMemberById(@Param("id") String id);

	Member findId(Map<String, Object> map);

	Member findPwd(Map<String, Object> map);

	int updatePwd(Map<String, Object> map);

	MemberMinihome findMinihomeByNo(int userNo);

	int getAcorn(int userNo);

}