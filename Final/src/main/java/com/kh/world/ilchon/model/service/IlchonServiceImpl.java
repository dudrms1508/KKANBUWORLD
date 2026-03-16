package com.kh.world.ilchon.model.service;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.world.common.util.PageInfo;
import com.kh.world.ilchon.model.mapper.IlchonMapper;
import com.kh.world.ilchon.model.vo.Ilchon;
import com.kh.world.ilchon.model.vo.Request;
import com.kh.world.member.model.vo.Member;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class IlchonServiceImpl implements IlchonService{
	
	@Autowired
	private IlchonMapper mapper;

	// 전체 회원 목록 조회
	@Override
	public List<Member> findAllUsers(PageInfo pageInfo) {
		int limit = pageInfo.getListLimit();
		int offet = (pageInfo.getCurrentPage() -1) * limit;
		RowBounds rowBounds = new RowBounds(offet, limit);
		
		log.info("전체 회원의 정보 불러오기");
		
		return mapper.selectall(rowBounds);
	}
	
	// 보낸 편지함에 request DB 불러오기
	@Override
	public List<Request> saveAllRequest(int no) {
		log.info("보낸 편지함에 request DB 불러오기");
		
		return mapper.selectAllRequest(no);
	}
	
	// 받은 편지함에 request DB 불러오기
	@Override
	public List<Request> receiveAllRequest(int no) {
		log.info("받은 편지함에 request DB 불러오기");
		
		return mapper.receiveAllRequest(no);
	}
	
	
	@Override
	public Member findMemberByNo(int no) {
		log.info("회원의 정보 받아오자");
		
		return mapper.selectMemberNo(no);
	}
	
	
	// 일촌 수락용
	@Override
	public Request acceptIlchon(int no) {
		
		return mapper.selectRequest(no);
	}
	
	
	// Request DB 저장 - 일촌 신청 insert
	@Override
	public int sentRequest(Request request) {
		log.info("회원의 정보를 request 함에 insert");
		int result = 0;
		
		if (request.getRequestNo() > 0) {
			// update
		} else {
			// insert (새로 작성)
			result = mapper.insertRequest(request); 
		}
		return result;
	}
	
	// request Info 가져오기 (일촌리스트 insert용)
	@Override
	public Request receiveRequestInfo(int no, int requestNo) {
		log.info("requestNo & 받는 사람 정보 불러오기");
		
		return mapper.receiveRequestInfo(no, requestNo);
	}
	
	// Ilchon DB 저장 - 일촌 수락 insert
	@Override
	public int sentIlchon(Ilchon ilchon) {
		
		log.info("회원의 정보를 Ilchon 함에 insert");
		int result = 0;
		
		System.out.println("Ilchon DB 저장!!!! " + ilchon);
		result = mapper.insertIlchon(ilchon); 
	
		return result;
	}	
	
	// Ilchon 테이블에 담긴 내 일촌리스트 담아오기
	@Override
	public List<Ilchon> findAllIlchons(PageInfo pageInfo, int no) {
		int limit = pageInfo.getListLimit();
		int offet = (pageInfo.getCurrentPage() -1) * limit;
		RowBounds rowBounds = new RowBounds(offet, limit);
		
		log.info("회원의 정보를 일촌리스트 함에 불러오기");
		
		return mapper.selectIlchonAll(rowBounds, no);
	}
	
	@Override
	public int getIlchonCount(int no) {
		log.info("회원의 카운트");
		return mapper.selectIlchonCount(no);
	}
	
	
	// 전체 일촌의 정보를 가져온다.
	@Override
	public List<Ilchon> findMyIlchons(int no) {
		
		return mapper.findMyIlchons(no);
	}
	
	
	// 내 일촌 목록 + 신청함 유무를 제외한 리스트
	@Override
	public List<Member> exceptMyIlchons(List<Ilchon> ilchons, List<Request> request, int no) {
		log.info("내 일촌이 아닌, 내가 일촌 신청을 보낸 사람이 아닌 사람들의 정보를 불러온다.");
		
		return mapper.exceptMyIlchons(ilchons, request, no);
	}


	@Override
	public List<Ilchon> ilchonSearch(int no, String type, String keyword) {
		List<Ilchon> ilchon = null;
		
		ilchon = mapper.ilchonSearch(no, type, keyword);
		return ilchon;
	}
	
	// 내가 보낸 일촌신청 편지함의 목록을 가져온다.
	@Override
	public List<Request> findMyRequest(int no) {
		
		return mapper.findMyRequest(no);
	}

	// 팝업을 읽는 용으로 사용한다.
	@Override
	public Request readIlchon(int no) {
		
		return mapper.selectReadRequest(no);
	}

	// 보낸편지함의 리스트 정보
	@Override
	public Request sentRequestInfo(int no, int requestNo) {
		
		return mapper.sentRequestInfo(no, requestNo);
	}

	// 수락 버튼 누르면 Y로 값 변경되도록
	@Override
	public String updateRequestStatus(int requestNo) {
		
		return mapper.updateRequestStatus(requestNo);
	}

	//전체 멤버의 숫자
	@Override
	public int getMemberCount() {
		return mapper.getMemberCount();
	}

	// 전체 회원 정보 조회
	@Override
	public List<Member> memberSearch(String type, String keyword) {
		
		return mapper.memberSearch(type, keyword);
	}
	
	
	//나의 일촌이 아닌 Request의 리스트 불러오기
	@Override
	public List<Request> exceptMyRequest(List<Ilchon> ilchons, int no) {
		log.info("내 일촌이 아닌, request 사람들의 정보를 불러온다.");
		
		return mapper.exceptMyRequest(ilchons, no);
	}

	// 일촌리스트에서 활용
	@Override
	public int getuserno(int minihomeNo) {
		
		return mapper.selectUserNo(minihomeNo);
	}

	// 일촌리스트에서 활용 (일촌 끊기용으로 리스트 불러오기)
	@Override
	public Ilchon findMyIlchonByNo(int userNo, int no) {
		log.info("userNo이 나고, no이 내 일촌.");
		
		return mapper.findMyIlchonByNo(userNo, no);
	}

	// 일촌 삭제
	@Override
	public int deleteIlchon(int no) {
		log.info("회원의 정보를 삭제하려고 가져오기");
		
		System.out.println("IMPL에서 no는?" + no);
		
		return mapper.deleteIlchon(no, "N");
	}

	// 일촌명 업데이트
	@Override
	@Transactional
	public int updateilchonNick(int userNo, String ilchonNick, int no) {
		return mapper.updateilchonNick(userNo, ilchonNick, no);
	}




	




}
