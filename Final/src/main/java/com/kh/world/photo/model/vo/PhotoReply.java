package com.kh.world.photo.model.vo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class PhotoReply {
	private int no;
	private int photoNo;
	private String writerId;
	private String comment;
	private Date Cdate;
	private Date Mdate;
	private String status;
	
	
}
