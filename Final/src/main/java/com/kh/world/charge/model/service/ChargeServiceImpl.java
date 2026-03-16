package com.kh.world.charge.model.service;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.world.charge.model.mapper.ChargeMapper;
import com.kh.world.charge.model.vo.PaymentVo;
import com.kh.world.member.model.vo.Member;

@Service
public class ChargeServiceImpl implements ChargeService {

	
	 @Autowired private ChargeMapper chargemapper;
	 

	
	  @Override 
	  public int insert(HashMap<String, Object> paymentvo, int no) {		 
	  
	  int result = 0;
		  
	  System.out.println("paymentvo:" + paymentvo);
	  
	  Map<String, Object> map = new HashMap<String, Object>(); 
	  map.put("paymentvo", paymentvo); 
	  map.put("loginMember", no);
	  
	  System.out.println("servicemap:" + map);
	  
	  result = chargemapper.chargeInsert(map);	
	  
	  return result;
	  
	  }



	@Override
	public int update(HashMap<String, Object> paymentvo, int no) {
		int result = 0;
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("paymentvo", paymentvo);
		map.put("loginMember", no);
		
		result = chargemapper.chargeUpdate(map);
		
		return result;
	}
	 
	 
	/*
	 * @Override public int insert(HashMap<String, Object> param, Member
	 * loginMember) {
	 * 
	 * return chargemapper.chargeInsert(param, loginMember.getNo()); }
	 */

}
