package com.kh.world.gift.model.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.RowBounds;

import com.kh.world.gift.model.vo.Gift;
import com.kh.world.gift.model.vo.GiftAddMember;
import com.kh.world.gift.model.vo.GiftProduct;
import com.kh.world.gift.model.vo.GiftRelated;
import com.kh.world.member.model.vo.Member;

@Mapper
public interface GiftMapper {

	List<GiftRelated> selectRelatedAll(int no);

	int insertGift(@Param("userNo") int userNo, @Param("productCode") int productCode, @Param("receiverNo") int receiverNo, @Param("content") String content);

	GiftProduct findProductByCode(int productCode);

	int findHaveCount(@Param("receiverNo") int receiverNo, @Param("productCode") int productCode);

	int updateMemberAcorn(@Param("userNo") int userNo, @Param("minusAcorn") int minusAcorn);

	Member findMemberByNo(int userNo);

	List<Gift> findGiftByUserNo(int userNo);

	List<GiftAddMember> findGiftMemberByUserNo(int userNo);

	int selectGiftListCount(int userNo);

//	List<GiftAddMember> selectGiftListPaging(@Param("no") int no, @Param("startList") int startList, @Param("endList") int endList);
	
	List<GiftAddMember> getGiftMemberBoundsByUserNo(int no, RowBounds rowBounds);

	GiftAddMember findGiftByGiftNo(int giftNo);

	int insertMyItem(@Param("userNo") int userNo, @Param("productCode") int productCode);

	int updateGiftProgress(@Param("giftNo") int giftNo, @Param("status") String status);

	int plusMemberAcorn(@Param("userNo") int userNo, @Param("price") int price);

	List<GiftAddMember> findSendGiftHistoryByNo(int userNo);

	int countSendGiftByNo(int userNo);

	List<GiftAddMember> findSendGiftHistoryByNo(int userNo, RowBounds rowBounds);

	int countSendGiftBetween(@Param("userNo") int userNo, @Param("date1") String date1, @Param("date2") String date2);

	List<GiftAddMember> findsendGiftHistoryBetween(@Param("userNo") int userNo, @Param("date1") String date1, @Param("date2") String date2, RowBounds rowBounds);

	int countReceiveGiftByNo(int userNo);

	List<GiftAddMember> findReceiveGiftHistoryByNo(int userNo, RowBounds rowBounds);

	int countReceiveGiftBetween(@Param("userNo") int userNo, @Param("date1") String date1, @Param("date2") String date2);

	List<GiftAddMember> findReceiveGiftHistoryBetween(@Param("userNo") int userNo, @Param("date1") String date1, @Param("date2") String date2, RowBounds rowBounds);

}
