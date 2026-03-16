package com.kh.world.friend.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.world.friend.model.mapper.FriendMapper;
import com.kh.world.ilchon.model.vo.IlchonAddMinihome;

@Service
public class FriendServiceImpl implements FriendService {
	
	@Autowired
	private FriendMapper mapper;

	@Override
	public List<IlchonAddMinihome> friendListView(int no) {
		
		return mapper.friendListAll(no);
	}

}