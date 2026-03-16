package com.kh.world.message.model.vo;

import java.util.Date;
import java.util.List;

import com.kh.world.ilchon.model.vo.Ilchon;
import com.kh.world.member.model.vo.Member;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Answer {
	
	private int answerNo;
	
	private int messageNo;

	private int sender;
	
	private int receiver;
	
	private String answerContnet;
	
	private Date answerDate;
	
	private String status;
	
	private Member member;
	
	private Ilchon ilchon;

}
