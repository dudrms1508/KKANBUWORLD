package com.kh.world.qna.model.mapper;

import java.util.List;
import java.util.Map;

import com.kh.world.admin.model.vo.QNA_Category;

public interface QNAMapper {

	int insertQNA(Map<String, Object> map);

	List<QNA_Category> selectAll();
	
}
