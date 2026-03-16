package com.kh.world.setting.model.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.stereotype.Service;

import com.kh.world.minihome.model.vo.Minihome;
import com.kh.world.shop.model.vo.ProductVo;

@Service
public interface SettingService {

	List<ProductVo> getSkinList(int miniNo);

	int updateSearch(HashMap<String, Object> param);

	int updateSkin(HashMap<String, Object> param);

	int updateTheme(Minihome minihomevo);

	Minihome readMinihome(int minihomeNo);

	List<ProductVo> getMusicList(int miniNo);

	int updatembti(HashMap<String, Object> param);



	

}
