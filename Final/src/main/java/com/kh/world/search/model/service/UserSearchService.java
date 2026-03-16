package com.kh.world.search.model.service;

import java.util.List;

import com.kh.world.member.model.vo.Member;

public interface UserSearchService {

	List<Member> findByName(String searchUser);

}