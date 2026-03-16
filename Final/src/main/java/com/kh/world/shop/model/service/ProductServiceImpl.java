package com.kh.world.shop.model.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.world.member.model.vo.Member;
import com.kh.world.shop.model.mapper.ProductMapper;
import com.kh.world.shop.model.vo.BuyVo;
import com.kh.world.shop.model.vo.ProductVo;
import com.kh.world.shop.model.vo.musicVo;

@Service
public class ProductServiceImpl implements ProductService {
	
	@Autowired
	private ProductMapper productmapper;

	@Override
	public List<ProductVo> selectProductAll() {
	
		
		return productmapper.selectProduct();
	}

	@Override
	public Object buyProduct(int product_code) {

		return productmapper.selectBuyProduct(product_code);
	}

	
	  @Override
	  public int buyInsert(HashMap<String, Object> param) {  
	  	  
	  return productmapper.insertBuyProduct(param); 
	  }

	@Override
	public int updateAcorn(HashMap<String, Object> param) {
		// TODO Auto-generated method stub
		return productmapper.updateAcorn(param);
	}

	@Override
	public int updateMyItem(HashMap<String, Object> param) {
		// TODO Auto-generated method stub
		return productmapper.updateMyItem(param);
	}

	@Override
	public List<musicVo> selectProductMusic() {

		return productmapper.selectProductBgm();
	}

	@Override
	public int selectAcorn(HashMap<String, Object> param) {
		// TODO Auto-generated method stub
		return productmapper.selectAcorn(param);
	}

	public int selectProductCount(int product_code, int user_no) {
		// TODO Auto-generated method stub
		return productmapper.selectProductCount(product_code, user_no);
	}

	@Override
	public Object musicdetail(int product_code) {

		return productmapper.musicdetail(product_code);
	}



	 

	/*
	 * @Override public int buyInsert(BuyVo buyvo) { // TODO Auto-generated method
	 * stub return productmapper.insertBuyProduct(buyvo); }
	 */


}
