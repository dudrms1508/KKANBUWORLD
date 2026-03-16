package com.kh.world.gift.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.kh.world.common.util.PageInfo;
import com.kh.world.gift.model.service.GiftService;
import com.kh.world.gift.model.vo.Gift;
import com.kh.world.gift.model.vo.GiftAddMember;
import com.kh.world.gift.model.vo.GiftProduct;
import com.kh.world.gift.model.vo.GiftRelated;
import com.kh.world.member.model.service.MemberService;
import com.kh.world.member.model.vo.Member;
import com.kh.world.minihome.model.vo.MemberMinihome;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@SessionAttributes({"loginMember"})
public class GiftController {
	@Autowired
	private GiftService service;

	// 홈테스트 때문에
	@Autowired
	private MemberService memberService;
	
	@GetMapping("gift/test")
	public String giftTest() {

		
		return "webpage/gift/test";
	}
	
	
	// get으로 받음
	@GetMapping("/gift/send/{productCode}")
	public ModelAndView sendGift(@PathVariable("productCode") int productCode,
			@SessionAttribute("loginMember") Member loginMember,
			ModelAndView modelAndView) {
		
		System.out.println("productCode" + productCode);
		List<GiftRelated> list = service.findRelatedAll(loginMember.getNo());
		System.out.println(list);
		
		
		// 상품코드로 상품 정보 받아오기
		GiftProduct giftProduct = service.findProductByCode(productCode);
		System.out.println(giftProduct);
		
		// 상품 가격보다 도토리가 적으면 충전하라고 하기
		if(loginMember.getAcorn() < giftProduct.getPrice()) {
			
			// location 수정 예정
			modelAndView.setViewName("webpage/gift/popUpClose");
			modelAndView.addObject("msg", "도토리가 부족합니다. 충전 후 다시 시도해주세요");
			modelAndView.addObject("location", "/webpage/shop/mainshop"); // 지금은 테스트 페이지로 보냄 추후에는 상품 리스트가 있는 곳으로 보내기
			
		} else {
			
			// 선물하기 페이지로 일촌 리스트 + 상품 보내주기
			modelAndView.setViewName("webpage/gift/send");
			modelAndView.addObject("list", list);
			modelAndView.addObject("product", giftProduct);
		}
		
		return modelAndView;
	}
	
	// Get으로 바꿈
	// 일촌목록 보내주기
//	@PostMapping("/gift/send")
//	public ModelAndView sendGift(@SessionAttribute("loginMember") Member loginMember,
//							ModelAndView modelAndView) {
//
//		
//		List<GiftRelated> list = service.findRelatedAll(loginMember.getNo());
//		System.out.println(list);
//	
//		modelAndView.setViewName("webpage/gift/send");
//		modelAndView.addObject("list", list);
//		
//		return modelAndView;
//	}
	
	
	// 선물함에 넣어주기
	// 수락할 시 상대방의 보유한 아이템에 들어감
	// 해당하는 일촌이 해당 상품을 가지고 있으면 선물 못함
	// 선물 수락 시 로그인 멤버 갱신하여 보내주기 (가지고 있는 아이템때문에)
	
	
	// 상품 선물하기 버튼 눌러서 정보 받기
	@PostMapping("/gift/send/done")
	public ModelAndView sendDone(@SessionAttribute("loginMember") Member loginMember,
								ModelAndView modelAndView,
								@ModelAttribute Gift gift,
								@RequestParam("productCode") int productCode,
								@RequestParam(required = false) String sendList,
								@RequestParam String content) {
		int receiverNo = 0;
		int result = 0;
		int haveCount = 0;
		int minusAcorn = 0; // 차감할 도토리
		int minusResult = 0;
		int userNo = 0;
		
		System.out.println("productCode : " + productCode);
		System.out.println(loginMember.getNo()); // 로그인유저 no
		System.out.println(sendList); // 선물받을 유저 no
		System.out.println(content);
		
		if(sendList == null) {
			// 선물할 대상을 선택해야함
			modelAndView.setViewName("webpage/gift/popUpClose"); 
			modelAndView.addObject("msg", "선물할 분을 선택해주세요.");
			modelAndView.addObject("location", "/webpage/shop/mainshop");
			
		} else {
			// string으로 받은 일촌 no 값을 int로 바꿔줌
			receiverNo = Integer.parseInt(sendList);
			
			// insert 전에 receiverNo에 해당하는 일촌이 이 상품을 가지고 있는지 확인하기
			// receiverNo랑 productCode 보내주기
			haveCount = service.findHaveCount(receiverNo, productCode);
			System.out.println("아이템을 이미 가지고 있는감? " + haveCount);
			
			// 상품 조회하기(도토리 차감 때문에)
			GiftProduct giftProduct = service.findProductByCode(productCode);
			System.out.println("선물할 상품 가져옴" + giftProduct);
			
			// 로그인 유저 no값 변수 담아주기
			userNo = loginMember.getNo();
			
			if(haveCount > 0) {
				// 선물할 수 없습니다.
				modelAndView.setViewName("common/msg");
				modelAndView.addObject("msg", "상대방이 해당 상품을 보유하고 있습니다.");
				// 나중에 경로 바꿔주기 지금은 테스트
				modelAndView.addObject("location", "/webpage/shop/mainshop"); // 해당 창을 닫게 하고 부모창 리로드 시키기
				
			} else {
				
				// 보유하고 있는 상품이 아니라서 선물함에 넣어주기
				result = service.insertGift(loginMember.getNo(), productCode, receiverNo, content);
				
				
				if(result > 0) {
					// 선물함에 넣는것에 성공했으면 도토리도 깎아야댐
					// member쪽에 변동사항이 있으니깐 loginMember를 갱신해서 보내주기 -> 팝업창 닫을거라 location 보낼 컨트롤러에서 갱신하기
					// 해당 창 닫게하고 부모창 리로드 시키기
					minusAcorn = giftProduct.getPrice();
					minusResult = service.updateMemberAcorn(userNo, minusAcorn); // 선물한 상품 도토리 갯수 차감
					// loginMember 갱신하기
					loginMember = service.findMemberByNo(userNo);
					System.out.println("도토리 차감 후 loginMember : " + loginMember);
					
					// 경로 수정 예정
					// 해당 창 닫고 부모 페이지에서 loginMember 세션 갱신시켜주기
					modelAndView.setViewName("webpage/gift/popUpClose"); 
//				modelAndView.addObject("loginMember", loginMember); // 이건 자식페이지로 가는거라 갱신 안됨 location의 컨트롤러에서 보내주기
					modelAndView.addObject("msg", "선물이 완료되었습니다.");
					modelAndView.addObject("location", "/webpage/shop/mainshop");
				} else {
					// 실패
					// 선물에 실패.. 창을 구매페이지로 로드 시키기
					modelAndView.setViewName("/webpage/gift/send");
				}
				
			}
		}
		
		
		return modelAndView;
	}
	
	// 홈테스트
	// 선물하기 페이지 로드시 팝업 나오도록 테스트 // giftList도 보내주기???? 근데 왜 여기서 안보내줬는데 인식을 하지?
	@GetMapping("/homeTest")
	public ModelAndView homeTest(ModelAndView modelAndView,
								@SessionAttribute(value = "loginMember", required = false) Member loginMember) {
		
		if(loginMember != null) {
			
			int userNo = loginMember.getNo();
			
			// 페이징 처리 해줘야해서 count 가져오기
//			int listCount = service.getGiftListCount(userNo);
//			System.out.println("listCount : " + listCount);
			
//			System.out.println(giftList);
			
			// 미니홈 테스트
//			MemberMinihome memberMinihome = memberService.findMinihomeByNo(userNo);
//			modelAndView.addObject("memberMinihome", memberMinihome);
			
			// 해당 로그인 유저의 선물함 가져오기
			List<GiftAddMember> giftList = service.findGiftMemberByUserNo(userNo);
			
			modelAndView.addObject("giftList", giftList);
			modelAndView.setViewName("webpage/mypage/homeTest");

		} else {
			
			modelAndView.setViewName("webpage/mypage/homeTest");
			
		}
		
		return modelAndView;
	}
	
	
	
	@GetMapping("/gift/giftList")
	public ModelAndView giftList(ModelAndView modelAndView,
								@SessionAttribute(value = "loginMember", required = false) Member loginMember,
								@RequestParam(defaultValue = "1") int page) {
		System.out.println("팝업 열림");
		
		if(loginMember != null) {
			System.out.println("팝업 로그인확인되어 list 열어줌");
			
			// 리스트 개수 가져오기
			int listCount = service.getGiftListCount(loginMember.getNo());
			//페이징 처리..
			PageInfo pageInfo = new PageInfo(page, 2, listCount, 2) ;

			List<GiftAddMember> giftList = service.getGiftMemberBoundsByUserNo(loginMember.getNo(), pageInfo);
			
			System.out.println("로그인 후 팝업에서 giftList 불러옴" + giftList);
			
			// giftList가 null이면 팝업 닫아주게
			if(listCount > 0) {
				System.out.println("giftList 있어서 팝업 열어줌");
				
				modelAndView.setViewName("webpage/gift/giftList");
				modelAndView.addObject("giftList", giftList);
				modelAndView.addObject("pageInfo", pageInfo);
			
			} else {
				System.out.println("giftList 없어서 팝업 닫아줌");
				
				modelAndView.setViewName("webpage/gift/popUpJustClose");
			}
			 
			
			// loginMember가 null이면
		} else {
			
			modelAndView.setViewName("webpage/gift/popUpJustClose");
		}
		
		
		return modelAndView;
	}
	
	
	// 선물리스트에서 해당 선물 확인하는 뷰로 선물내용 보여주기
	@GetMapping("/gift/receive")
	public ModelAndView receiveGift(ModelAndView modelAndView,
									@SessionAttribute(value = "loginMember", required = false) Member loginMember,
									@RequestParam("inputGiftNo") int giftNo) {
		
//		System.out.println(giftNo);

		GiftAddMember giftAddMember = service.findGiftByGiftNo(giftNo);
		System.out.println("giftNo로 조회한 상품 정보" + giftAddMember);
		
		
		modelAndView.setViewName("webpage/gift/receive");
		modelAndView.addObject("giftList", giftAddMember);
		
		return modelAndView;
	}
	

	// 선물받기 
	@PostMapping("/gift/receive")
	public ModelAndView receiveGiftYes(ModelAndView modelAndView,
								    @SessionAttribute("loginMember") Member loginMember,
									@RequestParam("giftNo") int giftNo,
									@RequestParam("productCode") int productCode ) {
		
		int userNo = loginMember.getNo();
		System.out.println("userNo : "+ userNo);
		
		System.out.println("선물받기 버튼 giftNo : " + giftNo);
		System.out.println("productCode : " + productCode);
		
		// 선물받기 버튼을 누르면 myitem에 들어가는데
		// MyItem에 해당 아이템이 있으면 도토리가 상대방에게 자동으로 환불됨
		// 환불받은 상대방에게 알림이 뜨도록.......................
		
		 
		int count = service.findHaveCount(userNo, productCode);
		System.out.println("아이템을 가지고 있는가? " + count);
		// myitem에도 없고 선물이 성공적으로 받아졌을 때
		
		if(count > 0) {
			// 해당 아이템을 가지고 있으면
			// 선물이 거절되는 것으로 -> 해당 아이템을 이미 가지고 있어 상대방에게 자동으로 환불됩니다.
			GiftProduct giftProduct = service.findProductByCode(productCode);
			GiftAddMember gift = service.findGiftByGiftNo(giftNo);
			service.giftReject(giftNo, gift.getSender().getNo(), giftProduct.getPrice()); // 자동환불
			
			modelAndView.setViewName("common/msg");
			modelAndView.addObject("msg", "이미 보유한 상품입니다. 선물이 거절되었습니다.");
			modelAndView.addObject("location", "/gift/giftList");
			
			
		} else {
			// 해당 아이템을 가지고 있지 않으면
			// 내 아이템에 넣기 -> 팝업 닫고 홈으로 보내주기
			int result = service.insertMyItem(userNo, productCode, giftNo);
			// 아이템 넣기 + 선물함에서 없애기 성공
			if(result > 0) {
				
				modelAndView.setViewName("common/msg");
				modelAndView.addObject("msg", "성공적으로 선물을 받았습니다.");
				modelAndView.addObject("location", "/gift/giftList");
			} else {
				
				modelAndView.setViewName("common/msg");
				modelAndView.addObject("msg", "선물받기에 실패하였습니다.");
				modelAndView.addObject("location", "/gift/giftList");
			}
			
			
		}
		
		return modelAndView;
	}
	
	
	
	@GetMapping("/gift/reject")
	public ModelAndView giftReject(ModelAndView modelAndView,
								@RequestParam int giftNo, @RequestParam int no, @RequestParam int price) {
		
		System.out.println(giftNo);
		System.out.println(no);
		System.out.println(price);
		
		// 거절했을 때
		// 선물함 progress 변경 + 보낸 회원한테 환불
		int result = service.giftReject(giftNo, no, price);
		
		if(result > 0) {
			// 상대방한테 환불 완료
			modelAndView.setViewName("common/msg");
			modelAndView.addObject("msg", "상대방에게 도토리가 환불되었습니다.");
			modelAndView.addObject("location", "/gift/giftList");
			
		} else {
			// 거절하기 실패
			modelAndView.setViewName("common/msg");
			modelAndView.addObject("msg", "거절하기를 실패하였습니다.");
			modelAndView.addObject("location", "/gift/giftList");
		}
		
		
		return modelAndView;
	}
	
	
	
}
