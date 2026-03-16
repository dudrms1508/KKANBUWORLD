package com.kh.world.mypage.model.vo;

import java.util.Date;

import com.kh.world.member.model.vo.Member;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class ReportHistory {
	private int no;
	
	private String categoryCode;
	
	private String categoryName;
	
	private Member member;
	
	private String content;
	
	private Date date;
	
	private String status;
	
	private String result;
	
	private String allpkNo;
	
	private String reportCode;
}
