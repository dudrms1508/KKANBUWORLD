package com.kh.world.minihome.model.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

@Mapper
public interface MinihomeProMapper {

	int updateIntro(@Param("minihomeNo") int minihomeNo, @Param("userNo") int userNo, @Param("content") String content);

	int updateTitle(@Param("minihomeNo") int minihomeNo, @Param("userNo") int userNo, @Param("title") String title);

}
