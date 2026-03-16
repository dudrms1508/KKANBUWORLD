package com.kh.world.admin.controller;

import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ResourceLoader;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kh.world.admin.model.service.AdminService;
import com.kh.world.admin.model.vo.Product;
import com.kh.world.admin.model.vo.QNA;
import com.kh.world.admin.model.vo.Report;
import com.kh.world.common.util.MultipartFileUtil;
import com.kh.world.common.util.PageInfo;
import com.kh.world.member.model.service.MemberService;
import com.kh.world.member.model.vo.Member;
import com.kh.world.miniBoard.model.vo.Board;
import com.kh.world.miniBoard.model.vo.Reply;
import com.kh.world.minihome.model.vo.MemberMinihome;

@Controller
@RequestMapping("/admin")
public class AdminController {

	@Autowired
	private AdminService adminservice;
	
	@Autowired
	private ResourceLoader resourceLoader;
	
	@Autowired
	private MemberService memberService;
	
	//미니홈피 방문
//	@GetMapping("/minihomepage/{minihomeNo}")
//	private ModelAndView minihome(ModelAndView modelAndView,
//								  @PathVariable("minihomeNo") int minihomeNo ) {
//		
//		System.out.println("minihomeNo" + minihomeNo);
//		
//		modelAndView.setViewName("minihome/home/minihomepage");
//		
//		return modelAndView;
//		
//	}
	@GetMapping("/minihomepage")
	private ModelAndView minihome(ModelAndView modelAndView,
			@RequestParam("no") int no) {
		
		MemberMinihome memberMinihome = memberService.findMinihomeByNo(no);
		System.out.println(memberMinihome);
		modelAndView.addObject("memberMinihome", memberMinihome);
		modelAndView.setViewName("minihome/home/minihomepage");
		
		return modelAndView;
		
	}
	
	//회원관리
	@GetMapping("/adminMember")
	public ModelAndView memberlist(ModelAndView modelAndView, @RequestParam(defaultValue = "1") int page) {
		int listCount = adminservice.getMemberCount();
		
		PageInfo pageInfo = new PageInfo(page, 10, listCount, 10);
		List<Member> memberlist = adminservice.findAllMember(pageInfo);
		
		
		System.out.println(memberlist);
		modelAndView.addObject("pageInfo", pageInfo);
		modelAndView.addObject("memberlist", memberlist);
		modelAndView.setViewName("webpage/admin/adminMember");
		
		return modelAndView;
	}
	
	@GetMapping("/status")
	public ModelAndView update(
				ModelAndView modelAndView,
				@RequestParam int no,
				@RequestParam String state
				) {
		

		
		int result = 0;
		
		result = adminservice.save(no, state);			
	
		
		if(result > 0) {
			modelAndView.addObject("msg", "처리 완료.");				
		}else {
			modelAndView.addObject("msg", "다시 시도해 주세요.");			
		}
		
		modelAndView.addObject("location", "/admin/adminMember?table=MEMBER");
		modelAndView.setViewName("common/msg");
		
		return modelAndView;
	}
	
	//문의
	@GetMapping("/adminQnA")
	public ModelAndView qna(ModelAndView modelAndView, @RequestParam(defaultValue = "1") int page, @RequestParam("table") String table) {
		int listCount = adminservice.getTableCount(table);
		
		PageInfo pageInfo = new PageInfo(page, 10, listCount, 10);
		List<QNA> qnalist = adminservice.findAllQna(pageInfo);
		
		System.out.println(qnalist);
		modelAndView.addObject("pageInfo", pageInfo);
		modelAndView.addObject("qnalist", qnalist);
		modelAndView.setViewName("webpage/admin/adminQnA");
		
		return modelAndView;
	}
	
	@GetMapping("/qnaView")
	public ModelAndView qnaView(ModelAndView modelAndView, @RequestParam int no) {
		QNA qna = null;
		
		qna = adminservice.findQnaByNo(no);
		
		System.out.println(qna);
		modelAndView.addObject("qna", qna);
		modelAndView.setViewName("webpage/admin/adminQnaView");
		
		return modelAndView;
	}
	
	@GetMapping("/sendQnaEmail")
	public ModelAndView qnaEmail(ModelAndView modelAndView, 
								@RequestParam String email,
								@RequestParam int no
								) {
		
		int result = 0;
		
		adminservice.sendEmail(email);
		result = adminservice.deleteQna(no);			
			
		if(result > 0) {
			modelAndView.addObject("msg", "처리 완료.");				
		}else {
			modelAndView.addObject("msg", "다시 시도해 주세요.");			
		}
		
		modelAndView.addObject("location", "/admin/adminQnA?table=QNA");
		modelAndView.setViewName("common/msg");
		
		
		return modelAndView;
	}
	
	//신고
	@GetMapping("/report")
	public ModelAndView report(ModelAndView modelAndView, @RequestParam(defaultValue = "1") int page, @RequestParam("table") String table) {
		int listCount = adminservice.getTableCount(table);
		
		PageInfo pageInfo = new PageInfo(page, 10, listCount, 10);
		List<Report> reportlist = adminservice.findAllReport(pageInfo);
		
		System.out.println(reportlist);
		modelAndView.addObject("pageInfo", pageInfo);
		modelAndView.addObject("reportlist", reportlist);
		modelAndView.setViewName("webpage/admin/adminReport");
		
		return modelAndView;
	}
	
	@GetMapping("/sendReportEmail")
	public ModelAndView reportEmail(ModelAndView modelAndView, 
									@RequestParam String id,
									@RequestParam int no
									) {
		
		int result = 0;
		
		Member member = adminservice.findMemberById(id);
		System.out.println(member);
		String email = member.getEmail();
		
		adminservice.sendEmail(email);
		result = adminservice.deleteReport(no);			
			
		if(result > 0) {
			modelAndView.addObject("msg", "처리 완료.");				
		}else {
			modelAndView.addObject("msg", "다시 시도해 주세요.");			
		}
		
		modelAndView.addObject("location", "/admin/report?table=REPORT");
		modelAndView.setViewName("common/msg");
		
		
		return modelAndView;
	}
	
	//상품관리
	@GetMapping("/product")
	public ModelAndView minimilist(ModelAndView modelAndView, @RequestParam(defaultValue = "1") int page, @RequestParam String product) {
		String category = product;
		int listCount = adminservice.getProductCount(product);
		PageInfo pageInfo = new PageInfo(page, 10, listCount, 10);
		List<Product> productlist = adminservice.findAllProduct(pageInfo, product);
		
		modelAndView.addObject("category", category);
		modelAndView.addObject("pageInfo", pageInfo);
		modelAndView.addObject("productlist", productlist);
		modelAndView.setViewName("webpage/admin/adminProduct");
		
		return modelAndView;
	}
	
	@GetMapping("/productDelete")
	public ModelAndView productDelete(
				ModelAndView modelAndView,
				@RequestParam int no,
				@RequestParam String state,
				@RequestParam String product
				) {
		
		int result = 0;
		
		result = adminservice.deleteProduct(no, state);
		
		if(result > 0) {
			modelAndView.addObject("msg", "처리 완료.");				
		}else {
			modelAndView.addObject("msg", "다시 시도해 주세요.");			
		}
		
		modelAndView.addObject("location", "/admin/product?product=" + product);
		modelAndView.setViewName("common/msg");
		
		return modelAndView;
	}
	
	
	
	//상품등록
	@GetMapping("/register")
	public String register() {
		
		return "webpage/admin/adminRegister";
	}
	
	@PostMapping("/register")
	public ModelAndView register(
			ModelAndView modelAndView,
			@ModelAttribute Product product,
			@RequestParam("upfile") MultipartFile upfile) {
		
		int result = 0;
		
		System.out.println(product);
//		if (!ObjectUtils.isEmpty(upfile)) {
		if (upfile != null && !upfile.isEmpty()) {
			String location = null;
			String productFile = null;
			
			try {
				// 어디서부터 읽어올지 경로를 설정
				location = resourceLoader.getResource("resources/image/shop").getFile().getPath();
				productFile = MultipartFileUtil.save(upfile, location);
				
			} catch (IOException e) {
				e.printStackTrace();
			}
			
			if (productFile != null) {
				product.setProductUrl(location);
				product.setProductFile(upfile.getOriginalFilename());
			}
		}
	
		result = adminservice.save(product);
		
		if (result > 0) {
			modelAndView.addObject("msg", "상품 등록 완료이 정상처리 됐습니다.");
			modelAndView.addObject("location", "/admin/product?product=" + product.getCategoryCode());			
		}else {
			modelAndView.addObject("msg", "상품 등록이 정상적으로 처리되지 않았습니다.");
			modelAndView.addObject("location", "/admin/register");
		}
		
		modelAndView.setViewName("common/msg");
		
		return modelAndView;
	}
}
