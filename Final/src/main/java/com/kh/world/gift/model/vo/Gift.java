package com.kh.world.gift.model.vo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Gift {
	private int giftNo;
	
	private int senderNo;
	
	private int receiverNo;
	
	private int productCode;
	
	private String content;
	
	private Date sendDate;
	
	private String progress;
	
	private String cancel;
}
