package com.kh.world.minihome.model.vo;

import com.kh.world.member.model.vo.Member;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class MinihomeTotal {
	
	private int minihomeNo;
	
	private Member member;
	
	private Minihome minihome;
	
	private String profile;
	
	private String intro;
	
	private int count;
	
	private int rank;

}