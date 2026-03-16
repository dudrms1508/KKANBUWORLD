package com.kh.world.message.model.service;

import java.util.List;

import com.kh.world.ilchon.model.vo.Ilchon;
import com.kh.world.message.model.vo.Answer;
import com.kh.world.message.model.vo.Message;

public interface MessageService {
	
	// 일촌의 번호를 조회 (메시지 보내려고)
	Ilchon findIlchonByNo(int no, int userNo);

	// 일촌 신청 insert 용으로 내 일촌 찾기
	Ilchon findMyIlchonByNo(int userNo, int ilchonNo);
	
	// 쪽지 발송
	int sentMessage(Message message);
	
	// 메시지 함의 모든 메시지 불러오기
	List<Message> saveAllMessage(int no);

	// 받은 편지함에 모든 메시지 불러오기
	List<Message> receiveAllMessage(int no);

	// 메시지 답변용으로 불러오기
	Message answerMessage(int no);

	// 메시지 전체 리스트의 정보 불러오기
	Answer findMyMessage(int no);

	// 내가 보낸 편지 읽는용으로 불러오기
	Message readMessage(int no);

}
