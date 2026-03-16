package com.kh.world.minihome.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.world.minihome.model.mapper.MinihomeProMapper;

@Service
public class MinihomeProServiceImpl implements MinihomeProService {
	@Autowired
	private MinihomeProMapper mapper;
	
	@Override
	@Transactional
	public int updateIntro(int minihomeNo, int userNo, String content) {
		
		return mapper.updateIntro(minihomeNo, userNo, content);
	}

	@Override
	@Transactional
	public int updateTitle(int minihomeNo, int userNo, String title) {
		
		return mapper.updateTitle(minihomeNo, userNo, title);
	}

}
