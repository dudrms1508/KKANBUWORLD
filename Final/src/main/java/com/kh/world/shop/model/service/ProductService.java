package com.kh.world.shop.model.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.stereotype.Service;

import com.kh.world.member.model.vo.Member;
import com.kh.world.shop.model.vo.BuyVo;
import com.kh.world.shop.model.vo.ProductVo;
import com.kh.world.shop.model.vo.musicVo;

@Service
public interface ProductService {

	List<ProductVo> selectProductAll();

	Object buyProduct(int product_code);

	int buyInsert(HashMap<String, Object> param);

	int updateAcorn(HashMap<String, Object> param);

	int updateMyItem(HashMap<String, Object> param);

	List<musicVo> selectProductMusic();

	int selectAcorn(HashMap<String, Object> param);

	int selectProductCount(int product_code, int user_no);

	Object musicdetail(int product_code);


	

	/* int buyInsert(BuyVo buyvo); */

}
