package com.kh.world.ilchon.model.vo;

import java.util.Date;
import java.util.List;

import com.kh.world.member.model.vo.Member;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Request {
	private int requestNo;

	private int sender;
	
	private int receiver;
	
	private String ilchonNick;
	
	private String requestTitle;
	
	private String requestContent;
	
	private Date requestDate;
	
	private String requestStatus;
	
	private Member member;
}