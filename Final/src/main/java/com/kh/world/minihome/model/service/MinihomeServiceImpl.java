package com.kh.world.minihome.model.service;


import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.world.diary.model.vo.Diary;
import com.kh.world.miniBoard.model.vo.Board;
import com.kh.world.minihome.model.mapper.MinihomeMapper;
import com.kh.world.minihome.model.vo.COMENT;
import com.kh.world.minihome.model.vo.MemberMinihome;
import com.kh.world.minihome.model.vo.MinihomeTotal;
import com.kh.world.photo.model.vo.Photo;

@Service
public class MinihomeServiceImpl implements MinihomeService {
	@Autowired
	private MinihomeMapper mapper;

	@Override
	public MinihomeTotal findMinihomeCountRank1() {
		return mapper.findMinihomeCountRank1();
	}
	
	@Override
	public MinihomeTotal findMinihomeCountRank2() {
		
		return mapper.findMinihomeCountRank2();
	}
	
	@Override
	public int getuserno(int minihomeNo) {

		return mapper.selectUserNo(minihomeNo);
	}

	@Override
	public int insertilchonSay(HashMap<String, Object> param) {

		return mapper.insertilchonSay(param);
	}

	@Override
	public List<COMENT> getComnetList(int minihomeNo) {
		// TODO Auto-generated method stub
		return mapper.getCommentList(minihomeNo);
	}

	@Override
	public int updateilchonSay(HashMap<String, Object> param) {

		return mapper.updateilchonSay(param);
	}

	@Override
	public int deleteilchonSay(HashMap<String, Object> param) {

		return mapper.deleteilchonSay(param);
	}

	// 미니홈피 최근 게시글
	@Override
	public List<Board> findBoardNo(int userNo) {
		return mapper.findBoardNo(userNo);
	}
	
	// 미니홈피 최근 사진첩
	@Override
	public List<Photo> findPhotoNo(int minihomeNo) {
		
		return mapper.findPhotoNo(minihomeNo);
	}

	// 미니홈피 최근 다이어리
	@Override
	public List<Diary> findDiaryNo(int minihomeNo) {
		
		return mapper.findDiaryNo(minihomeNo);
	}

	// 미니홈피 게시판 당일 카운트
	@Override
	public int minihomeBoard(int userNo) {
		return mapper.minihomeBoard(userNo);
	}

	// 미니홈피 게시판 총 카운트 
	@Override
	public int minihomeBoardTotal(int userNo) {
		
		return mapper.minihomeBoardTotal(userNo);
	}

	// 미니홈피 사진첩 당일 카운트
	@Override
	public int minihomePhoto(int minihomeNo) {
		
		return mapper.minihomePhoto(minihomeNo);
	}

	// 미니홈피 사진첩 총 카운트 
	@Override
	public int minihomePhotoTotal(int minihomeNo) {
		
		return mapper.minihomePhotoTotal(minihomeNo);
	}

	// 미니홈피 다이어리 당일 카운트
	@Override
	public int minihomeDiary(int minihomeNo) {
		
		return mapper.minihomeDiary(minihomeNo);
	}

	// 미니홈피 다이어리 총 카운트
	@Override
	public int minihomeDiaryTotal(int minihomeNo) {
		
		return mapper.minihomeDiaryTotal(minihomeNo);
	}

	// 미니홈피 방명록 당일 카운트
	@Override
	public int minihomeVisitor(int minihomeNo) {
		
		return mapper.minihomeVisitor(minihomeNo);
	}

	// 미니홈피 방명록 총 카운트
	@Override
	public int minihomeTotal(int minihomeNo) {
		
		return mapper.minihomeTotal(minihomeNo);
	}

	// 메인 당일 방명록 수
	@Override
	public int visitorCount(int userNo) {
		return mapper.visitorCount(userNo);
	}
	
	// 메인 내 일촌 수
	@Override
	public int ilchonCount(int userNo) {
		return mapper.ilchonCount(userNo);
	}

	// 메인 당일 쪽지 수
	@Override
	public int messageCount(int userNo) {
		return mapper.messageCount(userNo);
	}

	// 메인 도토리 수
	@Override
	public int acornCount(int userNo) {
		return mapper.acornCount(userNo);
	}

}