package com.kh.world.search.model.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.kh.world.member.model.vo.Member;

@Mapper
public interface UserSearchMapper {

	List<Member> findByName(String searchUser);

}