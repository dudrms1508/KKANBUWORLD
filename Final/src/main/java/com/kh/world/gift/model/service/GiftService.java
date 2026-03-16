package com.kh.world.gift.model.service;

import java.util.List;

import com.kh.world.common.util.PageInfo;
import com.kh.world.gift.model.vo.Gift;
import com.kh.world.gift.model.vo.GiftAddMember;
import com.kh.world.gift.model.vo.GiftProduct;
import com.kh.world.gift.model.vo.GiftRelated;
import com.kh.world.member.model.vo.Member;

public interface GiftService {

	List<GiftRelated> findRelatedAll(int no);

	int insertGift(int userNo, int productCode, int receiverNo, String content);

	GiftProduct findProductByCode(int productCode);

	int findHaveCount(int receiverNo, int productCode);

	int updateMemberAcorn(int userNo, int minusAcorn);

	Member findMemberByNo(int userNo);

	List<Gift> findGiftByUserNo(int userNo);

	int getGiftListCount(int userNo);

	List<GiftAddMember> findGiftMemberByUserNo(int userNo);

	// between임
//	List<GiftAddMember> findGiftMemberByUserNo(int no, PageInfo pageInfo);

	List<GiftAddMember> getGiftMemberBoundsByUserNo(int no, PageInfo pageInfo);

	GiftAddMember findGiftByGiftNo(int giftNo);

	int insertMyItem(int userNo, int productCode, int giftNo);

	int giftReject(int giftNo, int userNo, int price);

	List<GiftAddMember> findSendGiftHistoryByNo(int userNo);

	int countSendGiftByNo(int userNo);

	List<GiftAddMember> findSendGiftHistoryByNo(int userNo, PageInfo pageInfo);

	int countSendGiftBetween(int userNo, String date1, String date2);

	List<GiftAddMember> findsendGiftHistoryBetween(int userNo, String date1, String date2, PageInfo pageInfo);

	int countReceiveGiftByNo(int userNo);

	List<GiftAddMember> findReceiveGiftHistoryByNo(int userNo, PageInfo pageInfo);

	int countReceiveGiftBetween(int userNo, String date1, String date2);

	List<GiftAddMember> findReceiveGiftHistoryBetween(int userNo, String date1, String date2, PageInfo pageInfo);



}
