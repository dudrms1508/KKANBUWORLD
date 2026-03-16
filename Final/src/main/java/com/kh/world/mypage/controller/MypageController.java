package com.kh.world.mypage.controller;

import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.kh.world.common.util.PageInfo;
import com.kh.world.gift.model.service.GiftService;
import com.kh.world.gift.model.vo.Gift;
import com.kh.world.gift.model.vo.GiftAddMember;
import com.kh.world.join.model.service.JoinService;
import com.kh.world.member.model.service.MemberService;
import com.kh.world.member.model.vo.Member;
import com.kh.world.minihome.model.vo.MemberMinihome;
import com.kh.world.mypage.model.service.MypageService;
import com.kh.world.mypage.model.vo.BuyHistory;
import com.kh.world.mypage.model.vo.Cart;
import com.kh.world.mypage.model.vo.MinihomeToday;
import com.kh.world.mypage.model.vo.QnaHistory;
import com.kh.world.mypage.model.vo.ReportHistory;

import lombok.extern.slf4j.Slf4j;
import retrofit2.http.POST;

@Slf4j
@Controller
@SessionAttributes(value = {"loginMember"})
@RequestMapping("/webpage")
public class MypageController {
	@Autowired
	private MypageService service;

	@Autowired
	private JoinService joinService;
	
	@Autowired
	private GiftService giftService;
	
	@Autowired
	private MemberService memberService;
	
	@GetMapping("/mypage/myInfo")
	public String myInfo(Model model, @SessionAttribute("loginMember") Member loginMember) {
		int userNo = loginMember.getNo();
		MemberMinihome myMinihome = memberService.findMinihomeByNo(userNo);
		MinihomeToday minihomeToday = service.findTodayByMinihomeNo(myMinihome.getMinihomeNo());
		model.addAttribute("minihomeToday", minihomeToday);
		model.addAttribute("myMinihome", myMinihome);
		return "webpage/mypage/myInfo";
	}
	
	@PostMapping("/mypage/myInfo")
	public ModelAndView myInfo(ModelAndView modelAndView,
								@SessionAttribute("loginMember") Member loginMember,
								@RequestParam(required = false) String password) {
		int userNo = loginMember.getNo();
		MemberMinihome myMinihome = memberService.findMinihomeByNo(userNo);
		MinihomeToday minihomeToday = service.findTodayByMinihomeNo(myMinihome.getMinihomeNo());
		modelAndView.addObject("minihomeToday", minihomeToday);
		System.out.println(minihomeToday);
		
//		System.out.println(loginMember);
//		System.out.println(password);
		
		if(password != null && loginMember.getPassword().equals(password)) {

			modelAndView.setViewName("webpage/mypage/updateInfo");

		} else {
			
			modelAndView.setViewName("common/msg");
			modelAndView.addObject("msg", "비밀번호를 확인해 주세요.");
			modelAndView.addObject("location", "/webpage/mypage/myInfo");
		}

		modelAndView.addObject("myMinihome", myMinihome);
		
		return modelAndView;
	}
	
	
	
	// 회원정보 수정
	@PostMapping("/mypage/updateInfo")
	public ModelAndView updateInfo(ModelAndView modelAndView, 
								@SessionAttribute("loginMember") Member loginMember,
								@ModelAttribute Member member) {
		
		int result = 0;
		int userNo = loginMember.getNo();
		member.setNo(loginMember.getNo());
		MemberMinihome myMinihome = memberService.findMinihomeByNo(userNo);
		MinihomeToday minihomeToday = service.findTodayByMinihomeNo(myMinihome.getMinihomeNo());
		modelAndView.addObject("minihomeToday", minihomeToday);
//		System.out.println(member);

		result = service.updateInfo(member);
		
		if(result > 0) {
			// loginMember 값도 바꿔주기
			loginMember = service.findMemberById(loginMember.getId()); // 새로 갱신된걸로 정보 바꿔주기
			System.out.println(loginMember);
			modelAndView.setViewName("common/msg");
			modelAndView.addObject("loginMember", loginMember);
			modelAndView.addObject("msg", "회원정보가 수정되었습니다.");
			modelAndView.addObject("location", "/webpage/mypage/myInfo");
		
		} else {
			modelAndView.setViewName("common/msg");
			modelAndView.addObject("msg", "회원정보가 수정에 실패하였습니다.");
			modelAndView.addObject("location", "/webpage/mypage/myInfo");
		}
		
			modelAndView.addObject("myMinihome", myMinihome);

		return modelAndView;
		
	}
	
	
	
	// 마이페이지 수정 인증번호
	@ResponseBody
	@GetMapping("mypage/update/mailCheck")
	public String mailCheck(String emailaddress) {
		System.out.println(emailaddress);
		
//		System.out.println(service.joinEmail(emailaddress));
		
		return joinService.updateEmailPass(emailaddress);
	}
	
	
	

	// 비밀번호 변경 포워딩
	@GetMapping("/mypage/changePwd")
	public String changePwd(Model model, @SessionAttribute("loginMember") Member loginMember) {
		
		int userNo = loginMember.getNo();
		MemberMinihome myMinihome = memberService.findMinihomeByNo(userNo);
		MinihomeToday minihomeToday = service.findTodayByMinihomeNo(myMinihome.getMinihomeNo());
		model.addAttribute("minihomeToday", minihomeToday);
		model.addAttribute("myMinihome", myMinihome);
		
		return "webpage/mypage/changePwd";
	}
	
	
	@PostMapping("/mypage/changePwd")
	public ModelAndView changePwd(ModelAndView modelAndView,
								@SessionAttribute("loginMember") Member loginMember,
								@RequestParam(required = false) String password,
								@RequestParam(required = false) String chgPwd,
								@RequestParam(required = false) String chgPwd2) {
		
		
		int result = 0;
		int no = 0;
		log.info("{}, {}, {}", new Object[] {password, chgPwd, chgPwd2});
		int userNo = loginMember.getNo();
		MemberMinihome myMinihome = memberService.findMinihomeByNo(userNo);
		modelAndView.addObject("myMinihome", myMinihome);
		MinihomeToday minihomeToday = service.findTodayByMinihomeNo(myMinihome.getMinihomeNo());
		modelAndView.addObject("minihomeToday", minihomeToday);
		
		no = loginMember.getNo();
		
		if(password != null && chgPwd != null && chgPwd2 != null
				&& password.equals(loginMember.getPassword()) && chgPwd.equals(chgPwd2)) {
			
			result = service.updatePassword(no, chgPwd);
			
			if(result > 0) {
				// loginMember 다시 보내주기(비밀번호 업데이트 된 것으로)
				loginMember = service.findMemberById(loginMember.getId());
				modelAndView.addObject("loginMember", service.findMemberById(loginMember.getId()));
				
				System.out.println(loginMember);
				
				modelAndView.setViewName("common/msg");
				modelAndView.addObject("msg", "비밀번호가 변경되었습니다.");
				modelAndView.addObject("location", "/");
				
			} else {
				modelAndView.setViewName("common/msg");
				modelAndView.addObject("msg", "비밀번호 변경에 실패하였습니다.");
				modelAndView.addObject("location", "/webpage/mypage/changePwd");
				
			}
			
		} else {
			
			modelAndView.setViewName("common/msg");
			modelAndView.addObject("msg", "비밀번호를 다시 확인해주세요.");
			modelAndView.addObject("location", "/webpage/mypage/changePwd");
		
		}
		
		
		return modelAndView;
	}
	
	// 회원 탈퇴 포워딩
	@GetMapping("/mypage/accountdel")
	public String deleteAccount(@SessionAttribute("loginMember") Member loginMember,
								Model model) {
		int userNo = loginMember.getNo();
		MemberMinihome myMinihome = memberService.findMinihomeByNo(userNo);
		model.addAttribute("myMinihome", myMinihome);
		MinihomeToday minihomeToday = service.findTodayByMinihomeNo(myMinihome.getMinihomeNo());
		model.addAttribute("minihomeToday", minihomeToday);
		
		return "webpage/mypage/accountdel";
	}
	
	
	@PostMapping("/mypage/accountdel")
	public ModelAndView deleteAccount(ModelAndView modelAndView,
									@SessionAttribute("loginMember") Member loginMember, 
									@RequestParam String password,
									@RequestParam String checkPwd) {
		
		int result = 0;
		int userNo = loginMember.getNo();
		MemberMinihome myMinihome = memberService.findMinihomeByNo(userNo);
		modelAndView.addObject("myMinihome", myMinihome);
		MinihomeToday minihomeToday = service.findTodayByMinihomeNo(myMinihome.getMinihomeNo());
		modelAndView.addObject("minihomeToday", minihomeToday);
		
//		log.info("{}, {}", password, checkPwd);
		
		if(password != null && checkPwd != null 
				&& loginMember.getPassword().equals(password) && password.equals(checkPwd)) {
			
			result = service.deleteAccount(loginMember.getId());
			
			if(result > 0) {
				modelAndView.addObject("msg", "정상적으로 탈퇴되었습니다.");
				modelAndView.addObject("location", "/webpage/member/logout");
				modelAndView.setViewName("common/msg");
				
			} else {
				modelAndView.addObject("msg", "탈퇴에 실패하였습니다.");
				modelAndView.addObject("location", "/webpage/mypage/accountdel");
				modelAndView.setViewName("common/msg");				
			}
			

		} else {
			modelAndView.addObject("msg", "탈퇴에 실패하였습니다.");
			modelAndView.addObject("location", "/webpage/mypage/accountdel");
			modelAndView.setViewName("common/msg");
			
		}
		
		
		return modelAndView;
	}
	
	
	// 장바구니 담기
	@ResponseBody
	@GetMapping("/mypage/cartIn")
	public int cartIn(ModelAndView modelAndView, 
					@SessionAttribute("loginMember") Member loginMember, 
					@RequestParam("productNo") int productNo) {
		
		int result = 0;
		int userNo = loginMember.getNo();
		// 해당 상품을 가지고 있는지 확인 먼저
		int alreadyCartIn = service.findCartProductByNo(userNo, productNo);
		
		// 카트에 담기
		if(alreadyCartIn > 0) {
			result = 0;
		} else {
			
			result = service.insertCart(userNo, productNo);
		}
		
		
		return result;
		
	}
	
	
	
	
	// 장바구니로 이동하면 리스트 보여주기
	@GetMapping("/mypage/cart")
	public ModelAndView cart(ModelAndView modelAndView,
							@SessionAttribute("loginMember") Member loginMember) {
		
		int userNo = loginMember.getNo();
//		System.out.println(loginMember);
		MemberMinihome myMinihome = memberService.findMinihomeByNo(userNo);
		MinihomeToday minihomeToday = service.findTodayByMinihomeNo(myMinihome.getMinihomeNo());
		Cart cart = service.selectCartByNo(loginMember.getNo());
		
//		System.out.println(cart);
//		System.out.println(list.size());
		
		modelAndView.addObject("cart", cart);
		modelAndView.addObject("myMinihome", myMinihome);
		modelAndView.addObject("minihomeToday", minihomeToday);
		modelAndView.setViewName("/webpage/mypage/cart");
		
		
		return modelAndView;
	}
	
	
	
	// 장바구니 삭제 ajax
	@ResponseBody
	@GetMapping("/mypage/cart/delete")
	public String cartDelete(
								Model model,
								@SessionAttribute("loginMember") Member loginMember,
								@RequestParam(required = false, value="items[]") List<String> list) {
		
		int result = 0;
		int userNo = loginMember.getNo();
		Map<String, Object> map = new HashMap<String, Object>();
		
		MemberMinihome myMinihome = memberService.findMinihomeByNo(userNo);
//		Cart cart = new Cart(loginMember.getNo(), null);
		MinihomeToday minihomeToday = service.findTodayByMinihomeNo(myMinihome.getMinihomeNo());
		
		map.put("no", loginMember.getNo());
		map.put("list", list);
		
//		System.out.println(list);
//		System.out.println(loginMember);
		System.out.println(map.get("list"));
		
		model.addAttribute("myMinihome", myMinihome);
		model.addAttribute("minihomeToday", minihomeToday);
		
		result = service.cartDelete(map);
		
		if(result > 0) {
			
			return "webpage/mypage/cart";
		} else {
			
			return "home";
		}
		
		
	}
	
	@PostMapping("/mypage/cart/buy")
	public ModelAndView	buyCart(@SessionAttribute("loginMember") Member loginMember,
								ModelAndView modelAndView,
								@RequestParam("productCode") int[] productCode,
								@RequestParam("allCartPrice") int price) {
		
		int userNo = loginMember.getNo();
		Map<String, Object> map = new HashMap<String, Object>();
//		Arrays.stream(productCode).forEach(code -> System.out.print(code + ", "));
		System.out.println("장바구니 가격 " + price);
		
		int result = service.findMyItemByCode(userNo, productCode);

		map.put("no", loginMember.getNo());
		map.put("productCode", productCode);
		
		// 가진 도토리가 부족함
		if(loginMember.getAcorn() < price) {
			modelAndView.setViewName("common/msg");
			modelAndView.addObject("msg", "도토리 충전 후에 다시 시도해주세요.");
			modelAndView.addObject("location", "/webpage/mypage/cart");
			
		// 가진 도토리가 충분
		} else {
			
			// 장바구니 상품 중 하나를 가지고 있음
			if(result > 0) {
				modelAndView.setViewName("common/msg");
				modelAndView.addObject("msg", "이미 가지고 있는 상품이 있습니다. 장바구니를 확인해주세요.");
				modelAndView.addObject("location", "/webpage/mypage/cart");
				
			// 안가지고 있어서 결제로 넘어감
			} else {
				
				// 상품 결제 + 도토리 차감 + loginMember 다시 보내주기 + 상품도 넣어주기 myItem에 + 구매내역에 데이터 넣기
				int acornUpdateResult = giftService.updateMemberAcorn(userNo, price);
				int insertItemResult = service.insertMyItemByCodes(userNo, productCode);
				int buyHistoryResult = service.insertBuyHistoryByNo(userNo, productCode);
				
				if(acornUpdateResult > 0 && insertItemResult > 0 && buyHistoryResult > 0) {
					// 장바구니에서 삭제
					int deleteResult = service.cartDeleteAfterBuy(map);
					
					
					if(deleteResult > 0) {
						// 멤버 갱신
						loginMember = giftService.findMemberByNo(userNo);
						modelAndView.addObject("loginMember", loginMember);
						modelAndView.setViewName("common/msg");
						modelAndView.addObject("msg", "결제되었습니다.");
						modelAndView.addObject("location", "/webpage/mypage/cart");
					} else {
	
						modelAndView.addObject("loginMember", loginMember);
						modelAndView.setViewName("common/msg");
						modelAndView.addObject("msg", "결제에 실패하였습니다. 다시 시도해주세요.");
						modelAndView.addObject("location", "/webpage/mypage/cart");
					}
					
				} else {
	
					modelAndView.addObject("loginMember", loginMember);
					modelAndView.setViewName("common/msg");
					modelAndView.addObject("msg", "결제에 실패하였습니다. 다시 시도해주세요.");
					modelAndView.addObject("location", "/webpage/mypage/cart");
					
				}
				
			}
		
		}
		
		return modelAndView;
	}
	
	
	// 결제/구매 페이지 포워드
	@GetMapping("/mypage/payhistory")
	public ModelAndView payhistory(ModelAndView modelAndView,
									@SessionAttribute("loginMember") Member loginMember,
									@RequestParam(defaultValue = "1") int page) {
		
		int listCount = service.countPayHistoryByNo(loginMember.getNo());
		
		PageInfo pageInfo = new PageInfo(page, 5, listCount, 5);
		
		List<BuyHistory> list = service.selectHistoryByNo(loginMember.getNo(), pageInfo);
		
		int userNo = loginMember.getNo();
		MemberMinihome myMinihome = memberService.findMinihomeByNo(userNo);
		modelAndView.addObject("myMinihome", myMinihome);
		MinihomeToday minihomeToday = service.findTodayByMinihomeNo(myMinihome.getMinihomeNo());
		modelAndView.addObject("minihomeToday", minihomeToday);
		
//		System.out.println(list);
//		System.out.println(list.size());
		
		modelAndView.addObject("listCount", listCount);
		modelAndView.addObject("pageInfo", pageInfo);
		modelAndView.setViewName("webpage/mypage/payhistory");
		modelAndView.addObject("list", list);

		
		return modelAndView;
	}
	
	
	
	// 결제/구매 기간별 검색
	// ajax인데 url 줘야해서 responsebody 태그 없앰
//	@ResponseBody
	@PostMapping("mypage/payhistory/seldate")
//	public Map<String, Object> selDate(@SessionAttribute("loginMember") Member loginMember,
//							@RequestParam(value = "list", required = false) Object[] list,
	public String selDate(@SessionAttribute("loginMember") Member loginMember,
							@RequestParam String date1, @RequestParam String date2,
							Model model, @RequestParam(defaultValue = "1") int page) {
		int userNo = loginMember.getNo();
		// 기간별 개수
		int listCount = service.countPayHistoryBetweenByNo(loginMember.getNo(), date1, date2);
		
		PageInfo pageInfo = new PageInfo(page, 5, listCount, 5);
		
		MemberMinihome myMinihome = memberService.findMinihomeByNo(userNo);
		
		
		System.out.println(date2);
		System.out.println(date1);
		
		List<BuyHistory> list = service.findHistoryBetween(loginMember.getNo(), date1, date2, pageInfo);
//		System.out.println(list);

		model.addAttribute("list", list);
		model.addAttribute("listCount", listCount);
		model.addAttribute("pageInfo", pageInfo);
		model.addAttribute("date1", date1);
		model.addAttribute("date2", date2);
		model.addAttribute("myMinihome", myMinihome);
		
		return "webpage/mypage/payhistoryAjax";
	}

	
	// 구매 날짜별 리스트 +페이징
	@PostMapping("/mypage/payhistory/list")
	public String payhistoryList(@SessionAttribute("loginMember") Member loginMember,
								@RequestParam(defaultValue = "1") int page,
								@RequestParam String date1, @RequestParam String date2,
								Model model) {
		int userNo = loginMember.getNo();
		
		if(date1.equals("") || date2.equals("")) {
			// 둘다 비어있음
			// 전체로
			
			int listCount = service.countPayHistoryByNo(loginMember.getNo());
			PageInfo pageInfo = new PageInfo(page, 5, listCount, 5);
			List<BuyHistory> list = service.selectHistoryByNo(loginMember.getNo(), pageInfo);
			
			model.addAttribute("list", list);
			model.addAttribute("listCount", listCount);
			model.addAttribute("pageInfo", pageInfo);
			model.addAttribute("date1", null);
			model.addAttribute("date2", null);
			
			
		} else {
			// 날짜 같이 검색
			int listCount = service.countPayHistoryBetweenByNo(loginMember.getNo(), date1, date2);
			PageInfo pageInfo = new PageInfo(page, 5, listCount, 5);
			
			// paging 처리한 리스트 가져오기
			List<BuyHistory> list = service.findHistoryBetween(loginMember.getNo(), date1, date2, pageInfo);
			
			model.addAttribute("list", list);
			model.addAttribute("listCount", listCount);
			model.addAttribute("pageInfo", pageInfo);
			model.addAttribute("date1", date1);
			model.addAttribute("date2", date2);
			
		}
		
		
		return "webpage/mypage/payhistoryAjax";
	}
	
	
	
	// 문의내역 포워드 및 가져오기
	@GetMapping("/mypage/qnahistory")
	public ModelAndView qnahistory(ModelAndView modelAndView,
								@SessionAttribute("loginMember") Member loginMember,
								@RequestParam(defaultValue = "1") int page) {
		
		int userNo = loginMember.getNo();
		int listCount = service.countQnaAllByNo(userNo);
		
		PageInfo pageInfo = new PageInfo(page, 5, listCount, 5);		
		List<QnaHistory> list = service.findQnaAllByNo(userNo, pageInfo);
		MemberMinihome myMinihome = memberService.findMinihomeByNo(userNo);
		MinihomeToday minihomeToday = service.findTodayByMinihomeNo(myMinihome.getMinihomeNo());

		modelAndView.addObject("list", list);
		modelAndView.addObject("pageInfo", pageInfo);
		modelAndView.addObject("listCount", listCount);
		modelAndView.addObject("myMinihome", myMinihome);
		modelAndView.addObject("minihomeToday", minihomeToday);
		modelAndView.setViewName("webpage/mypage/qnahistory");
		
		
		return modelAndView;
	}
	
	
	
//	@GetMapping("/mypage/test")
//	public String mypageTest() {
//		
//		return "webpage/mypage/homeTest";
//	}
	
	
	// 보낸선물 뷰 페이지로 보냄. list 같이 보내기
	@GetMapping("/mypage/sendgifthistory")
	public ModelAndView sendgifthistory(@SessionAttribute("loginMember") Member loginMember,
										ModelAndView modelAndView,
										@RequestParam(defaultValue = "1") int page) {
		
		int userNo = loginMember.getNo();
		MemberMinihome myMinihome = memberService.findMinihomeByNo(userNo);
		MinihomeToday minihomeToday = service.findTodayByMinihomeNo(myMinihome.getMinihomeNo());

		int listCount = giftService.countSendGiftByNo(userNo);
//		System.out.println(listCount);
		// 페이징 처리하기
		PageInfo pageInfo = new PageInfo(page, 5, listCount, 5);
		
		List<GiftAddMember> list = giftService.findSendGiftHistoryByNo(userNo, pageInfo);
//		List<GiftAddMember> list = giftService.findSendGiftHistoryByNo(userNo);
		
//		System.out.println("보낸 선물 리스트" + list);
		
		
		modelAndView.addObject("list", list);
		modelAndView.addObject("pageInfo", pageInfo);
		modelAndView.addObject("listCount", listCount);
		modelAndView.addObject("myMinihome", myMinihome);
		modelAndView.addObject("minihomeToday", minihomeToday);
		modelAndView.setViewName("webpage/mypage/sendgifthistory");
		
		return modelAndView;
	}

	// 날짜 기간별 조회 + 페이징처리
	@PostMapping("/mypage/sendgifthistory/seldate")
	public String sendgiftListseldate(@SessionAttribute("loginMember") Member loginMember,
										@RequestParam(defaultValue = "1") int page,
										@RequestParam String date1, @RequestParam String date2,
										Model model) {
		int userNo = loginMember.getNo();
		int listCount = giftService.countSendGiftBetween(userNo, date1, date2);
//		System.out.println("ajax로 받은 기간별 listCount 개수 " + listCount);
		PageInfo pageInfo = new PageInfo(page, 5, listCount, 5);
		// paging 처리한 리스트 가져오기
		List<GiftAddMember> list = giftService.findsendGiftHistoryBetween(userNo, date1, date2, pageInfo);
		
		model.addAttribute("list", list);
		model.addAttribute("listCount", listCount);
		model.addAttribute("pageInfo", pageInfo);
		model.addAttribute("date1", date1);
		model.addAttribute("date2", date2);
		
		return "webpage/mypage/sendgifthistoryAjax";
	}
	
	
	// 날짜별 리스트
	@PostMapping("/mypage/sendgifthistory/list")
	public String sendgiftList(@SessionAttribute("loginMember") Member loginMember,
								@RequestParam(defaultValue = "1") int page,
								@RequestParam String date1, @RequestParam String date2,
								Model model) {
		int userNo = loginMember.getNo();
		
		if(date1.equals("") || date2.equals("")) {
			// 둘다 비어있음
			int listCount = giftService.countSendGiftByNo(userNo);
			
			PageInfo pageInfo = new PageInfo(page, 5, listCount, 5);
			List<GiftAddMember> list = giftService.findSendGiftHistoryByNo(userNo, pageInfo);
			
			model.addAttribute("list", list);
			model.addAttribute("listCount", listCount);
			model.addAttribute("pageInfo", pageInfo);
			model.addAttribute("date1", null);
			model.addAttribute("date2", null);
			
			
		} else {
			// 날짜 같이 검색
			
			int listCount = giftService.countSendGiftBetween(userNo, date1, date2);
			PageInfo pageInfo = new PageInfo(page, 5, listCount, 5);
			// paging 처리한 리스트 가져오기
			List<GiftAddMember> list = giftService.findsendGiftHistoryBetween(userNo, date1, date2, pageInfo);
			
			model.addAttribute("list", list);
			model.addAttribute("listCount", listCount);
			model.addAttribute("pageInfo", pageInfo);
			model.addAttribute("date1", date1);
			model.addAttribute("date2", date2);
			
		}
		
		
		return "webpage/mypage/sendgifthistoryAjax";
	}
	
	
	// 받은선물 뷰 보내기 list 같이 보내기(+ 페이징)
	@GetMapping("/mypage/receivegifthistory")
	public ModelAndView receivegifthistory(@SessionAttribute("loginMember") Member loginMember,
										ModelAndView modelAndView,
										@RequestParam(defaultValue = "1") int page) {
		
		int userNo = loginMember.getNo();
		int listCount = giftService.countReceiveGiftByNo(userNo);
		
		System.out.println(listCount);
		// 페이징 처리하기
		PageInfo pageInfo = new PageInfo(page, 5, listCount, 5);
		
		List<GiftAddMember> list = giftService.findReceiveGiftHistoryByNo(userNo, pageInfo);
		MemberMinihome myMinihome = memberService.findMinihomeByNo(userNo);
		MinihomeToday minihomeToday = service.findTodayByMinihomeNo(myMinihome.getMinihomeNo());

		System.out.println("받은 선물 리스트" + list);
		
		
		modelAndView.addObject("list", list);
		modelAndView.addObject("pageInfo", pageInfo);
		modelAndView.addObject("listCount", listCount);
		modelAndView.addObject("myMinihome", myMinihome);
		modelAndView.addObject("minihomeToday", minihomeToday);
		modelAndView.setViewName("webpage/mypage/receivegifthistory");
		
		return modelAndView;
	}
	
	
	// 조회버튼 클릭시 발생하는 ajax 이벤트 (기간별 조회 + 페이징)
	@PostMapping("/mypage/receivegifthistory/seldate")
	public String receivegiftListseldate(@SessionAttribute("loginMember") Member loginMember,
											@RequestParam(defaultValue = "1") int page,
											@RequestParam String date1, @RequestParam String date2,
											Model model) {
		
		int userNo = loginMember.getNo();
		// 기간별 list 개수
		int listCount = giftService.countReceiveGiftBetween(userNo, date1, date2);
		PageInfo pageInfo = new PageInfo(page, 5, listCount, 5);
		// paging 처리한 리스트 가져오기
		List<GiftAddMember> list = giftService.findReceiveGiftHistoryBetween(userNo, date1, date2, pageInfo);
		
		model.addAttribute("list", list);
		model.addAttribute("listCount", listCount);
		model.addAttribute("pageInfo", pageInfo);
		model.addAttribute("date1", date1);
		model.addAttribute("date2", date2);
		
		
		return "webpage/mypage/receivegifthistoryAjax";
	}
	
	
	// 페이징버튼 클릭시
	// 날짜별 리스트
	@PostMapping("/mypage/receivegifthistory/list")
	public String receivegiftList(@SessionAttribute("loginMember") Member loginMember,
								@RequestParam(defaultValue = "1") int page,
								@RequestParam String date1, @RequestParam String date2,
								Model model) {
		int userNo = loginMember.getNo();
		
		if(date1.equals("") || date2.equals("")) {
			// 전체기간으로 가져오기
			int listCount = giftService.countReceiveGiftByNo(userNo);
			
			PageInfo pageInfo = new PageInfo(page, 5, listCount, 5);
			List<GiftAddMember> list = giftService.findReceiveGiftHistoryByNo(userNo, pageInfo);
			
			model.addAttribute("list", list);
			model.addAttribute("listCount", listCount);
			model.addAttribute("pageInfo", pageInfo);
			model.addAttribute("date1", null);
			model.addAttribute("date2", null);
			
			
		} else {
			// 날짜 같이 검색
			
			int listCount = giftService.countReceiveGiftBetween(userNo, date1, date2);
			PageInfo pageInfo = new PageInfo(page, 5, listCount, 5);
			// paging 처리한 리스트 가져오기
			List<GiftAddMember> list = giftService.findReceiveGiftHistoryBetween(userNo, date1, date2, pageInfo);
			
			model.addAttribute("list", list);
			model.addAttribute("listCount", listCount);
			model.addAttribute("pageInfo", pageInfo);
			model.addAttribute("date1", date1);
			model.addAttribute("date2", date2);
			
		}
		
		
		return "webpage/mypage/receivegifthistoryAjax";
	}
	
	
	@GetMapping("/mypage/report")
	public ModelAndView reporthistory(@SessionAttribute("loginMember") Member loginMember,
								@RequestParam(defaultValue = "1") int page,
								ModelAndView modelAndView) {
		
		int userNo = loginMember.getNo();
		MemberMinihome myMinihome = memberService.findMinihomeByNo(userNo);
		MinihomeToday minihomeToday = service.findTodayByMinihomeNo(myMinihome.getMinihomeNo());

		String userId = loginMember.getId();
		int listCount = service.countReportByNo(userId);
		PageInfo pageInfo = new PageInfo(page, 5, listCount, 5);
		
		List<ReportHistory> list = service.findReportHistory(userId, pageInfo);
//		System.out.println(list);
		
		modelAndView.addObject("list", list);
		modelAndView.addObject("pageInfo", pageInfo);
		modelAndView.addObject("listCount", listCount);
		modelAndView.addObject("myMinihome", myMinihome);
		modelAndView.addObject("minihomeToday", minihomeToday);
		modelAndView.setViewName("webpage/mypage/reporthistory");
		
		return modelAndView;
	}
	
	
	@GetMapping("/mypage/reportdetail")
	public ModelAndView reportdetail(@SessionAttribute("loginMember") Member loginMember,
										@RequestParam("reportNo") int reportNo,
										ModelAndView modelAndView) {
		String userId = loginMember.getId();
		ReportHistory report = service.findReportByNo(userId, reportNo);
				
		modelAndView.addObject("report", report);
		modelAndView.setViewName("webpage/mypage/reportdetail");
		
		return modelAndView;
	}
	
	
	@GetMapping("/mypage/qnadetail")
	public ModelAndView qnaDetail(ModelAndView modelAndView,
								@RequestParam("qnaNo") int qnaNo,
								@SessionAttribute("loginMember") Member loginMember) {
		
		int userNo = loginMember.getNo();
		
		QnaHistory qna = service.findQnaByNo(userNo, qnaNo);
		System.out.println(qna);
		
		modelAndView.addObject("qna", qna);
		modelAndView.setViewName("/webpage/mypage/qnahistorydetail");
		
		return modelAndView;
	}
	
	
}
