package com.kh.world.search.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.world.member.model.vo.Member;
import com.kh.world.search.model.mapper.UserSearchMapper;

@Service
public class UserSearchServiceImpl implements UserSearchService {
	
	@Autowired
	private UserSearchMapper mapper;

	@Override
	public List<Member> findByName(String searchUser) {
		
		return mapper.findByName(searchUser);
	}

}