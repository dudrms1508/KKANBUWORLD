package com.kh.world.ilchon.model.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.RowBounds;

import com.kh.world.common.util.PageInfo;
import com.kh.world.ilchon.model.vo.Ilchon;
import com.kh.world.ilchon.model.vo.Request;
import com.kh.world.member.model.vo.Member;

@Mapper
public interface IlchonMapper {

	// 전체 회원 목록 조회
	List<Member> selectall(RowBounds rowBounds);
	
	// 회원 목록(member 중 선택한 멤버의 no 정보 가져오기
	Member selectMemberNo(int no);
	
	// 일촌 신청 메시지 발송 (Request DB로 insert)
	int insertRequest(Request request);

	// 내가 보낸 편지 목록 조회
	List<Request> selectAllRequest(int no);

	// 내가 받은 편지 목록 조회
	List<Request> receiveAllRequest(int no);

	// request 신청 목록(no = RequestNo) 정보 가져오기
	Request selectRequest(int no);
	
	// 내가 보낸 일촌 신청 팝업 읽는용으로 열기
	//Request readIlchon(@Param("no") int no);
	
	// 수락한 일촌의 메시지 목록 (ILCHON DB로 insert)
	int insertIlchon(Ilchon ilchon);
	
	// 전체 일촌 목록 조회 + RowBounds 매개변수로 담기 + login 한 사람의 no 값
	List<Ilchon> selectIlchonAll(@Param("rowBounds") RowBounds rowBounds, @Param("no") int no);

	// 전체 일촌의 숫자 카운트
	int selectIlchonCount(int no);

	// 신청함의 전체 정보 가져오기
	Request selectAllIlchon();

	// request Info 가져오기 (일촌리스트 insert용)
	Request receiveRequestInfo(@Param("no") int no, @Param("requestNo") int requestNo);

	// 보낸편지함의 목록 불러오기용
	Request sentRequestInfo(@Param("no")int no, @Param("requestNo") int requestNo);
	
	// 전체 일촌의 정보 확인
	List<Ilchon> findMyIlchons(@Param("no") int no);
	
	// 내 일촌이 아닌 사람의 리스트를 서치한다. (일촌리스트로 조회된 것 중 일촌 제외)
	List<Member> exceptMyIlchons(@Param("ilchons") List<Ilchon> ilchons, @Param("request") List<Request> request, @Param("no") int no);

	// 일촌리스트에서 검색
	List<Ilchon> ilchonSearch(@Param("no") int no, @Param("type")String type, @Param("keyword")String keyword);

	// 내가 보낸 일촌 신청함 목록 리스트를 불러온다.
	List<Request> findMyRequest(int no);

	String updateRequestStatus(int requestNo);

	// 전체 멤버의 숫자 카운트 
	int getMemberCount();

	// 전체 회원의 정보 조회
	List<Member> memberSearch(@Param("type")String type, @Param("keyword")String keyword);

	// 내 일촌이 아닌 사람의 request 리스트를 서치한다. (inbox로 조회된 것 중 일촌 제외)
	List<Request> exceptMyRequest(@Param("ilchons") List<Ilchon> ilchons, @Param("no") int no);

	// 미니홈피 번호 가져오기
	int selectUserNo(int minihomeNo);
	
	// 일촌 리스트 정보 불러오기
	Ilchon findMyIlchonByNo(@Param("userNo") int userNo, @Param("no") int no);

	// 일촌 삭제
	int deleteIlchon(@Param("no") int no, @Param("status") String status);

	// 일촌평 업데이트
	int updateilchonNick(@Param("userNo") int userNo,@Param("ilchonNick") String ilchonNick, @Param("no") int no);

	// readModal용으로
	Request selectReadRequest(int no);


	

}
