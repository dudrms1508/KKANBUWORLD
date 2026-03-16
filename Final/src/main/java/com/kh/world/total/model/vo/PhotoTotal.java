package com.kh.world.total.model.vo;

import java.util.Date;

import com.kh.world.member.model.vo.Member;
import com.kh.world.minihome.model.vo.Minihome;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class PhotoTotal {
	
	private int photoNo;
	
	private int minihomeNo;
	
	private int floderNo;
	
	private String Oname;
	
	private String Rname;
	
	private String url;
	
	private String title;
	
	private String comment;
	
	private Date photoDate;
	
	private Date photoMoDate;
	
	private int photoView;
	
	private String status;
	
	private Member member;
	
	private Minihome minihome;
	
	private int rank;

}