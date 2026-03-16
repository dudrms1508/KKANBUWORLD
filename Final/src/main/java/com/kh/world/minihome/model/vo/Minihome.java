package com.kh.world.minihome.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Minihome {
	
	private int minihomeNo;
	
	private int userNo;
	
	private String profile;
	
	private String intro;
	
	private String mood;
	
	private String mbti;
	
	private String miniroom;
	
	private String mhAccess;

	private String theme;

	private String title;
	
	public Minihome(int minihomeNo, int userNo, String profile, String intro, String mood, String mbti, String miniroom,
			String mhAccess, String theme) {
		super();
		this.minihomeNo = minihomeNo;
		this.userNo = userNo;
		this.profile = profile;
		this.intro = intro;
		this.mood = mood;
		this.mbti = mbti;
		this.miniroom = miniroom;
		this.mhAccess = mhAccess;
		this.theme = theme;
	}
	
	
	
}