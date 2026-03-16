package com.kh.world.minihome.model.vo;


import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class COMENT {
	private int c_no;
	private int minihome_no;
	private String coment;
	private Date create_date;
	private String c_writename;
	private int c_writerno;
	
	
	
}
