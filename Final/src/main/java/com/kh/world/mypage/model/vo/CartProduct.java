package com.kh.world.mypage.model.vo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class CartProduct {
	private int code;
	
	private String categoryCode;
	
	private String name;
	
	private int price;
	
	private Date date;
	
	private String status;
	
	private String file;
	
	private String url;
	
}
