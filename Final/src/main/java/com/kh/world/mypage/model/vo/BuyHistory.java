package com.kh.world.mypage.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class BuyHistory {
	private int buyNo;
	
	private CartProduct product;
	
	private int userNo;
	
	private Date date;
}
