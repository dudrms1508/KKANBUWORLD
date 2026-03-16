package com.kh.world.charge.model.mapper;

import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.kh.world.charge.model.vo.PaymentVo;
import com.kh.world.member.model.vo.Member;

@Mapper
public interface ChargeMapper {

	

	int chargeInsert(Map<String, Object> map);

	int chargeUpdate(Map<String, Object> map);

	

}
