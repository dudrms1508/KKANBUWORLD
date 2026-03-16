package com.kh.world.notice.model.service;

import java.util.List;

import com.kh.world.common.util.PageInfo;
import com.kh.world.member.model.vo.Member;
import com.kh.world.notice.model.vo.Notice;

public interface NoticeService {

	List<Notice> findAll();

	int getNoticeCount(String type, String keyword);

	List<Notice> getNoticeList(PageInfo pageInfo);

	int save(Notice notice, Member loginMember);

	int isAdmin(Member loginMember);

	Notice selectNoticeByNo(int no);

	Notice selectNoticeRownum(int no);

	Notice selectNoticeByRownum(int no);

	int deleteNotice(int no);

	List<Notice> search(String type, String keyword, PageInfo pageInfo);




}
