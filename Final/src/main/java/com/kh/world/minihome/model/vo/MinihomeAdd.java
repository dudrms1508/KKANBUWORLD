package com.kh.world.minihome.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class MinihomeAdd {
	
	private int minihomeNo;
	
	private int userNo;
	
	private String profile;
	
	private String intro;
	
	private String title;
	
	private String mood;
	
	private String mbti;
	
	private String miniroom;
	
	private String mhAccess;

	private String theme;
	
}