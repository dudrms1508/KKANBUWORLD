package com.kh.world.ilchon.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.kh.world.common.util.PageInfo;
import com.kh.world.diary.model.vo.Diary;
import com.kh.world.ilchon.model.service.IlchonService;
import com.kh.world.ilchon.model.vo.Ilchon;
import com.kh.world.ilchon.model.vo.Request;
import com.kh.world.member.model.vo.Member;

import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@SessionAttributes("loginMember")
@AllArgsConstructor
public class IlchonController {
	
	@Autowired
	private final IlchonService service;
	
	// 전체 회원리스트 조회(친구 추가 로직 위해!)
	@GetMapping("/webpage/ilchon/memberList")
	public ModelAndView findAllUsers(
			ModelAndView modelAndView,
			@RequestParam(defaultValue = "1") String type,
			@RequestParam(value="keyword", required = false) String keyword,
			@RequestParam(defaultValue = "1") int page,
			@SessionAttribute("loginMember") Member loginMember) {
		
	if (type.equals("1")) {
		log.info("회원목록요청");
		int no = 0;
		int listCount = 0;
		no = loginMember.getNo();
		listCount = service.getMemberCount();
		
		PageInfo pageInfo = new PageInfo(page, 5, listCount, 8);
		
		// 실제 화면에 출력되는 member DB의 리스트!
		List<Member> list = service.findAllUsers(pageInfo);
		log.info("list"+list);
		
		// 나의 일촌의 목록을 가져왔다.
		List<Ilchon> ilchons = service.findMyIlchons(no);
		
		// 내가 보낸 일촌 신청 목록을 가져온다.
		List<Request> request = service.findMyRequest(no);
		
		// 나의 일촌이 아닌 member 리스트 목록을 가져온다.
		List<Member> exceptIlchons = service.exceptMyIlchons(ilchons, request, no);

		System.out.println("보낸사람의 편지 request"+request);
		System.out.println("ilchons"+ilchons);
		System.out.println("내 일촌이 아닌 사람들 exceptIlchons"+exceptIlchons);
		
		modelAndView.addObject("list", list);
		modelAndView.addObject("pageInfo", pageInfo);
		modelAndView.addObject("request", request);
		modelAndView.addObject("exceptIlchons", exceptIlchons);
		modelAndView.addObject("ilchons", ilchons);
        modelAndView.setViewName("/webpage/ilchon/memberList");
	} else {
		log.info("회원목록요청");
		int no = 0;
		int listCount = 0;
		List<Member> list = null;
		
		no = loginMember.getNo();
		listCount = service.getMemberCount();
		PageInfo pageInfo = new PageInfo(page, 5, listCount, 8);
		
		list = service.memberSearch(type, keyword);
		// 실제 화면에 출력되는 member DB의 리스트!
		
		System.out.println(list);
		
		// 나의 일촌의 목록을 가져왔다.
		List<Ilchon> ilchons = service.findMyIlchons(no);
		
		// 내가 보낸 일촌 신청 목록을 가져온다.
		List<Request> request = service.findMyRequest(no);
		
		// 나의 일촌이 아닌 member 리스트 목록을 가져온다.
		List<Member> exceptIlchons = service.exceptMyIlchons(ilchons, request, no);

		System.out.println("보낸사람의 편지 request"+request);
		System.out.println("ilchons"+ilchons);
		System.out.println("내 일촌이 아닌 사람들 exceptIlchons"+exceptIlchons);
		
		
		modelAndView.addObject("list", list);
		modelAndView.addObject("pageInfo", pageInfo);
		modelAndView.addObject("request", request);
		modelAndView.addObject("exceptIlchons", exceptIlchons);
		modelAndView.addObject("ilchons", ilchons);
        modelAndView.setViewName("/webpage/ilchon/memberList");
	}
		return modelAndView;
	}
	
	
	// 일촌 신청함 페이지
	@GetMapping("/webpage/ilchon/requestBox")
	public String ilchon() {
		log.info("일촌 신청함 페이지 요청");
		
		return "webpage/ilchon/requestBox";
	}
	

	
	// 친구 신청 쪽지 팝업 열기 (+ 내가 클릭한 상대방의 파라미터 값(member.no) 불러오기)
	@ResponseBody
	@GetMapping("/webpage/ilchon/requestModal")
	public ModelAndView ilchonRequest(
					ModelAndView modelAndView,
					@RequestParam int no) {
		
		log.info("친구 신청 모달 요청");
		log.info("no: {}" + no);
		
		// 내가 친구하고 싶은 사람의 MemberNo을 통해 그 회원의 정보를 얻어오기
		Member member = service.findMemberByNo(no);
		
		System.out.println(member);

		modelAndView.addObject("member", member);
		modelAndView.setViewName("/webpage/ilchon/requestModal");

		return modelAndView;
	}
	
	// 친구 신청 쪽지 내용 insert (Request DB에 저장)
	@PostMapping("/webpage/ilchon/requestModal")
	public ModelAndView request(
			ModelAndView modelAndView,
			@ModelAttribute Request request,
			@SessionAttribute("loginMember") Member loginMember) {

		log.info("requestModal_친구 신청 쪽지 내용 전달");
		
		System.out.println("loginMember"+ loginMember);
		System.out.println("request"+ request);
		
		int result = 0;

		// 일촌 신청한 sender = 로그인한 user라는 것
		request.setSender(loginMember.getNo());
		
		log.info("member(receiver 정보 받아오기)");
		result = service.sentRequest(request);
		log.info("request함에 신청쪽지 내용 insert");
		
		if (result > 0) {
			// 정상적으로 보낸편지함 발송 완료
			modelAndView.addObject("msg", "일촌 신청 완료!");
			// insert되면 보드의 primary 값 no 받는거임
			modelAndView.addObject("script", "self.close()");
			modelAndView.addObject("location", "/webpage/ilchon/sent");
			//modelAndView.addObject("redirect:/sent");
		} else {
			// 보낸편지함 발송 실패
			modelAndView.addObject("msg", "일촌 신청 실패!");
			modelAndView.addObject("redirect:/memberList");
		}
		modelAndView.setViewName("common/msg");

		return modelAndView;
	}
	
	// 내가 보낸 편지함 open
	@GetMapping("/webpage/ilchon/sent")
	public ModelAndView sent(
			ModelAndView modelAndView,
			@SessionAttribute("loginMember") Member loginMember) {
		
		int no = 0;
		log.info("보낸 편지함");
		
		no = loginMember.getNo();
		
		List<Request> request = service.saveAllRequest(no);
		log.info("request"+request);
		
		System.out.println("request"+ request);
		
		modelAndView.addObject("request", request);
		modelAndView.setViewName("/webpage/ilchon/sent");
      
     return modelAndView;
	}
	
	// 내가 받은 편지함 open
	@GetMapping("/webpage/ilchon/inbox")
	public ModelAndView receive(
			ModelAndView modelAndView,
			@SessionAttribute("loginMember") Member loginMember) {
		
		int no = 0;
		log.info("받은 편지함");
		
		// 로그인한 사람의 no 값을 파라미터로 넘겨
		no = loginMember.getNo();
		
		// 나의 일촌 모음
		List<Ilchon> ilchons = service.findMyIlchons(no);
		
		List<Request> request = service.receiveAllRequest(no);
		log.info("request"+request);
		
		// 나의 일촌이 아닌 request 리스트 목록을 가져온다. (버튼 용도로 사용)
		List<Request> requestExceptIlchons = service.exceptMyRequest(ilchons, no);
		
		System.out.println("내 일촌이 아닌 사람들 requestExceptIlchons"+requestExceptIlchons);
		System.out.println("request"+ request);
		
		modelAndView.addObject("requestExceptIlchons", requestExceptIlchons);
		modelAndView.addObject("ilchons", ilchons);
		modelAndView.addObject("request", request);
		modelAndView.setViewName("/webpage/ilchon/inbox");
      
     return modelAndView;
	}
	
	
	// 받은 편지함에서 request 중 받은편지함 내용 불러오기
	@ResponseBody
	@GetMapping("/webpage/ilchon/acceptModal")
	public ModelAndView accept(
			ModelAndView modelAndView,
			@RequestParam int no) {
		
		log.info("requestNo: { }" + no);
		System.out.println(no);
		
		log.info("수락하는 팝업");
		// 내가 누른 팝업창의 사람의 팝업 정보를 얻어온다.
		Request request = service.acceptIlchon(no);
		
		System.out.println(request);
		
		modelAndView.addObject("request", request);
		modelAndView.setViewName("/webpage/ilchon/acceptModal");
		
		return modelAndView;
	}
	
	@PostMapping("/webpage/ilchon/acceptModal")
	public ModelAndView accept(
			ModelAndView modelAndView,
			@ModelAttribute Request request,
			@ModelAttribute Ilchon ilchon,
			@SessionAttribute("loginMember") Member loginMember) {
		
		log.info("@PostMapping(\"/acceptModal\") 일촌리스트에 insert");
		
		System.out.println("loginMember"+ loginMember);
		System.out.println("request"+ request);
		
		int result = 0;
		int no = 0;
		int requestNo = 0;
		
		// 로그인한 사람의 no 값을 파라미터로 넘겨 (받은 편지함 = 로그인한 user라는 것)
		no = loginMember.getNo();
		requestNo = request.getRequestNo();
		
		List<Ilchon> ilchons = service.findMyIlchons(no);
		System.out.println("requestNo"+ requestNo);
		
		request = service.receiveRequestInfo(no, requestNo);
		System.out.println("request는?"+ request);
		
		// 로그인한 user = 받은편지함의 일촌신청 받은 receiver = 일촌리스트 DB의 user
		ilchon = new Ilchon();
		ilchon.setUserNo(request.getReceiver());
		ilchon.setIlchonNo(request.getSender());
		ilchon.setIlchonNick(request.getIlchonNick());
		
		System.out.println("ilchon의 정보를 조사"+ilchon);
		
		log.info("ilchon 정보 insert하기)");
		result = service.sentIlchon(ilchon);
		
		System.out.println("inbox_loginMember"+ loginMember);
		System.out.println("inbox_request"+ request);
		
		if (result > 0) {
			// 정상적으로 일촌리스트 insert 완료
			modelAndView.addObject("msg", "일촌 수락!");
			modelAndView.addObject("ilchons", ilchons);
			modelAndView.addObject("script", "self.close()");
			modelAndView.addObject("location", "/webpage/ilchon/ilchonList");
		} else {
			// 일촌리스트 insert 실패
			modelAndView.addObject("msg", "일촌 실패!");
			modelAndView.addObject("ilchons", ilchons);
			modelAndView.addObject("redirect:/inbox");
		}
		modelAndView.setViewName("common/msg");

		return modelAndView;
	}
	
	
	// 받은 편지함에서 request 중 받은편지함 내용 불러오기
	@ResponseBody
	@GetMapping("/webpage/ilchon/readModal")
	public ModelAndView readModal(
			ModelAndView modelAndView,
			@RequestParam int no) {
		
		log.info("requestNo: { }" + no);
		System.out.println(no);
		
		log.info("보낸 팝업 읽는용으로");
		// 내가 누른 팝업창의 사람의 팝업 정보를 얻어온다.
		Request request = service.readIlchon(no);
		
		System.out.println(request);
		
		modelAndView.addObject("request", request);
		modelAndView.setViewName("/webpage/ilchon/readModal");
		
		return modelAndView;
	}
	
	
	@PostMapping("/webpage/ilchon/readModal")
	public ModelAndView read(
			ModelAndView modelAndView,
			@ModelAttribute Request request,
			@ModelAttribute Ilchon ilchon,
			@SessionAttribute("loginMember") Member loginMember) {
		
		log.info("@PostMapping(\"//readModal\") 읽는 용으로만 정보 가져오기");
		
		int no = 0;
		int requestNo = 0;
		
		// 로그인한 사람의 no 값을 파라미터로 넘겨 (보낸 편지함 = 로그인한 user는 보낸사람임)
		no = loginMember.getNo();
		requestNo = request.getRequestNo();
		
		request = service.sentRequestInfo(no, requestNo);
		System.out.println("request는?"+ request);
		
		modelAndView.addObject("request", request);
		modelAndView.setViewName("/webpage/ilchon/readModal");
		
		return modelAndView;
	}
	
	
	// 일촌 리스트 페이지
	// 1. 페이지 인포를 먼저 처리
	// 2. 로그인한 사람의 친구 리스트만 보여주기 (loginMember.getNo()) 
	// 3. 검색어 기능
	@GetMapping("/webpage/ilchon/ilchonList")
	public ModelAndView ilchonSearch(
			ModelAndView modelAndView,
			@RequestParam(defaultValue = "1") int page,
			@RequestParam(defaultValue = "1") String type,
			@RequestParam(value="keyword", required = false) String keyword,
			@SessionAttribute("loginMember") Member loginMember) {
		
		if (type.equals("1")) {
			log.info("@GetMapping(\"/ilchonList\") 일촌 리스트 페이지 요청");
			int no = 0;
			int listCount = 0;
			
			no = loginMember.getNo();
			listCount = service.getIlchonCount(no);
			log.info("listCount : {}", listCount);
			
			// 5개 페이지까지 보이고 + 한 페이지 최대 8명의 일촌리스트가 보임
			PageInfo pageInfo = new PageInfo(page, 5, listCount, 8);
			List<Ilchon> ilchon = service.findAllIlchons(pageInfo, no);
			log.info("ilchon"+ ilchon);
			
			modelAndView.addObject("ilchon", ilchon);
			modelAndView.addObject("pageInfo", pageInfo);
			modelAndView.addObject("listCount", listCount);
			modelAndView.setViewName("/webpage/ilchon/ilchonList");
		} else {
			List<Ilchon> ilchon = null;
			int no = 0;
			int listCount = 0;
			
			no = loginMember.getNo();
			listCount = service.getIlchonCount(no);
			log.info("검색 시 listCount : {}", listCount);
			
			// 5개 페이지까지 보이고 + 한 페이지 최대 8명의 일촌리스트가 보임
			PageInfo pageInfo = new PageInfo(page, 5, listCount, 8);
			ilchon = service.ilchonSearch(no, type, keyword);
			System.out.println(ilchon);
			
			if (ilchon != null) {
				modelAndView.addObject("ilchon", ilchon);
				modelAndView.addObject("pageInfo", pageInfo);
				modelAndView.addObject("listCount", listCount);
				modelAndView.setViewName("/webpage/ilchon/ilchonList");
			}else {
				modelAndView.addObject("msg","조회되는 일촌정보가 없습니다.");
				modelAndView.addObject("location","/webpage/ilchon/ilchonList");
				modelAndView.setViewName("common/msg");
			}
		}
		return modelAndView;
	}
	
	// y로 바뀌게 
	@PostMapping("/webpage/ilchon/updateRequestStatus")
	@ResponseBody
    public String updateRequestStatus(int requestNo) {
		
		String status = null;
    	
    	status = service.updateRequestStatus(requestNo);
        return "redirect:/webpage/ilchon/readModal";
    }
	
	// (일촌리스트에서 미니홈피를 가져오려면..?)
//	
//	@GetMapping("/minihome/minihomepage/{minihomeNo}")
//	private ModelAndView minihomeNo(ModelAndView modelAndView,
//								  @PathVariable("minihomeNo") int minihomeNo, 
//								  @SessionAttribute("loginMember") Member loginMember ) {
//		
//		System.out.println("minihomeNo" + minihomeNo);
//		
//		int miniNo = 0;
//		
//		miniNo =  service.getuserno(minihomeNo);	
//		
//		modelAndView.addObject(miniNo);
//		modelAndView.addObject(loginMember);
//		
//		System.out.println("miniNo :" + miniNo);
//		System.out.println("loginMember : " + miniNo);
//		modelAndView.setViewName("minihome/home/minihomepage");
//		
//		return modelAndView;
//	}
//	

	// 일촌 delete 하기
	@GetMapping("/webpage/ilchon/ilchonDelete/{no}")
	public ModelAndView ilchonDelete(ModelAndView modelAndView,
									@SessionAttribute("loginMember") Member loginMember,
									@PathVariable int no) {
		
		int result = 0;
		
		// 일촌의 찾기
		int userNo = loginMember.getNo();
		
		Ilchon ilchon = service.findMyIlchonByNo(userNo, no);
		ilchon.setIlchonNo(no);
		
		System.out.println("ilchon.getUserNo()"+ilchon.getUserNo());
		System.out.println("loginMember.getNo()" + loginMember.getNo());
		
		if(ilchon != null && ilchon.getUserNo() == loginMember.getNo()) {
			result = service.deleteIlchon(no);
			
			System.out.println("no은 무엇인가?"+no);
			
			if(result > 0) {
				modelAndView.addObject("msg", "일촌이 정상적으로 삭제되었습니다.");
				modelAndView.addObject("location", "/webpage/ilchon/ilchonList");
			} else {
				modelAndView.addObject("msg", "일촌 삭제를 실패하였습니다.");
				modelAndView.addObject("location", "/webpage/ilchon/ilchonList");
			}
		} else {			
			modelAndView.addObject("msg", "잘못된 접근입니다.");
			modelAndView.addObject("location", "/webpage/ilchon/ilchonList");		
		}
		
		modelAndView.setViewName("common/msg");
		
		return modelAndView;
	}
	
	@ResponseBody
	@GetMapping("/ilchon/ilchonNickUpdate/{no}")
	public int titleUpdate(@SessionAttribute("loginMember") Member loginMember,
			@RequestParam("ilchonNick") String ilchonNick,
			@PathVariable int no) {
		
		int userNo = loginMember.getNo();
		
		Ilchon ilchon = service.findMyIlchonByNo(userNo, no);
		ilchon.setIlchonNo(no);
		
		int result = service.updateilchonNick(userNo, ilchonNick, no);
		
		return result;
	}
	
	
	
}