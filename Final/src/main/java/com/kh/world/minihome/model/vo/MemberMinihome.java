package com.kh.world.minihome.model.vo;

import com.kh.world.member.model.vo.Member;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class MemberMinihome {
	
	private int minihomeNo;
	
	private Member member;
	
	private String profile;
	
	private String intro;
	
	private String mood;
	
	private String mbti;
	
	private String miniroom;
	
	private String mhAccess;

	private String theme;

}