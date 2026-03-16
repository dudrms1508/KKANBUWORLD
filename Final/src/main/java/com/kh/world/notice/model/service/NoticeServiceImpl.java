package com.kh.world.notice.model.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.world.common.util.PageInfo;
import com.kh.world.member.model.vo.Member;
import com.kh.world.notice.model.mapper.NoticeMapper;
import com.kh.world.notice.model.vo.Notice;

@Service
public class NoticeServiceImpl implements NoticeService {
	@Autowired
	private NoticeMapper mapper;

	@Override
	public List<Notice> findAll() {
		return mapper.selectAll();
	}

	@Override
	public int getNoticeCount(String type, String keyword) {
		System.out.println(mapper.selectNoticeCount(type, keyword));
		return mapper.selectNoticeCount(type, keyword);
	}

	@Override
	public List<Notice> getNoticeList(PageInfo pageInfo) {
		int limit = pageInfo.getListLimit();
		int offset = (pageInfo.getCurrentPage() -1)* limit ;
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return mapper.selectListAll(rowBounds);
	}

	@Override
	@Transactional
	public int save(Notice notice, Member loginMember) {
		int result = 0;
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("notice", notice);
		map.put("loginMember", loginMember);
		
		
		
		if (notice.getNo()>0) {
			//update
			result = mapper.updateNotice(map);
			
		}else {
			//insert
			result = mapper.insertNotice(map);
		}
		
		return result;
	}

	@Override
	public int isAdmin(Member loginMember) {
		int result = 0;
		int no = loginMember.getNo();
		result = mapper.isAdmin(no);
		
		return result;
	}

	@Override
	public Notice selectNoticeByNo(int no) {
		
		return mapper.selectNoticeByNo(no);
	}

	@Override
	public Notice selectNoticeRownum(int no) {
		
		return mapper.selectNoticeRownum(no);
	}

	// 해당 no의 rownum 가져오는 service
	@Override
	public Notice selectNoticeByRownum(int no) {
		
		return mapper.selectNoticeByRownum(no);
	}

	@Override
	@Transactional
	public int deleteNotice(int no) {
		int result=0;
		result = mapper.deleteNotice(no);
		
		return result;
	}

	@Override
	public List<Notice> search(String type, String keyword, PageInfo pageInfo) {
		List<Notice> list =null;
		int limit = pageInfo.getListLimit();
		int offset = (pageInfo.getCurrentPage() -1)* limit ;
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		Map<String, Object> map = new HashMap<>();
		map.put("type", type);
		map.put("keyword",keyword);
		map.put("rowBounds", rowBounds);
		

		list = mapper.search(map, rowBounds);
		return list;
	}

	



	
}
