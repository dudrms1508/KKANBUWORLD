package com.kh.world.shop.model.vo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class BuyVo {
	
	private int buy_idx;
	
	private int product_code;
	
	private int user_no;
	
	private Date pay_date;
	

}
