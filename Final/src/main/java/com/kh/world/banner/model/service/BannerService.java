package com.kh.world.banner.model.service;

import com.kh.world.notice.model.vo.Notice;

public interface BannerService {

	Notice getNoticeList(String table);

	int findNoticeNo();

}