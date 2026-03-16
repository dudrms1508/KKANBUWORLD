package com.kh.world.qna.model.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.world.admin.model.vo.QNA;
import com.kh.world.admin.model.vo.QNA_Category;
import com.kh.world.member.model.vo.Member;
import com.kh.world.qna.model.mapper.QNAMapper;

@Service
public class QNAServiceImpl implements QNAService {
	@Autowired
	private QNAMapper mapper;

	

	@Override
	@Transactional
	public int save(QNA qna, Member loginMember) {
		int result = 0 ;
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("qna", qna);
		map.put("loginMember", loginMember);

		if (qna.getNo()>0) {
			//update
//			result = mapper.updateQNA(qna);
			
		}else {
			//insert
			
			result = mapper.insertQNA(map);
			
		}
		
		return result;
	}



	@Override
	public List<QNA_Category> findAll() {
		
		return mapper.selectAll();
	}






	
	

}
