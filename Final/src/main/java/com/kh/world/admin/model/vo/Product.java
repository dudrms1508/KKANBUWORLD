package com.kh.world.admin.model.vo;

import java.util.Date;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Product {
	private int productCode;
	private String categoryCode;
	private String productName;
	private int productPrice;
	private Date productDate;
	private String status;
	private String productFile;
	private String productUrl;
	
}