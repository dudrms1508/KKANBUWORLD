package com.kh.world.photo.controller;

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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kh.world.common.util.MultipartFileUtil;
import com.kh.world.common.util.PageInfo;
import com.kh.world.member.model.service.MemberService;
import com.kh.world.member.model.vo.Member;
import com.kh.world.minihome.model.vo.MemberMinihome;
import com.kh.world.minihome.model.vo.Minihome;
import com.kh.world.photo.model.service.PhotoService;
import com.kh.world.photo.model.vo.Photo;
import com.kh.world.photo.model.vo.PhotoReply;

@Controller
@RequestMapping("/minihome/photo")
@SessionAttributes(value = {"loginMember"})
public class PhotoController {
	@Autowired
	private PhotoService service;
	
	@Autowired
	private MemberService memberService;
	
	@Autowired
	private ResourceLoader resourceLoader;
	
	
	@GetMapping("/photo/{minihomeNo}")
	public ModelAndView photo(ModelAndView modelAndView,
				  			@PathVariable("minihomeNo") int minihomeNo,
				  			@SessionAttribute("loginMember") Member loginMember
			  ) {
		//로그인한 아이디 미니홈피
		int userNo = loginMember.getNo();
		MemberMinihome memberMinihome = memberService.findMinihomeByNo(userNo);
		modelAndView.addObject("memberMinihome", memberMinihome);

		
		modelAndView.addObject("minihomeNo", minihomeNo);
		
		modelAndView.setViewName("/minihome/photo/photo");
		
		return modelAndView;
	}
	
	
	
	@GetMapping("/home/{minihomeNo}")
	public ModelAndView home(ModelAndView modelAndView,
							@PathVariable("minihomeNo") int minihomeNo,
							@SessionAttribute("loginMember") Member loginMember
			) {
		
		
		
		
		
		
		
		List<Photo> lastPT = service.findLastPhoto(minihomeNo);
		System.out.println(lastPT);
		List<Photo> replyPT = service.findReplyPhoto(minihomeNo);
		System.out.println(replyPT);
		List<Photo> viewPT = service.findViewPhoto(minihomeNo);
		System.out.println(viewPT);
		
		
		modelAndView.addObject("lastPT", lastPT);
		modelAndView.addObject("replyPT", replyPT);
		modelAndView.addObject("viewPT", viewPT);

		modelAndView.addObject("minihomeNo", minihomeNo);
		modelAndView.setViewName("/minihome/photo/home");
		
		return modelAndView;
	}
	
	
	
	
	@GetMapping("/{minihomeNo}/view")
	public ModelAndView view(ModelAndView modelAndView,
				  			@PathVariable("minihomeNo") int minihomeNo,
				  			@SessionAttribute("loginMember") Member loginMember,
				  			@RequestParam int no
			) {
		Minihome minihome =null;
		minihome = service.findMinihomeByNo(minihomeNo);
		modelAndView.addObject("minihome", minihome);
		
		int pre = no - 1;
		int next = no + 1;
		int userNo = loginMember.getNo();
		MemberMinihome memberMinihome = memberService.findMinihomeByNo(userNo);
		modelAndView.addObject("memberMinihome", memberMinihome);
		
		Photo photo = null;
		
        //사진번호로 댓글리스트 조회
        List<PhotoReply> list =null;
        list = service.findReplyByNo(no);
        System.out.println(list);
        
		photo = service.findPhotoByNo(no);
		
        modelAndView.addObject("pre", pre);
        modelAndView.addObject("next", next);
        modelAndView.addObject("list", list);
		modelAndView.addObject("photo", photo);
		modelAndView.setViewName("/minihome/photo/view");
		
		return modelAndView;
	}
	
	
	@GetMapping("/insert/{minihomeNo}")
	public ModelAndView insert(ModelAndView modelAndView,
							@PathVariable("minihomeNo") int minihomeNo,
							//현재 폴더번호 받아오기,
				  			@SessionAttribute("loginMember") Member loginMember
				  			
  			) {
		
		modelAndView.setViewName("/minihome/photo/insert");
		
		return modelAndView;
	}
	
	
	@PostMapping("/insert/{minihomeNo}")
	public ModelAndView insert(ModelAndView modelAndView,
							@PathVariable("minihomeNo") int minihomeNo,
							@SessionAttribute("loginMember") Member loginMember,
							@RequestParam("upfile") MultipartFile upfile,
							@RequestParam(required = false, defaultValue = "0") int folderNo,
							@RequestParam String title,
							@RequestParam String comment,
							@RequestParam(required = false) String oname,
							@RequestParam(required = false) String rname,
							@RequestParam(required = false) String url,
							@ModelAttribute Photo photo
							
			) {
		Minihome minihome =null;
		minihome = service.findMinihomeByNo(minihomeNo);
		modelAndView.addObject("minihome", minihome);
		
		int result = 0;
		
		
		if (upfile != null && !upfile.isEmpty()) {
			String location = null;
			String renamedFilename = null;
			try {
				location = resourceLoader.getResource("resources/upload/photo").getFile().getPath();
				
				renamedFilename = MultipartFileUtil.save(upfile, location);
				
				
			} catch (IOException e) {
				e.printStackTrace();
			}
			if (renamedFilename != null) {
				photo.setOname(upfile.getOriginalFilename());
				photo.setRname(renamedFilename);
				photo.setUrl("/resources/upload/photo/"+renamedFilename);
			}
		}
		
		
		result = service.save(photo);
		if(loginMember != null && loginMember.getNo() == minihome.getUserNo()) {
			
			if(result>0) {
				modelAndView.addObject("minihomeNo", minihomeNo);
				modelAndView.addObject("msg","사진이 정상적으로 등록되었습니다.");
				modelAndView.addObject("location","/minihome/photo/home/"+minihomeNo);
			}else {
				modelAndView.addObject("msg","사진이 등록을 실패하였습니다.");
				modelAndView.addObject("location","/minihome/photo/insert/"+minihomeNo);
			}
		}else {
			modelAndView.addObject("msg","아이디를 확인해 주세요.");
			modelAndView.addObject("location","/webpage/member/login");
		}
		
		modelAndView.setViewName("common/msg");
		
		return modelAndView;
	}

	@GetMapping("/{minihomeNo}/folder")
	public ModelAndView folder(ModelAndView modelAndView,
							@PathVariable("minihomeNo") int minihomeNo,
				  			@SessionAttribute("loginMember") Member loginMember,
				  			@RequestParam(required = false, defaultValue = "0" ) int folderNo,
				  			@RequestParam(defaultValue = "1") int page
  			) {
		List<Photo> list = null;
		Minihome minihome =null;
		minihome = service.findMinihomeByNo(minihomeNo);
		modelAndView.addObject("minihome", minihome);
		
		int listCount = service.getPhotoCountByFolder(folderNo,minihomeNo);
				
		PageInfo pageInfo = new PageInfo(page, 5, listCount, 4);
		list = service.findPhotoByFolderNo(folderNo,minihomeNo,pageInfo);
		
		modelAndView.addObject("list", list);
		modelAndView.addObject("pageInfo",pageInfo);
		modelAndView.setViewName("/minihome/photo/folder");
		
		return modelAndView;
	}
	
	@GetMapping("/{minihomeNo}/update")
	public ModelAndView update(ModelAndView modelAndView,
							@PathVariable("minihomeNo") int minihomeNo,
				  			@SessionAttribute("loginMember") Member loginMember,
				  			@RequestParam int no
				  			
  			) {
		Photo photo = null;
		
		photo = service.findPhotoByNo(no);
		System.out.println(photo.getTitle());
		
		modelAndView.addObject("photo", photo);
		modelAndView.setViewName("/minihome/photo/update");
		
		return modelAndView;
	}
	
	@PostMapping("/{minihomeNo}/update")
	public ModelAndView update(ModelAndView modelAndView,
							@PathVariable("minihomeNo") int minihomeNo,
							@SessionAttribute("loginMember") Member loginMember,
							@RequestParam int no,
							@RequestParam("upfile") MultipartFile upfile,
							@RequestParam(required = false, defaultValue = "0") int folderNo,
							@RequestParam String title,
							@RequestParam String comment,
							@RequestParam(required = false) String oname,
							@RequestParam(required = false) String rname,
							@RequestParam(required = false) String url
			
			) {
		Minihome minihome =null;
		minihome = service.findMinihomeByNo(minihomeNo);
		modelAndView.addObject("minihome", minihome);
		Photo photo = null;
		
		int result = 0 ;
		photo = service.findPhotoByNo(no);
		
		if (photo != null && loginMember != null && loginMember.getNo() == minihome.getUserNo()) {
			
			if (upfile != null && !upfile.isEmpty()) {
				String location = null;
				String renamedFileName = null;
				
				try {
					location = resourceLoader.getResource("resources/upload/photo/").getFile().getPath();
					
					//이전에 업로드된 첨부파일 삭제
					if (photo.getRname() != null) {
						MultipartFileUtil.delete(location + "/" + photo.getRname());
					}
					
					renamedFileName = MultipartFileUtil.save(upfile, location);
				} catch (IOException e) {
					e.printStackTrace();
				}
				if(renamedFileName != null) {
					photo.setOname(upfile.getOriginalFilename());
					photo.setRname(renamedFileName);
					photo.setUrl("/resources/upload/photo/"+renamedFileName);
				}
			}
			photo.setTitle(title);
			photo.setComment(comment);
			
			
			result = service.save(photo);
			if (result > 0) {
				modelAndView.addObject("msg","사진이 수정되었습니다.");
				modelAndView.addObject("location","/minihome/photo/home/" + minihomeNo);
			}else {
				modelAndView.addObject("msg","사진수정을 실패하였습니다.");
				modelAndView.addObject("location","/minihome/photo/home/" + minihomeNo);
			}
		}else {
			modelAndView.addObject("msg","잘못된 접근입니다.");
			modelAndView.addObject("location","/photo/folder/${minihomeNo}");
		}
		
		modelAndView.setViewName("common/msg");
		return modelAndView;
		
		
		
	
	}
	
	
	
	@GetMapping("/delete/{minihomeNo}")
	public ModelAndView delete(ModelAndView modelAndView,
							@PathVariable("minihomeNo") int minihomeNo,
				  			@SessionAttribute("loginMember") Member loginMember,
				  			@RequestParam(required = false, value="images[]") List<String> list
				  			
  			) {
		System.out.println(list);
		int result =0;
		result = service.deletePhoto(list);
		
        if (result > 0) {
		modelAndView.setViewName("/minihome/photo/insert");
        }else {
        	
        }
		return modelAndView;
	}
	
	@GetMapping("/{minihomeNo}/insertReply")
	public ModelAndView insertReply(ModelAndView modelAndView,
							@PathVariable("minihomeNo") int minihomeNo,
				  			@SessionAttribute("loginMember") Member loginMember,
				  			@ModelAttribute PhotoReply reply
//				  			@RequestParam("photoNo") int photoNo
			) {
		int result =0;
		reply.setWriterId(loginMember.getId());
		
//		System.out.println("reply" + reply);
		result = service.save(reply);
		
		if (result > 0) {
			modelAndView.addObject("msg","댓글이 등록되었습니다.");
			modelAndView.addObject("location","/minihome/photo/" + minihomeNo +"/view?no="+ reply.getPhotoNo());
		}else {
			modelAndView.addObject("msg","댓글등록이 실패하였습니다.");
			modelAndView.addObject("location","/minihome/photo/" + minihomeNo +"/view?no="+ reply.getPhotoNo());
		}
		
		modelAndView.setViewName("common/msg");
		return modelAndView;
		}
	
	@ResponseBody
	@GetMapping("/{minihomeNo}/updateReply")
	public int updateReply(ModelAndView modelAndView,
							@PathVariable("minihomeNo") int minihomeNo,
							@SessionAttribute("loginMember") Member loginMember,
							@RequestParam("content") String content,
							@RequestParam("replyNo") int replyNo
			) {
		int result =0;

		PhotoReply reply = new PhotoReply();
		reply.setComment(content);
		reply.setNo(replyNo);
		
		
		result = service.save(reply);
		
		
		return result;
	}
//	@GetMapping("/{minihomeNo}/updateReply")
//	public ModelAndView updateReply(ModelAndView modelAndView,
//							@PathVariable("minihomeNo") int minihomeNo,
//				  			@SessionAttribute("loginMember") Member loginMember,
//				  			@ModelAttribute PhotoReply reply
//			) {
//		int result =0;
//		System.out.println(reply.getNo());
//		System.out.println(reply.getPhotoNo());
//		System.out.println(reply.getComment());
//		result = service.save(reply);
//		
////		if (result > 0) {
////			modelAndView.addObject("msg","댓글이 등록되었습니다.");
////			modelAndView.addObject("location","/minihome/photo/" + minihomeNo +"/view?no="+ reply.getPhotoNo());
////		}else {
////			modelAndView.addObject("msg","댓글등록이 실패하였습니다.");
////			modelAndView.addObject("location","/minihome/photo/" + minihomeNo +"/view?no="+ reply.getPhotoNo());
////		}
////		modelAndView.setViewName("common/msg");
//		return modelAndView;
//		}
	
	
	@GetMapping("/{minihomeNo}/deleteReply")
	public ModelAndView deleteReply(ModelAndView modelAndView,
							@PathVariable("minihomeNo") int minihomeNo,
				  			@SessionAttribute("loginMember") Member loginMember,
				  			@ModelAttribute PhotoReply reply
			) {
		int result =0;
		result = service.deleteReplyByNo(reply.getNo());
		
		
		if (result > 0) {
			modelAndView.addObject("msg","댓글이 삭제되었습니다.");
			modelAndView.addObject("location","/minihome/photo/" + minihomeNo +"/view?no="+ reply.getPhotoNo());
		}else {
			modelAndView.addObject("msg","댓글삭제에 실패하였습니다.");
			modelAndView.addObject("location","/minihome/photo/" + minihomeNo +"/view?no="+ reply.getPhotoNo());
		}
		
		modelAndView.setViewName("common/msg");
		return modelAndView;
		}
	
	
}