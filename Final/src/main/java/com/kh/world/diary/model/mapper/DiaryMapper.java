package com.kh.world.diary.model.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.kh.world.diary.model.vo.Diary;
import com.kh.world.diary.model.vo.DiaryReply;

@Mapper
public interface DiaryMapper {

	// 미니홈에 해당하는 객체
	//MemberMinihome findMinihomeByNo(int userNo);

	// 다이어리 내용 불러오기
	List<Diary> findAllDiary(@Param("writer")int writer, @Param("minihomeNo") int minihomeNo);
	
	// 다이어리 내용 저장
	int insertDiary(@Param("dNo") int dNo, @Param("writer") int writer, @Param("minihomeNo") int minihomeNo, @Param("diary") Diary diary, @Param("title") String title, @Param("content") String content);

	// 다이어리 내용 수정
	int updateDiary(@Param("dNo") int dNo, @Param("writer") int userNo, @Param("minihomeNo") int minihomeNo, @Param("diary") Diary diary, @Param("title") String title, @Param("content") String content);

	// 다이어리 게시글의 번호 불러오기
	Diary findDiaryByNo(@Param("userNo") int userNo,@Param("dNo") int dNo);

	// 다이어리 삭제
	int deleteDiary(@Param("dNo") int dNo, @Param("status") String status);

	// 다이어리 댓글 입력
	int insertDiaryReply(@Param("minihomeNo") int minihomeNo, @Param("dNo") int dNo, @Param("writer") int writer, @Param("diaryReply") DiaryReply diaryReply, @Param("content") String content);

	List<DiaryReply> findReplyByNo(int dNo);

}
