package com.kh.world.banner.model.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.kh.world.notice.model.vo.Notice;

@Mapper
public interface BannerMapper {

	Notice previewNotice(@Param("table") String table);

	int findNoticeNo();

}