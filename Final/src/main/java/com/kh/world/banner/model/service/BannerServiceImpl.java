package com.kh.world.banner.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.world.banner.model.mapper.BannerMapper;
import com.kh.world.notice.model.vo.Notice;

@Service
public class BannerServiceImpl implements BannerService {
	@Autowired
	private BannerMapper mapper;

	@Override
	public Notice getNoticeList(String table) {
		return mapper.previewNotice(table);
	}

	@Override
	public int findNoticeNo() {
		return mapper.findNoticeNo();
	}
	
}