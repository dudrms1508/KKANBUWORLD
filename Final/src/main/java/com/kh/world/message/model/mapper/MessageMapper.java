package com.kh.world.message.model.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.kh.world.ilchon.model.vo.Ilchon;
import com.kh.world.message.model.vo.Message;

@Mapper
public interface MessageMapper {
	
	// 쪽지를 보낼 일촌의 정보를 조회한다.
	Ilchon findIlchonByNo(@Param("no") int no, @Param("userNo") int userNo);

	// 인서트용 일촌의 정보를 조회한다.
	Ilchon findMyIlchonByNo(@Param("userNo") int userNo,@Param("ilchonNo") int ilchonNo);
	
	// 쪽지 내용 insert
	int insertMessage(@Param("message") Message message);

	// 보낸 쪽지 내용 조회
	List<Message> selectAllMessage(int no);

	// 받은 쪽지 내용 불러오기
	List<Message> receiveAllMessage(int no);

	// message 목록(no = mNo) 정보 가져오기
	Message selectMessage(int no);

	// message의 정보 가져오자 (읽는용으로 메시지 불러오기)
	Message readMessage(int no);


}
