package com.kh.world.visitor.model.vo;

import java.util.Date;

import com.kh.world.member.model.vo.Member;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class VisitorReply {
	private int vreNo;
	
	private int visitorNo;
	
	private Member writer;
	
	private Date createDate;
	
	private Date modifyDate;
	
	private String content;
	
	private String secret;
	
	private String access;
	
	private String status;
	
	private int depth;
	
	private int group;
	
	private int step;
}
