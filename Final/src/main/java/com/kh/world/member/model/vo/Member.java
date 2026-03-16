package com.kh.world.member.model.vo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
@Data
@NoArgsConstructor
@AllArgsConstructor
public class Member {
	private int no;

	private String id;
	
	private String password;
	
	private String name;
	
	private String role;
	
	private String phone;
	
	private String email;
	
	private int birth;
	
	private String address;
	
	private String searchMe;
	
	private String gender;
	
	private String minimi;
	
	private Date createDate;
	
	private int acorn;
	
	private String status;
}
