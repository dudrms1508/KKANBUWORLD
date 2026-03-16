package com.kh.world.gift.model.vo;

import java.util.Date;

import com.kh.world.member.model.vo.Member;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class GiftAddMember {
	private int giftNo;
	
	private Member sender;
	
	private Member receiver;
	
//	private int productCode;

	private GiftProduct product;
	
	private String content;
	
	private Date sendDate;
	
	private String progress;
	
	private String cancel;
}
