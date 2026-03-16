package com.kh.world.diary.model.service;

import java.util.List;

import com.kh.world.diary.model.vo.Diary;
import com.kh.world.diary.model.vo.DiaryReply;
import com.kh.world.minihome.model.vo.MemberMinihome;

public interface DiaryService {

	// 다이어리 내용 저장
	int saveDiary(int dNo, int writer, int minihomeNo, Diary diary, String title, String content);

	// 다이어리 DB 내용 불러오기 
	List<Diary> findAllDiary(int writer, int minihomeNo);

	//다이어리 게시글의 No 가져오기
	Diary findDiaryByNo(int userNo, int dNo);

	// 다이어리 게시글 삭제
	int deleteDiary(int dNo);

	// 다이어리 게시글에 댓글 등록
	int saveDiaryReply(int minihomeNo, int dNo, int writer, DiaryReply diaryReply, String content);

	// 다이어리 댓글 
	List<DiaryReply> findReplyByNo(int dNo);




}
