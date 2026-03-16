package com.kh.world.diary.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.world.diary.model.mapper.DiaryMapper;
import com.kh.world.diary.model.vo.Diary;
import com.kh.world.diary.model.vo.DiaryReply;

@Service
public class DiaryServiceImpl implements DiaryService {

	@Autowired
	private DiaryMapper mapper;

	// 다이어리 내용 저장
	@Override
	public int saveDiary(int dNo, int writer, int minihomeNo, Diary diary, String title, String content) {
		int result = 0;
		
		if (diary.getDNo() > 0) {
			// update
			result = mapper.updateDiary(dNo, writer, minihomeNo, diary, title, content);
		} else {
			//insert
			result = mapper.insertDiary(dNo, writer, minihomeNo, diary, title, content);
		}
		return result;
	}

	// 다이어리 리스트 불러오기
	@Override
	public List<Diary> findAllDiary(int writer, int minihomeNo) {
		
		return mapper.findAllDiary(writer, minihomeNo);
	}

	// 게시글 번호 알아오기
	@Override
	public Diary findDiaryByNo(int userNo, int dNo) {
		
		System.out.println("IMPL_userNo");
		System.out.println("IMPL_dNo");
		
		// 더이어리 게시글 번호
		return mapper.findDiaryByNo(userNo, dNo);
	}

	@Override
	public int deleteDiary(int dNo) {
		
		return mapper.deleteDiary(dNo, "N");
	}

	@Override
	public int saveDiaryReply(int minihomeNo, int dNo, int writer, DiaryReply diaryReply, String content) {
		
		
		
		return mapper.insertDiaryReply(minihomeNo, dNo, writer, diaryReply, content);
	}

	
	@Override
	public List<DiaryReply> findReplyByNo(int dNo) {
		return mapper.findReplyByNo(dNo);
	}

	
}
