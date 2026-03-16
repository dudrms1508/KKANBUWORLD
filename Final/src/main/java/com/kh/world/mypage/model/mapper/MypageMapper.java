package com.kh.world.mypage.model.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.RowBounds;

import com.kh.world.common.util.PageInfo;
import com.kh.world.gift.model.vo.GiftAddMember;
import com.kh.world.member.model.vo.Member;
import com.kh.world.minihome.model.vo.MemberMinihome;
import com.kh.world.mypage.model.vo.BuyHistory;
import com.kh.world.mypage.model.vo.Cart;
import com.kh.world.mypage.model.vo.MinihomeToday;
import com.kh.world.mypage.model.vo.QnaHistory;
import com.kh.world.mypage.model.vo.ReportHistory;

@Mapper
public interface MypageMapper {

	int updatePassword(@Param("no") int no, @Param("chgPwd") String chgPwd);

	Member returnMemberById(String id);

	int updateInfo(Member member);

	int deleteMember(@Param("id") String id, @Param("status") String status);

	Cart selectCartByNo(int no);
	
	int findCartProductByNo(@Param("userNo") int userNo, @Param("productNo") int productNo);
	
	int insertCart(@Param("userNo") int userNo, @Param("productNo") int productNo);

	int deleteCart(Map<String, Object> map);

	List<BuyHistory> selectHistoryByNo(@Param("no") int no, RowBounds rowBounds);

	List<BuyHistory> selectHistoryBetween(@Param("no") int no, @Param("date1") String date1, @Param("date2") String date2, RowBounds rowBounds);

	List<QnaHistory> findQnaAllByNo(int no, RowBounds rowBounds);

	int countReportByNo(String userId);

	List<ReportHistory> findReportHistory(@Param("userId") String userId, RowBounds rowBounds);

	int countQnaAllByNo(int userNo);

	ReportHistory findReportByNo(@Param("userId") String userId, @Param("reportNo") int reportNo);

	QnaHistory findQnaByNo(@Param("userNo") int userNo, @Param("qnaNo") int qnaNo);

	int findMyItemByCode(Map<String, Object> map);

	int cartDeleteAfterBuy(Map<String, Object> map);

	int insertMyItemByCodes(Map<String, Object> map);

	int countPayHistoryByNo(int userNo);

	int countPayHistoryBetweenByNo(@Param("userNo") int userNo, @Param("date1") String date1, @Param("date2") String date2);

	int insertBuyHistoryByNo(Map<String, Object> map);

	MinihomeToday findTodayByMinihomeNo(int minihomeNo);


	


}
