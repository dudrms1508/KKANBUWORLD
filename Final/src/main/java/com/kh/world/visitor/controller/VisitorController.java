package com.kh.world.visitor.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.kh.world.member.model.service.MemberService;
import com.kh.world.member.model.vo.Member;
import com.kh.world.minihome.model.vo.MemberMinihome;
import com.kh.world.minihome.model.vo.Minihome;
import com.kh.world.visitor.model.service.VisitorService;
import com.kh.world.visitor.model.vo.ReportCategory;
import com.kh.world.visitor.model.vo.Visitor;
import com.kh.world.visitor.model.vo.VisitorReply;

import lombok.extern.slf4j.Slf4j;
import retrofit2.http.POST;

@Slf4j
@Controller
@SessionAttributes({"loginMember"})
public class VisitorController {
	@Autowired
	private VisitorService service;
	
	@Autowired
	private MemberService memberService;
	
	// 홈에서 미니홈피 테스트로 보내주는 controller
	@GetMapping("/minihomeTest/{minihomeNo}")
	public String minihomeTest(@PathVariable("minihomeNo") int minihomeNo,
								Model model) {
		
		model.addAttribute("minihomeNo", minihomeNo);
		
		
		return "minihome/visitor/minihomeTest";
	}
	
	
	// 홈에서 버튼 클릭하면 방명록으로 가게해주는 controller
	@GetMapping("/minihome/visitor/{minihomeNo}")
	public ModelAndView visitorTest(@PathVariable("minihomeNo") int minihomeNo,
								ModelAndView modelAndView) {
		

		System.out.println("미니홈No 해당유저의 미니 홈페이지로 포워딩 : " + minihomeNo);	
		modelAndView.addObject("minihomeNo", minihomeNo);
		modelAndView.setViewName("minihome/visitor/view");
		
		return modelAndView;
	}
	
	// 방명록 iframe을 보여주는 controller
	// 방명록 누르면 바로 보이는 write.jsp
	@GetMapping("/minihome/visitor/write/{minihomeNo}")
	public ModelAndView visitor(ModelAndView modelAndView,
								@SessionAttribute("loginMember") Member loginMember,
								@PathVariable("minihomeNo") int minihomeNo ) {
		
		System.out.println("visitor/write으로 오는 minohomeNo 값 : " + minihomeNo);

		// view에 방명록 게시글 리스트 보여줘야함 -> 가져오기
		List<Visitor> visitorList = service.findAllVisitor(minihomeNo);
		System.out.println(visitorList);
		
		MemberMinihome minihomeUser = service.findUserByminihomeNo(minihomeNo);
		
		System.out.println("minihomeUser" + minihomeUser);
		
		// 댓글 리스트 보여주기
		modelAndView.setViewName("minihome/visitor/write");
		modelAndView.addObject("minihomeUser", minihomeUser);
		modelAndView.addObject("minihomeNo", minihomeNo);
		modelAndView.addObject("visitorList", visitorList);		
		
		return modelAndView;
	}


	// 아이프레임 경로 테스트
	@GetMapping("/minihome/visitor/iframe/test")
	public String iframeTest() {
		
		return "minihome/visitor/test";
	}
	
	
	
	// 방명록 글쓰기 로직
	@PostMapping("/minihome/visitor/write/{minihomeNo}")
	public ModelAndView visitorWrite(ModelAndView modelAndView,
									@SessionAttribute("loginMember") Member loginMember,
									@PathVariable("minihomeNo") int minihomeNo,
									@RequestParam("visitorContent") String content,
									@RequestParam(value = "secretCheck", required = false) String secretCheck) {
		// 방명록(댓글까지 가져옴)
		Visitor visitor = new Visitor();
		
		String secret = null;
		System.out.println("minihomeNo가 " + minihomeNo + "에 해당하는 곳에 insert할 것 : ");
		System.out.println("secretCheck 여부는 : " + secretCheck);
		System.out.println("글쓰기 내용은 : " + content);
		
		if(secretCheck != null) {
			// secretCheck해서 비밀글임
			secret = "Y";
			// loginMember.getNo()는 해당 미니홈피에 글쓰는애
			// minihomeNo는 해당 미니홈피의 방명록에 글을 쓴다는 뜻
			int result = service.insertVisitor(loginMember.getNo(), minihomeNo, content, secret);
			
			if(result > 0) {
				// 성공
				modelAndView.setViewName("common/msg");
				modelAndView.addObject("msg", "방명록 등록 성공");
				modelAndView.addObject("location", "/minihome/visitor/write/" + minihomeNo);
			} else {
				// 실패 
				modelAndView.setViewName("common/msg");
				modelAndView.addObject("msg", "방명록 등록 실패");
				modelAndView.addObject("location", "/minihome/visitor/write/" + minihomeNo);
				
			}
			
		} else {
			// 비밀글이 아님
			secret = "N";
			int result = service.insertVisitor(loginMember.getNo(), minihomeNo, content, secret);
			
			if(result > 0) {
				// 성공
				modelAndView.setViewName("common/msg");
				modelAndView.addObject("msg", "방명록 등록 성공");
				modelAndView.addObject("location", "/minihome/visitor/write/" + minihomeNo);
			} else {
				// 실패 
				modelAndView.setViewName("common/msg");
				modelAndView.addObject("msg", "방명록 등록 실패");
				// location은 controller로 다시 보내는 것이기 때문에 minihome 주소까지 같이 주기
				modelAndView.addObject("location", "/minihome/visitor/write/" + minihomeNo);
			}
			
		}
		
//		modelAndView.setViewName("minihome/visitor/write); // iframe은 visitor/write로..
		
		return modelAndView;
	}
	
	
	@PostMapping("/minihome/visitor/writeReply/{minihomeNo}")
	public ModelAndView visitorReply(ModelAndView modelAndView, 
									@SessionAttribute("loginMember") Member loginMember,
									@PathVariable("minihomeNo") int minihomeNo,
									@RequestParam("visitorNo") int visitorNo,
									@RequestParam("replycontent") String content) {
		
		int writerNo = loginMember.getNo();
		System.out.println("방명록 번호(여기다가 댓 쓸거~) " + visitorNo);
		System.out.println("댓글 내용은 " + content);

		// 글 쓰는 애는 로그인 멤버
		int result = service.insertReply(writerNo, visitorNo, content);
		
		if(result > 0) {
			System.out.println("댓글달기 성공");
			modelAndView.setViewName("common/msg");
			modelAndView.addObject("msg", "댓글을 작성하였습니다.");
			modelAndView.addObject("location", "/minihome/visitor/write/" + minihomeNo);

		} else {
			modelAndView.setViewName("common/msg");
			modelAndView.addObject("msg", "댓글 작성에 실패하였습니다. 다시 시도해주세요.");
			modelAndView.addObject("location", "/minihome/visitor/write/" + minihomeNo);
		}
		
		
		return modelAndView;
	}
	
	
	// 방명록 수정
	@GetMapping("minihome/visitor/update/{minihomeNo}")
	public ModelAndView updateVisitor(ModelAndView modelAndView,
									@PathVariable int minihomeNo,
									@SessionAttribute("loginMember") Member loginMember,
									@RequestParam int visitorNo) {
		
		System.out.println("minihomeNo는 " + minihomeNo);
		System.out.println("visitorNo는 " + visitorNo);
		
		// visitorNo에 해당하는 방명록 찾기
		Visitor visitor = service.findVisitorByNo(visitorNo);
//		System.out.println("수정할 방명록 정보 " + visitor);
		
		modelAndView.setViewName("minihome/visitor/update");
		modelAndView.addObject("minihomeNo", minihomeNo);
		modelAndView.addObject("visitorNo", visitorNo);
		modelAndView.addObject("visitor", visitor);
		
		return modelAndView;
	}
	
	
	@PostMapping("minihome/visitor/update/{minihomeNo}")
	public ModelAndView updateVisitor(ModelAndView modelAndView,
									@PathVariable("minihomeNo") int minihomeNo,
									@RequestParam("content") String content,
									@RequestParam("visitorNo") int visitorNo,
									@SessionAttribute("loginMember") Member loginMember) {

		// 방명록 update 해주기
		int result = service.updateVisitor(visitorNo, content);
		
		if(result > 0) {
			
			modelAndView.setViewName("common/msg");
			modelAndView.addObject("msg", "방명록이 수정되었습니다.");
			modelAndView.addObject("location", "/minihome/visitor/write/" + minihomeNo);
		} else {
			
			modelAndView.setViewName("common/msg");
			modelAndView.addObject("msg", "방명록 수정에 실패하였습니다. 다시 시도해 주세요.");
			modelAndView.addObject("location", "/minihome/visitor/write/" + minihomeNo);
		}
		
		
		return modelAndView;
	}
	
	// 방명록 삭제
	@GetMapping("/minihome/visitor/delete/{minihomeNo}")
	public ModelAndView deleteVisitor(ModelAndView modelAndView,
									@PathVariable("minihomeNo") int minihomeNo,
									@RequestParam("visitorNo") int visitorNo) {
		
		int result = service.deleteVisitor(visitorNo);
		
		if(result > 0) {
			modelAndView.setViewName("common/msg");
			modelAndView.addObject("msg", "방명록이 삭제되었습니다.");
			modelAndView.addObject("location", "/minihome/visitor/write/" + minihomeNo);
			
		} else {

			modelAndView.setViewName("common/msg");
			modelAndView.addObject("msg", "방명록 삭제에 실패하였습니다. 다시 시도해 주세요.");
			modelAndView.addObject("location", "/minihome/visitor/write/" + minihomeNo);
		}
		
		return modelAndView;
	}

	
	// 신고하기
	@GetMapping("minihome/visitor/report/{minihomeNo}")
	public ModelAndView report(ModelAndView modelAndView,
								@PathVariable("minihomeNo") int minihomeNo,
								@RequestParam("reportCode") String reportCode,
								@RequestParam("visitorNo") int visitorNo) {
		
//		System.out.println("minihomeNo " + minihomeNo);
//		System.out.println("reportCode " + reportCode);
//		System.out.println("visitorNo " + visitorNo);
		// 카테고리 넘기기
		List<ReportCategory> categoryList = service.findReportCategory();
		System.out.println(categoryList);
		
		modelAndView.addObject("categoryList", categoryList);
		modelAndView.addObject("minihomeNo", minihomeNo);
		modelAndView.addObject("reportCode", reportCode);
		modelAndView.addObject("visitorNo", visitorNo);
		modelAndView.setViewName("minihome/visitor/report");
		
		return modelAndView;
	}
	
	
	@PostMapping("minihome/visitor/report/{minihomeNo}")
	public ModelAndView report(ModelAndView modelAndView,
								@SessionAttribute("loginMember") Member loginMember,
								@RequestParam("visitorNo") int visitorNo,
								@RequestParam("reportCode") String reportCode,
								@RequestParam("content") String content,
								@RequestParam("categoryCode") String categoryCode,
								@PathVariable("minihomeNo") int minihomeNo) {
		
		String userId = loginMember.getId();
		
		// minihomeNo를 넣을지.. 컬럼을 추가해야하는지...
		int result = service.insertReport(userId, reportCode, visitorNo, categoryCode, content);
		
		if(result > 0) {
			modelAndView.setViewName("webpage/gift/popUpCloseSelf");
			modelAndView.addObject("msg", "정상적으로 신고되었습니다.");
//			modelAndView.addObject("location", "/minihome/visitor/write/" + minihomeNo);
			
		} else {
			modelAndView.setViewName("webpage/gift/popUpCloseSelf");
			modelAndView.addObject("msg", "신고에 실패하였습니다. 다시 시도해주세요.");
//			modelAndView.addObject("location", "/minihome/visitor/write/" + minihomeNo);
			
		}
		
		
		return modelAndView;
	}
	
	@ResponseBody
	@PostMapping("minihome/visitor/updateReply/{minihomeNo}")
	public Map<String, Object> updateReply(@RequestParam("visitorNo") int visitorNo,
											@SessionAttribute("loginMember") Member loginMember,
											@RequestParam("vreNo") int vreNo,
											@RequestParam("content") String content,
											@PathVariable("minihomeNo") int minihomeNo) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		int userNo = loginMember.getNo();
		
		System.out.println(visitorNo);
		System.out.println(vreNo);
		System.out.println(content);
		System.out.println(minihomeNo);
		System.out.println(loginMember.getName());
		
		int result = service.updateReply(userNo, visitorNo, vreNo, content);
		
		if(result > 0) {
			VisitorReply reply = service.findReplyByNo(vreNo);
			map.put("updateReplyContent", reply.getContent());
			
		
		} else {

			
		}
		
		return map; 
	}
	
	
	@GetMapping("minihome/visitor/deleteReply/{minihomeNo}")
	public ModelAndView deleteReply(ModelAndView modelAndView,
									@RequestParam("visitorNo") int visitorNo,
									@RequestParam("vreNo") int vreNo,
									@PathVariable("minihomeNo") int minihomeNo,
									@SessionAttribute("loginMember") Member loginMember) {
		int userNo = loginMember.getNo();
		
		int result = service.deleteReply(vreNo, userNo);
		
		if(result > 0) {
			// 성공
			modelAndView.setViewName("common/msg");
			modelAndView.addObject("msg", "댓글 삭제 성공");
			modelAndView.addObject("location", "/minihome/visitor/write/" + minihomeNo);
		} else {
			
			modelAndView.setViewName("common/msg");
			modelAndView.addObject("msg", "댓글 삭제에 실패하였습니다. 다시 시도해주세요.");
			modelAndView.addObject("location", "/minihome/visitor/write/" + minihomeNo);
		}
		
		
		return modelAndView;
	}
	
	
	@ResponseBody
	@PostMapping("/minihome/visitor/insertDepthReply/{minihomeNo}")
	public Map<String, Object> insertDepthReply(@SessionAttribute("loginMember") Member loginMember,
												@ModelAttribute VisitorReply reply,
												@PathVariable("minihomeNo") int minihomeNo) {
		
		Map<String, Object> map = new HashMap<>();
		
		reply.setWriter(loginMember);
		
		System.out.println(reply);		
//		System.out.println(minihomeNo);
		int result = service.insertDepthReply(reply);
		
		
		return map;
	}
	
	
	@ResponseBody
	@PostMapping("/minihome/visitor/depthUpdate/{minihomeNo}")
	public Map<String, Object> updateDepth(@SessionAttribute("loginMember") Member loginMember,
											@ModelAttribute VisitorReply reply,
											@PathVariable("minihomeNo") int minihomeNo) {
		Map<String, Object> map = new HashMap<>();
		reply.setWriter(loginMember);
		
		System.out.println(reply);
		
		int result = service.updateDepth(reply);
		
		map.put("result", result);
		
		return map;
	}
	
	@ResponseBody
	@PostMapping("/minihome/visitor/depthDelete/{minihomeNo}")
	public Map<String, Object> deleteDepth(@SessionAttribute("loginMember") Member loginMember,
											@ModelAttribute VisitorReply reply,
											@PathVariable("minihomeNo") int minihomeNo) {
		Map<String, Object> map = new HashMap<>();
		reply.setWriter(loginMember);
		reply.setStatus("N");
		
		System.out.println(reply);
		
		int result = service.deleteDepth(reply);
		
		map.put("result", result);
		
		return map;
	}
	
	
	
}
