package com.kh.world.shop.model.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.kh.world.member.model.vo.Member;
import com.kh.world.shop.model.vo.BuyVo;
import com.kh.world.shop.model.vo.ProductVo;
import com.kh.world.shop.model.vo.musicVo;

@Mapper
public interface ProductMapper {


	List<ProductVo> selectProduct();

	Object selectBuyProduct(int product_code);

	int insertBuyProduct(HashMap<String, Object> map);

	int updateAcorn(HashMap<String, Object> param);

	int updateMyItem(HashMap<String, Object> param);

	List<musicVo> selectProductBgm();

	int selectAcorn(HashMap<String, Object> param);

	int selectProductCount(@Param("product_code") int product_code,@Param("user_no") int user_no);

	Object musicdetail(int product_code);

	

	/* int insertBuyProduct(BuyVo buyvo); */

	
	
	
}
