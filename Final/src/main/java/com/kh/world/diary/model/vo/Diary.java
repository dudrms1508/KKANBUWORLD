package com.kh.world.diary.model.vo;

import java.util.Date;
import java.util.List;

import com.kh.world.member.model.vo.Member;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Diary {

	private int dNo;
	
	private int minihomeNo; // 미니홈피의 Primay Key - no
	
	private String dCate;
	
	private int writer; 
	
	private String title;
	
	private String content;
	
	private String oFile;
	
	private String rFile;
	
	private String url;
	
	private Date createDate;
	
	private Date modifyDate;
	
	private String status;
	
	private String folder;
	
	private Member member;
	
	private List<DiaryReply> reply;
}
