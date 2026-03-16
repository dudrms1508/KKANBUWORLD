package com.kh.world.mypage.model.service;

import java.util.List;
import java.util.Map;

import com.kh.world.common.util.PageInfo;
import com.kh.world.gift.model.vo.GiftAddMember;
import com.kh.world.member.model.vo.Member;
import com.kh.world.minihome.model.vo.MemberMinihome;
import com.kh.world.mypage.model.vo.BuyHistory;
import com.kh.world.mypage.model.vo.Cart;
import com.kh.world.mypage.model.vo.MinihomeToday;
import com.kh.world.mypage.model.vo.QnaHistory;
import com.kh.world.mypage.model.vo.ReportHistory;

public interface MypageService {

	int updatePassword(int no, String chgPwd);

	Member findMemberById(String id);

	int updateInfo(Member member);

	int deleteAccount(String id);

	Cart selectCartByNo(int no);
	
	int findCartProductByNo(int userNo, int productNo);

	int insertCart(int userNo, int productNo);
	
	int cartDelete(Map<String, Object> map);

	List<BuyHistory> selectHistoryByNo(int no, PageInfo pageInfo);

	List<BuyHistory> findHistoryBetween(int no, String date1, String date2, PageInfo pageInfo);

	List<QnaHistory> findQnaAllByNo(int no, PageInfo pageInfo);

	int countReportByNo(String userId);

	List<ReportHistory> findReportHistory(String userId, PageInfo pageInfo);

	int countQnaAllByNo(int userNo);

	ReportHistory findReportByNo(String userId, int reportNo);

	QnaHistory findQnaByNo(int userNo, int qnaNo);

	int findMyItemByCode(int userNo, int[] productCode);

	int cartDeleteAfterBuy(Map<String, Object> map);

	int insertMyItemByCodes(int userNo, int[] productCode);

	int countPayHistoryByNo(int userNo);

	int countPayHistoryBetweenByNo(int userNo, String date1, String date2);

	int insertBuyHistoryByNo(int userNo, int[] productCode);

	MinihomeToday findTodayByMinihomeNo(int minihomeNo);



	
}
