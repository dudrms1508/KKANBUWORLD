package com.kh.world.gift.model.vo;

import com.kh.world.member.model.vo.Member;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class GiftRelated {
	private int ilchonIdx;
	
	private int userNo;
	
//	private int ilchonNo;
	
	private Member ilchonMember;
	
	private String ilchonNick;
	
	private String ilchonCate;
	
	private String ilchonStatus;
	
	
}
