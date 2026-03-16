package com.kh.world;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.kh.world.friend.model.service.FriendService;
import com.kh.world.gift.model.service.GiftService;
import com.kh.world.gift.model.vo.GiftAddMember;
import com.kh.world.ilchon.model.vo.IlchonAddMinihome;
import com.kh.world.member.model.service.MemberService;
import com.kh.world.member.model.vo.Member;
import com.kh.world.minihome.model.service.MinihomeService;
import com.kh.world.minihome.model.vo.MemberMinihome;
import com.kh.world.minihome.model.vo.Minihome;
import com.kh.world.minihome.model.vo.MinihomeTotal;
import com.kh.world.mypage.model.service.MypageService;
import com.kh.world.mypage.model.vo.MinihomeToday;
import com.kh.world.photo.model.vo.Photo;
import com.kh.world.total.model.service.PhotoTotalService;
import com.kh.world.total.model.vo.PhotoTotal;

import lombok.extern.slf4j.Slf4j;

/**
 * Handles requests for the application home page.
 */
@Slf4j
@Controller
@SessionAttributes(value = {"loginMember", "kakaoToken"})
public class HomeController {
	
	@Autowired
	private FriendService friendService;
	
	@Autowired
	private MemberService memberService;
	
	@Autowired
	private MinihomeService minihomeService;
	
	@Autowired
	private PhotoTotalService photoTotalService;
	
	@Autowired
	private MypageService mypageService;
	
	@Autowired
	private GiftService giftService;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public ModelAndView home(@SessionAttribute(value = "loginMember", required = false) Member loginMember,
							 @SessionAttribute(value = "kakaoToken", required = false) String kakaoToken,
							 @ModelAttribute Minihome minihome,
							 @ModelAttribute MinihomeTotal minihomeTotal,
							 @ModelAttribute Photo photo,
					   		 ModelAndView modelAndView) {
		
		log.info("Welcome home!");
		
		// 메인화면 로그인 시 보이는 내 일촌 리스트
		if (loginMember != null) {
			
			int userNo = loginMember.getNo();
			MinihomeToday minihomeToday;
			// giftList
			List<GiftAddMember> giftList = giftService.findGiftMemberByUserNo(userNo);
			modelAndView.addObject("giftList", giftList);
			//
			
			List<IlchonAddMinihome> ilchonList = friendService.friendListView(userNo);
			
			MemberMinihome memberMinihome = memberService.findMinihomeByNo(userNo);
			

			int getAcorn = memberService.getAcorn(userNo);
			
			if(memberMinihome == null) {
				// 미니홈 없는 애들을 위한 임시조치
				minihomeToday = mypageService.findTodayByMinihomeNo(1);
			} else {
				
				minihomeToday = mypageService.findTodayByMinihomeNo(memberMinihome.getMinihomeNo());
			}
			
			
			// 메인 당일 방명록 수
			int visitorCount = minihomeService.visitorCount(userNo);
			// 메인 내 일촌 수
			int ilchonCount = minihomeService.ilchonCount(userNo);
			// 메인 당일 쪽지 수
			int messageCount = minihomeService.messageCount(userNo);
			// 메인 도토리 수
			int acornCount = minihomeService.acornCount(userNo);
			
//			System.out.println(userNo);
			System.out.println(ilchonList);
			System.out.println("memberMinihome : " + memberMinihome);
			System.out.println("홈 로그인하여 리다렉 카카오 토큰 : " + kakaoToken);
			
			modelAndView.addObject("getAcorn", getAcorn);
			modelAndView.addObject("loginMember", loginMember);
			modelAndView.addObject("memberMinihome", memberMinihome);
			modelAndView.addObject("minihomeToday", minihomeToday);
			modelAndView.addObject("list", ilchonList);
			
			// 메인 당일 방명록 수
			modelAndView.addObject("visitorCount", visitorCount);
			// 메인 내 일촌 수
			modelAndView.addObject("ilchonCount", ilchonCount);
			// 메인 당일 쪽지 수
			modelAndView.addObject("messageCount", messageCount);
			// 메인 도토리 수
			modelAndView.addObject("acornCount", acornCount);
			
			modelAndView.setViewName("home");
			
		} else {
			
		}
			
			// 메인화면 조회수 높은 사람 1등, 2등
			if (minihome != null) {
				
				MinihomeTotal minihomeTotalList1 = minihomeService.findMinihomeCountRank1();
				MinihomeTotal minihomeTotalList2 = minihomeService.findMinihomeCountRank2();
				
				System.out.println("minihomeTotalListminihomeTotalList1 : " + minihomeTotalList1);
				System.out.println("minihomeTotalListminihomeTotalList2 : " + minihomeTotalList2);
				
				modelAndView.addObject("minihomeTotalList1", minihomeTotalList1);
				modelAndView.addObject("minihomeTotalList2", minihomeTotalList2);
				
			} else {
				
			}
			
			// 메인화면 조회수 높은 사진첩 게시글 3개
			if (photo != null) {
				
				PhotoTotal findPhotoTotal1 = photoTotalService.findPhotoTotal1();
				PhotoTotal findPhotoTotal2 = photoTotalService.findPhotoTotal2();
				PhotoTotal findPhotoTotal3 = photoTotalService.findPhotoTotal3();
				
//				List<Photo> photoViewList2 = photoTotalService.findPhotoView2();
//				List<Photo> photoViewList3 = photoTotalService.findPhotoView3();
				
//				System.out.println("findPhotoView1 : " + photoViewList1);
				
				System.out.println("findPhotoTotal1 : " + findPhotoTotal1);
				
//				System.out.println("findPhotoView2 : " + photoViewList2);
//				System.out.println("findPhotoView3 : " + photoViewList3);
				
//				modelAndView.addObject("photoViewList1", photoViewList1);
				
				modelAndView.addObject("findPhotoTotal1", findPhotoTotal1);
				modelAndView.addObject("findPhotoTotal2", findPhotoTotal2);
				modelAndView.addObject("findPhotoTotal3", findPhotoTotal3);
				
//				modelAndView.addObject("photoViewList2", photoViewList2);
//				modelAndView.addObject("photoViewList3", photoViewList3);
				
			} else {
				
			}
		
			modelAndView.setViewName("home");
			
			return modelAndView;
	}
	
}