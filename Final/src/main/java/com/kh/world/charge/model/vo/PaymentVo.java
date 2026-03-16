package com.kh.world.charge.model.vo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class PaymentVo {

	private String pay_idx;
	private int user_no;	
	private int money;
	private String acorn_amount;
	private Date cash_date;
	
}
