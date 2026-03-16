package com.kh.world.gift.model.service;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.world.common.util.PageInfo;
import com.kh.world.gift.model.mapper.GiftMapper;
import com.kh.world.gift.model.vo.Gift;
import com.kh.world.gift.model.vo.GiftAddMember;
import com.kh.world.gift.model.vo.GiftProduct;
import com.kh.world.gift.model.vo.GiftRelated;
import com.kh.world.member.model.vo.Member;

@Service
public class GiftServiceImpl implements GiftService {
	@Autowired
	private GiftMapper mapper;
	
	@Override
	public List<GiftRelated> findRelatedAll(int no) {
		
		return mapper.selectRelatedAll(no);
	}

	@Override
	@Transactional
	public int insertGift(int userNo, int productCode, int receiverNo, String content) {
		
		return mapper.insertGift(userNo, productCode, receiverNo, content);
	}

	// 상품코드로 상품 찾아오기
	@Override
	public GiftProduct findProductByCode(int productCode) {
		
		return mapper.findProductByCode(productCode);
	}

	@Override
	public int findHaveCount(int receiverNo, int productCode) {
		
		return mapper.findHaveCount(receiverNo, productCode);
	}

	// 선물한 도토리 개수 차감
	@Override
	@Transactional
	public int updateMemberAcorn(int userNo, int minusAcorn) {
		
		return mapper.updateMemberAcorn(userNo, minusAcorn);
	}

	@Override
	public Member findMemberByNo(int userNo) {
		
		return mapper.findMemberByNo(userNo);
	}

	// 선물함에서 선물 리스트 가져오기
	@Override
	public List<Gift> findGiftByUserNo(int userNo) {
		
		return mapper.findGiftByUserNo(userNo);
	}

	// 선물 리스트를 받는 유저, 보내는 유저의 정보까지 가져오는 메소드
	@Override
	public List<GiftAddMember> findGiftMemberByUserNo(int userNo) {
		
		return mapper.findGiftMemberByUserNo(userNo);
	}

	@Override
	public int getGiftListCount(int userNo) {
		
		return mapper.selectGiftListCount(userNo);
	}

	// 선물함 리스트 페이징 처리
//	@Override
//	public List<GiftAddMember> findGiftMemberByUserNo(int no, PageInfo pageInfo) {
//		int startList = pageInfo.getStartList();
//		int endList = pageInfo.getEndList();
//		
//		System.out.println("startList : " + startList);
//		System.out.println("endList : " + endList);
//		
//		return mapper.selectGiftListPaging(no, startList, endList);
//	}

	// 선물함 리스트 페이징 처리 잘 됨 rowBounds로도
	@Override
	public List<GiftAddMember> getGiftMemberBoundsByUserNo(int no, PageInfo pageInfo) {
		int limit = pageInfo.getListLimit();
		int offset = (pageInfo.getCurrentPage() - 1) * limit;
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return mapper.getGiftMemberBoundsByUserNo(no, rowBounds);
	}

	@Override
	public GiftAddMember findGiftByGiftNo(int giftNo) {

		return mapper.findGiftByGiftNo(giftNo);
	}

	// 선물받기 버튼 -> 선물받은거 마이 아이템에 넣기
	@Override
	@Transactional
	public int insertMyItem(int userNo, int productCode, int giftNo) {
		// 마이 아이템에 넣고 그 다음에 선물함의 상태값 바꿔주기(선물받기 완료로)
		int insertResult = 0;
		int updateResult = 0;
		
		insertResult = mapper.insertMyItem(userNo, productCode);
		
		// 성공적으로 넣었을 때
		if(insertResult > 0) {
			System.out.println("myitem에 잘 넣었음"); 
			
			updateResult = mapper.updateGiftProgress(giftNo, "Y");
			
			if(updateResult > 0) {
				System.out.println("선물 받아서 progress 업데이트 완료");
				return 1;
			} else {
				// 선물함 진행상황 update가 실패
				
				return 0;
			}
			
		} else { // insert 실패함
			
			return 0;
		}
	}

	// 선물 거절
	@Override
	public int giftReject(int giftNo, int userNo, int price) {
		int updateResult = 0;
		int plusMemberAcorn = 0;
		
		updateResult = mapper.updateGiftProgress(giftNo, "N");
		
		// progress를 거절로 바꾸는 것을 성공했을 때
		if(updateResult > 0) {
			
			plusMemberAcorn = mapper.plusMemberAcorn(userNo, price);
			
			// 상대방한테 환불도 잘 됨
			if(plusMemberAcorn > 0) {
				// userNo랑 product price 보내주기
				System.out.println("환불 잘 됨");
				
				return 1;
				
			} else { // 상대방한테 환불이 안 됨
				
				return 0;
			}
			
		} else { // progress를 바꾸기 실패..
			
			return 0;
		}
		
		
	}

	@Override
	public List<GiftAddMember> findSendGiftHistoryByNo(int userNo) {
		
		return mapper.findSendGiftHistoryByNo(userNo);
	}

	@Override
	public int countSendGiftByNo(int userNo) {
		
		return mapper.countSendGiftByNo(userNo);
	}

	// 페이징처리해서 가져오는 service
	@Override
	public List<GiftAddMember> findSendGiftHistoryByNo(int userNo, PageInfo pageInfo) {
		int limit = pageInfo.getListLimit();
		int offset = (pageInfo.getCurrentPage() -1)* limit ;
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return mapper.findSendGiftHistoryByNo(userNo, rowBounds);
	}

	@Override
	public int countSendGiftBetween(int userNo, String date1, String date2) {
		
		return mapper.countSendGiftBetween(userNo, date1, date2);
	}

	@Override
	public List<GiftAddMember> findsendGiftHistoryBetween(int userNo, String date1, String date2, PageInfo pageInfo) {
		int limit = pageInfo.getListLimit();
		int offset = (pageInfo.getCurrentPage() -1)* limit ;
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return mapper.findsendGiftHistoryBetween(userNo, date1, date2, rowBounds);
	}

	@Override
	public int countReceiveGiftByNo(int userNo) {
		
		return mapper.countReceiveGiftByNo(userNo);
	}

	@Override
	public List<GiftAddMember> findReceiveGiftHistoryByNo(int userNo, PageInfo pageInfo) {
		int limit = pageInfo.getListLimit();
		int offset = (pageInfo.getCurrentPage() -1)* limit ;
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return mapper.findReceiveGiftHistoryByNo(userNo, rowBounds);
	}

	@Override
	public int countReceiveGiftBetween(int userNo, String date1, String date2) {
		
		return mapper.countReceiveGiftBetween(userNo, date1, date2);
	}

	@Override
	public List<GiftAddMember> findReceiveGiftHistoryBetween(int userNo, String date1, String date2,
			PageInfo pageInfo) {
		int limit = pageInfo.getListLimit();
		int offset = (pageInfo.getCurrentPage() -1)* limit ;
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return mapper.findReceiveGiftHistoryBetween(userNo, date1, date2, rowBounds);
	}





}
