package com.kh.world.mypage.model.vo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class QnaHistory {
	private int no;
	
	private int userNo;
	
	private String title;
	
	private String email;
	
	private String categoryCode;
	
	private String categoryName;
	
	private String content;
	
	private Date q_Date;
	
	private String answer;
	
	private String status;
	
	private Date a_Date;
}
