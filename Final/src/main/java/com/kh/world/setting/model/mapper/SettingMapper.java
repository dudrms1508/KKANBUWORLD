package com.kh.world.setting.model.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.kh.world.minihome.model.vo.Minihome;
import com.kh.world.shop.model.vo.ProductVo;

@Mapper
public interface SettingMapper {

	

	List<ProductVo> getSkinList(int miniNo);

	int updateSearch(HashMap<String, Object> param);

	int updateSkin(HashMap<String, Object> param);

	int updateTheme(Minihome minihomevo);

	Minihome readMinihome(int minihomeNo);

	List<ProductVo> getMusicList(int miniNo);

	int updatembti(HashMap<String, Object> param);



}
