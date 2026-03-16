package com.kh.world.charge.model.service;

import java.util.HashMap;

import org.springframework.stereotype.Service;

import com.kh.world.charge.model.vo.PaymentVo;
import com.kh.world.member.model.vo.Member;

@Service
public interface ChargeService {

	int insert(HashMap<String, Object> param, int no);

	int update(HashMap<String, Object> param, int no);

	

	

}
