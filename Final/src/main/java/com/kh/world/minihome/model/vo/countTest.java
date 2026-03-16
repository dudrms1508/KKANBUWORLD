package com.kh.world.minihome.model.vo;

import com.kh.world.member.model.vo.Member;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class countTest {
	
	private int minihomeNo;
	
	private Member member;
	
	private String profile;
	
	private int count;
	
	private int rank;
	
}
