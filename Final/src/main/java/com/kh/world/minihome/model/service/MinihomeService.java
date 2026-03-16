package com.kh.world.minihome.model.service;



import java.util.HashMap;
import java.util.List;

import com.kh.world.diary.model.vo.Diary;
import com.kh.world.miniBoard.model.vo.Board;
import com.kh.world.minihome.model.vo.COMENT;
import com.kh.world.minihome.model.vo.MemberMinihome;
import com.kh.world.minihome.model.vo.MinihomeTotal;
import com.kh.world.photo.model.vo.Photo;

public interface MinihomeService {

	MinihomeTotal findMinihomeCountRank1();

	MinihomeTotal findMinihomeCountRank2();
	
	int getuserno(int minihomeNo);

	int insertilchonSay(HashMap<String, Object> param);

	List<COMENT> getComnetList(int minihomeNo);

	int updateilchonSay(HashMap<String, Object> param);

	int deleteilchonSay(HashMap<String, Object> param);

	// 미니홈피 최근 게시글
	List<Board> findBoardNo(int userNo);
	
	// 미니홈피 최근 사진첩
	List<Photo> findPhotoNo(int minihomeNo);

	// 미니홈피 최근 다이어리
	List<Diary> findDiaryNo(int minihomeNo);

	// 미니홈피 게시판 당일 카운트
	int minihomeBoard(int userNo);

	// 미니홈피 게시판 총 카운트 
	int minihomeBoardTotal(int userNo);

	// 미니홈피 사진첩 당일 카운트
	int minihomePhoto(int minihomeNo);

	// 미니홈피 사진첩 총 카운트 
	int minihomePhotoTotal(int minihomeNo);

	// 미니홈피 다이어리 당일 카운트
	int minihomeDiary(int minihomeNo);

	// 미니홈피 다이어리 총 카운트
	int minihomeDiaryTotal(int minihomeNo);

	// 미니홈피 방명록 당일 카운트
	int minihomeVisitor(int minihomeNo);

	// 미니홈피 방명록 총 카운트
	int minihomeTotal(int minihomeNo);

	// 메인 당일 방명록 수
	int visitorCount(int userNo);
	
	// 메인 내 일촌 수
	int ilchonCount(int userNo);

	// 메인 당일 쪽지 수
	int messageCount(int userNo);
	
	// 메인 도토리 수
	int acornCount(int userNo);

}