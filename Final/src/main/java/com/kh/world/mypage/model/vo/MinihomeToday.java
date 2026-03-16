package com.kh.world.mypage.model.vo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class MinihomeToday {
	
	private int minihomeNo;
	
	private int today;
	
	private int total;
	
	private Date date;
}
