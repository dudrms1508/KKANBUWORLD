package com.kh.world.message.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.world.ilchon.model.vo.Ilchon;
import com.kh.world.message.model.mapper.MessageMapper;
import com.kh.world.message.model.vo.Answer;
import com.kh.world.message.model.vo.Message;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class MessageServiceImpl implements MessageService {
	
	@Autowired
	private MessageMapper mapper;
	
	// 일촌에게 메시지 보내는용
	@Override
	public Ilchon findIlchonByNo(int no, int userNo) {
		System.out.println("일촌번호 찾아라 IML");
		
		System.out.println(no);
		
		return mapper.findIlchonByNo(no, userNo);
	}
	
	// (일촌 쪽지 발송용) 내 일촌 찾기
	@Override
	public Ilchon findMyIlchonByNo(int userNo, int ilchonNo) {
		log.info("회원의 정보를 조회해서 메시지 함에 insert하자");
		
		System.out.println(userNo);
		System.out.println(ilchonNo);
		
		return mapper.findMyIlchonByNo(userNo, ilchonNo);
	}

	// 메시지 insert 하기
	@Override
	public int sentMessage(Message message) {
		log.info("회원의 정보를 메시지 함에 insert");
		int result = 0;
		
		if (message.getMessageNo() > 0) {
			// update
		} else {
			// insert (새로 작성)
			result = mapper.insertMessage(message); 
		}
		return result;
	}

	// 보낸 쪽지함 불러오기
	@Override
	public List<Message> saveAllMessage(int no) {
		
		return mapper.selectAllMessage(no);
	}

	// 받은 쪽지함 불러오기
	@Override
	public List<Message> receiveAllMessage(int no) {
		return mapper.receiveAllMessage(no);
	}

	// 메시지에서 답변할 수 있게 view 불러오기
	@Override
	public Message answerMessage(int no) {
		
		return mapper.selectMessage(no);
	}

	// 답변 DB에 넣기 전 메시지 리스트 불러오기
	@Override
	public Answer findMyMessage(int no) {
		log.info("메시지의 정보를 찾아라");
		
		return null;
	}

	// 내가 보낸 편지 읽는용으로 
	@Override
	public Message readMessage(int no) {
		log.info("메시지 읽는용으로");
		
		return mapper.readMessage(no);
	}
	

	

}
