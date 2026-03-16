package com.kh.world.mypage.model.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.world.common.util.PageInfo;
import com.kh.world.gift.model.vo.GiftAddMember;
import com.kh.world.member.model.vo.Member;
import com.kh.world.minihome.model.vo.MemberMinihome;
import com.kh.world.mypage.model.mapper.MypageMapper;
import com.kh.world.mypage.model.vo.BuyHistory;
import com.kh.world.mypage.model.vo.Cart;
import com.kh.world.mypage.model.vo.MinihomeToday;
import com.kh.world.mypage.model.vo.QnaHistory;
import com.kh.world.mypage.model.vo.ReportHistory;

@Service
public class MypageServiceImpl implements MypageService {
	@Autowired
	private MypageMapper mapper;
	
	
	@Override
	@Transactional
	public int updatePassword(int no, String chgPwd) {
		
		return mapper.updatePassword(no, chgPwd);
	}


	@Override
	public Member findMemberById(String id) {
		
		return mapper.returnMemberById(id);
	}

	
	// 정보변경
	@Override
	@Transactional
	public int updateInfo(Member member) {
		
		return mapper.updateInfo(member);
	}

	@Override
	@Transactional
	public int deleteAccount(String id) {
		
		return mapper.deleteMember(id, "N");
	}


	@Override
	public Cart selectCartByNo(int no) {
		
		
		return mapper.selectCartByNo(no);
	}
	
	@Override
	public int findCartProductByNo(int userNo, int productNo) {
		
		return mapper.findCartProductByNo(userNo, productNo);
	}

	@Override
	@Transactional
	public int insertCart(int userNo, int productNo) {
		
		return mapper.insertCart(userNo, productNo);
	}

	@Override
	@Transactional
	public int cartDelete(Map<String, Object> map) {
		
		return mapper.deleteCart(map);
	}


	@Override
	public List<BuyHistory> selectHistoryByNo(int no, PageInfo pageInfo) {
		int limit = pageInfo.getListLimit();
		int offset = (pageInfo.getCurrentPage() - 1) * limit;
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return mapper.selectHistoryByNo(no, rowBounds);
	}


	@Override
	public List<BuyHistory> findHistoryBetween(int no, String date1, String date2, PageInfo pageInfo) {
		int limit = pageInfo.getListLimit();
		int offset = (pageInfo.getCurrentPage() - 1) * limit;
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return mapper.selectHistoryBetween(no, date1, date2, rowBounds);
	}


	@Override
	public List<QnaHistory> findQnaAllByNo(int no, PageInfo pageInfo) {
		int limit = pageInfo.getListLimit();
		int offset = (pageInfo.getCurrentPage() - 1) * limit;
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return mapper.findQnaAllByNo(no, rowBounds);
	}


	@Override
	public int countReportByNo(String userId) {
		
		return mapper.countReportByNo(userId);
	}


	@Override
	public List<ReportHistory> findReportHistory(String userId, PageInfo pageInfo) {
		int limit = pageInfo.getListLimit();
		int offset = (pageInfo.getCurrentPage() - 1) * limit;
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return mapper.findReportHistory(userId, rowBounds);
	}


	@Override
	public int countQnaAllByNo(int userNo) {
		
		return mapper.countQnaAllByNo(userNo);
	}


	@Override
	public ReportHistory findReportByNo(String userId, int reportNo) {
		
		return mapper.findReportByNo(userId, reportNo);
	}


	@Override
	public QnaHistory findQnaByNo(int userNo, int qnaNo) {
		
		return mapper.findQnaByNo(userNo, qnaNo);
	}

	
	// 장바구니 결제 전 마이 아이템 상품 확인
	@Override
	public int findMyItemByCode(int userNo, int[] productCode) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("userNo", userNo);
		map.put("productCode", productCode);
		
		return mapper.findMyItemByCode(map);
	}


	@Override
	public int cartDeleteAfterBuy(Map<String, Object> map) {
		
		return mapper.cartDeleteAfterBuy(map);
	}


	@Override
	@Transactional
	public int insertMyItemByCodes(int userNo, int[] productCode) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("userNo", userNo);
		map.put("productCode", productCode);
		
		return mapper.insertMyItemByCodes(map);
	}


	@Override
	public int countPayHistoryByNo(int userNo) {
		
		return mapper.countPayHistoryByNo(userNo);
	}


	@Override
	public int countPayHistoryBetweenByNo(int userNo, String date1, String date2) {
		
		return mapper.countPayHistoryBetweenByNo(userNo, date1, date2);
	}


	@Override
	public int insertBuyHistoryByNo(int userNo, int[] productCode) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("userNo", userNo);
		map.put("productCode", productCode);
		
		return mapper.insertBuyHistoryByNo(map);
	}


	@Override
	public MinihomeToday findTodayByMinihomeNo(int minihomeNo) {
		
		return mapper.findTodayByMinihomeNo(minihomeNo);
	}








}
