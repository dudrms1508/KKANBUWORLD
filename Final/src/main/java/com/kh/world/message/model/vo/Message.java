package com.kh.world.message.model.vo;

import java.util.Date;
import java.util.List;

import com.kh.world.member.model.vo.Member;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Message {
	
	private int messageNo;

	private int userNo;
	
	private int ilchonNo;
	
	private String messageTitle;
	
	private String messageContnet;
	
	private Date sendDate;

	private Date readDate;
	
	private int read;
	
	private String status;
	
	private Member member;
	
	private Member ilchon;
	
	private List<Answer> answers;
	
}

