package com.kh.world.ilchon.model.vo;

import com.kh.world.member.model.vo.Member;
import com.kh.world.minihome.model.vo.MinihomeAdd;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class IlchonAddMinihome {
	private int indexNo;

	private int userNo;
	
	private int ilchonNo;
	
	private String ilchonNick;
	
	private String ilchonCate;

	private String ilchonStatus;
	
	private Member member;
	
	private MinihomeAdd minihomeAdd;
}
