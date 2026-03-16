package com.kh.world.notice.model.vo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Notice {
	private int no;
	private int userNo;
	private String title;
	private String content;
	private Date date;
	private int view;
	private String status;
	private int rownum;
	
	
	public Notice(int no, int userNo, String title, String content, Date date, int view, String status) {
		super();
		this.no = no;
		this.userNo = userNo;
		this.title = title;
		this.content = content;
		this.date = date;
		this.view = view;
		this.status = status;
	}
	
	
	
	
	
	
}
