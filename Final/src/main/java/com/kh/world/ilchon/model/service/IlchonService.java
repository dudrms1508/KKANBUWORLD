package com.kh.world.ilchon.model.service;

import java.util.List;

import com.kh.world.common.util.PageInfo;
import com.kh.world.ilchon.model.vo.Ilchon;
import com.kh.world.ilchon.model.vo.Request;
import com.kh.world.member.model.vo.Member;

public interface IlchonService {

	// 멤버 리스트 조회
	List<Member> findAllUsers(PageInfo pageInfo);

	// 일촌 신청 팝업에 보내는 사람 값 전달 (파라미터로 전달하는 no는 member의 primary key)
	Member findMemberByNo(int no);
	
	// 보낸 편지함으로 insert
	int sentRequest(Request request);

	// 일촌리스트로 내 일촌 불러오기 + 페이징 처리
	List<Ilchon> findAllIlchons(PageInfo pageInfo, int no);
	
	// 일촌리스트의 count (내 일촌 숫자)
	int getIlchonCount(int no);	
	
	// 보낸 편지함에 request DB 불러오기
	List<Request> saveAllRequest(int no);
	
	// 받은 편지함에 request DB 불러오기
	List<Request> receiveAllRequest(int no);
	
	// 일촌 수락용 팝업 열기
	Request acceptIlchon(int no);
	
	// 내가 보낸 일촌 신청 팝업 열기
	Request readIlchon(int no);
	
	// 일촌 수락용 팝업에서 request DB 가져오기
	Request receiveRequestInfo(int no, int requestNo);
	
	// 일촌신청 메시지 보내기 (일촌리스트로 insert)
	int sentIlchon(Ilchon ilchon);
	
	// (회원 목록 조회에서 활용) 나의 일촌의 목록
	List<Ilchon> findMyIlchons(int no);

	// (회원 목록 조회에서 활용) 일촌 검색용
	List<Ilchon> ilchonSearch(int no, String type, String keyword);

	// (회원 목록 조회에서 활용) 내 일촌 목록을 제외한 리스트
	List<Member> exceptMyIlchons(List<Ilchon> ilchons, List<Request> request, int no);

	// (회원 목록 조회에서 활용) 내가 보낸 편지함 목록을 가져온다.
	List<Request> findMyRequest(int no);

	// (sent용) 보낸 편지함의 보낸사람정보, requestNo 조회
	Request sentRequestInfo(int no, int requestNo);

	String updateRequestStatus(int requestNo);

	// 전체 멤버의 숫자
	int getMemberCount();

	List<Member> memberSearch(String type, String keyword);

	// (inbox에서 활용) 내 일촌 목록을 제외한 신청 목록 리스트
	List<Request> exceptMyRequest(List<Ilchon> ilchons, int no);

	// (일촌 리스트에서 활용)
	int getuserno(int minihomeNo);

	// (일촌 리스트에서 활용) - 일촌 끊기용
	Ilchon findMyIlchonByNo(int userNo, int no);

	// 일촌 삭제
	int deleteIlchon(int no);

	// 일촌명 업데이트
	int updateilchonNick(int userNo, String ilchonNick, int no);







	

	



	




	
	

	


}
