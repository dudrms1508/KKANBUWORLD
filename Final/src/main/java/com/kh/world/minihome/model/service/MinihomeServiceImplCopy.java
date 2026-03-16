//package com.kh.world.minihome.model.service;
//
//
//import java.util.HashMap;
//
//
//import java.util.List;
//
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.stereotype.Service;
//import com.kh.world.minihome.model.mapper.MinihomeMapper;
//import com.kh.world.minihome.model.vo.COMENT;
//import com.kh.world.minihome.model.vo.MemberMinihome;
//import com.kh.world.minihome.model.vo.Minihome;
//
//import com.kh.world.minihome.model.vo.MinihomeTotal;
//
//@Service
//public class MinihomeServiceImpl implements MinihomeService {
//	@Autowired
//	private MinihomeMapper mapper;
//
//	@Override
//	public List<MinihomeTotal> findMinihomeCountRank1() {
//		return mapper.findMinihomeCountRank1();
//	}
//	
//	@Override
//	public List<MinihomeTotal> findMinihomeCountRank2() {
//		
//		return mapper.findMinihomeCountRank2();
//	}
//	
//	@Override
//	public int getuserno(int minihomeNo) {
//
//		return mapper.selectUserNo(minihomeNo);
//	}
//
//	@Override
//	public int insertilchonSay(HashMap<String, Object> param) {
//
//		return mapper.insertilchonSay(param);
//	}
//
//	@Override
//	public List<COMENT> getComnetList(int minihomeNo) {
//		// TODO Auto-generated method stub
//		return mapper.getCommentList(minihomeNo);
//	}
//
//	@Override
//	public int updateilchonSay(HashMap<String, Object> param) {
//
//		return mapper.updateilchonSay(param);
//	}
//
//	@Override
//	public int deleteilchonSay(HashMap<String, Object> param) {
//
//		return mapper.deleteilchonSay(param);
//	}
//
//
//
//}
//
