package com.kh.world.photo.model.vo;

import java.util.Date;
import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Photo {

	private int no;
	private int minihomeNo;
	private int folderNo;
	private String Oname;
	private String Rname;
	private String url;
	private String title;
	private String comment;
	private Date Cdate;
	private Date Mdate;
	private int view;
	private String status;
	private String reportCode;
	private String report;
	private List<PhotoReply> PhotoReply;
	
	
	
}
