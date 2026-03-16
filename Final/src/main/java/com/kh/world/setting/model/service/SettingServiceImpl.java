package com.kh.world.setting.model.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.world.minihome.model.vo.Minihome;
import com.kh.world.setting.model.mapper.SettingMapper;
import com.kh.world.shop.model.vo.ProductVo;

@Service
public class SettingServiceImpl implements SettingService {

	@Autowired
	SettingMapper settingmapper;

	@Override
	public List<ProductVo> getSkinList(int miniNo) {

		return settingmapper.getSkinList(miniNo);
	}

	@Override
	public int updateSearch(HashMap<String, Object> param) {
		// TODO Auto-generated method stub
		return settingmapper.updateSearch(param);
	}

	@Override
	public int updateSkin(HashMap<String, Object> param) {

		return settingmapper.updateSkin(param);
	}

	@Override
	public int updateTheme(Minihome minihomevo) {

		return settingmapper.updateTheme(minihomevo);
	}

	@Override
	public Minihome readMinihome(int minihomeNo) {

		return settingmapper.readMinihome(minihomeNo);
	}

	@Override
	public List<ProductVo> getMusicList(int miniNo) {
		// TODO Auto-generated method stub
		return settingmapper.getMusicList(miniNo);
	}

	@Override
	public int updatembti(HashMap<String, Object> param) {
		// TODO Auto-generated method stub
		return settingmapper.updatembti(param);
	}


	

}
