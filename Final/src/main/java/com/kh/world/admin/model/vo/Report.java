package com.kh.world.admin.model.vo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Report {
	private int no;
	private String userId;
	private String category;
	private String content;
	private Date date;
	private String status;
	private String reportCode;
	private int boardNo;
	
}
