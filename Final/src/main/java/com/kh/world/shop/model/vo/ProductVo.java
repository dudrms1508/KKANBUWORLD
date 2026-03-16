package com.kh.world.shop.model.vo;

import java.util.Date;

import com.kh.world.mypage.model.vo.MyItem;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ProductVo {

	private int product_code;
	private String category_code;
	private String product_name;
	private int product_money;
	private Date product_date;
	private String status;
	private String product_file;
	private String product_url;
	
	private MyItem myitem;
	
}
 