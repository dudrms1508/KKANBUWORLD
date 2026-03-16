package com.kh.world.minihome.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.kh.world.diary.model.vo.Diary;
import com.kh.world.friend.model.service.FriendService;
import com.kh.world.ilchon.model.vo.IlchonAddMinihome;
import com.kh.world.member.model.vo.Member;
import com.kh.world.miniBoard.model.vo.Board;
import com.kh.world.minihome.model.service.MinihomeService;
import com.kh.world.minihome.model.vo.COMENT;
import com.kh.world.minihome.model.vo.MemberMinihome;
import com.kh.world.minihome.model.vo.Minihome;
import com.kh.world.photo.model.vo.Photo;
import com.kh.world.setting.model.service.SettingService;
import com.kh.world.visitor.model.vo.Visitor;


@Controller
@RequestMapping("/minihome")
@SessionAttributes(value = {"loginMember"})
public class minihomeController {

	@Autowired
	MinihomeService  minihomeservice;
	
	@Autowired 
	SettingService settingservice;
	
	@Autowired
	private FriendService friendService;
	
	// 팝업으로 뜨도록 공통적인 width, height 설정 해야함
	@GetMapping("/minihomepage/{minihomeNo}")
	private ModelAndView minihome(ModelAndView modelAndView,
								  @PathVariable("minihomeNo") int minihomeNo, @SessionAttribute("loginMember") Member loginMember) {
		
		System.out.println("minihomeNo" + minihomeNo);		
		int miniNo = 0;		
		miniNo =  minihomeservice.getuserno(minihomeNo);
		Minihome minihomeVo =  settingservice.readMinihome(minihomeNo);
		// 여기서부터 작업 파도타기
	    List<IlchonAddMinihome> ilchonList = friendService.friendListView(miniNo);
	    modelAndView.addObject("ilchonList", ilchonList);
	    // 여기까지 끝 
		modelAndView.addObject("minihomeVo",minihomeVo);
		modelAndView.addObject(miniNo);
		modelAndView.addObject(loginMember);
		
		System.out.println("miniNo :" + miniNo);
		System.out.println("loginMember : " + miniNo);
		/* modelAndView.addObject() */
		
		
		modelAndView.setViewName("minihome/home/minihomepage");
		
		return modelAndView;
		
		}
	
	@GetMapping("/minihomeMain/{minihomeNo}")
	public ModelAndView minihomeMain(ModelAndView modelAndView,
									@PathVariable("minihomeNo") int minihomeNo, 
									@SessionAttribute("loginMember") Member loginMember) {
		
//		여기서부터
		int miniNo = 0;
		miniNo =  minihomeservice.getuserno(minihomeNo);
		
		List<COMENT> list = minihomeservice.getComnetList(minihomeNo);
		
		System.out.println(list);
		 
	    modelAndView.addObject(miniNo);
		modelAndView.addObject(loginMember);
		modelAndView.addObject("list", list);
//		여기까지 영근님 코드
		
//		여기서부터
		int userNo = loginMember.getNo();
		
		// 미니홈피 최근 게시글
		List<Board> boardList = minihomeservice.findBoardNo(userNo);
		
		// 미니홈피 최근 사진첩
		List<Photo> photoList = minihomeservice.findPhotoNo(minihomeNo);
		// 미니홈피 최근 다이어리
		List<Diary> diaryList = minihomeservice.findDiaryNo(minihomeNo);
		
		// 미니홈피 게시판 당일 카운트
		int boardDay = minihomeservice.minihomeBoard(userNo);
		// 미니홈피 사진첩 당일 카운트
		int photoDay = minihomeservice.minihomePhoto(minihomeNo);
		// 미니홈피 다이어리 당일 카운트
		int diaryDay = minihomeservice.minihomeDiary(minihomeNo);
		// 미니홈피 방명록 당일 카운트
		int visitorDay = minihomeservice.minihomeVisitor(minihomeNo);
		
		// 미니홈피 게시판 총 카운트 
		int boardTotal = minihomeservice.minihomeBoardTotal(userNo);
		// 미니홈피 사진첩 총 카운트
		int photoTotal = minihomeservice.minihomePhotoTotal(minihomeNo);
		// 미니홈피 다이어리 총 카운트
		int diaryTotal = minihomeservice.minihomeDiaryTotal(minihomeNo);
		// 미니홈피 방명록 총 카운트
		int visitorTotal = minihomeservice.minihomeTotal(minihomeNo);
		
//		System.out.println("최근 게시글을 찾기 위한 유저 : " + userNo);
		
		modelAndView.addObject("userNo", userNo);
		
		modelAndView.addObject("boardList", boardList);
		
		modelAndView.addObject("photoList", photoList);
		modelAndView.addObject("diaryList", diaryList);
		
		modelAndView.addObject("boardDay", boardDay);
		modelAndView.addObject("boardTotal", boardTotal);
		
		modelAndView.addObject("photoDay", photoDay);
		modelAndView.addObject("photoTotal", photoTotal);
		
		modelAndView.addObject("diaryDay", diaryDay);
		modelAndView.addObject("diaryTotal", diaryTotal);
		
		modelAndView.addObject("visitorDay", visitorDay);
		modelAndView.addObject("visitorTotal", visitorTotal);
//		여기까지 내 코드
		
		modelAndView.setViewName("minihome/home/miniroom");
		
		return modelAndView;
	}
	
	@PostMapping("/ilchonsay/insert/{minihomeNo}")
	@ResponseBody public ModelAndView ilchonsayInsert(@RequestBody HashMap<String, Object> param,
									@PathVariable("minihomeNo") int minihomeNo,
									ModelAndView modelAndView) {
		
		
		
		Map<String, Object> map = new HashMap<String, Object>(param);
		

		System.out.println("map :" + map);
		
		int result = 0;
		result = minihomeservice.insertilchonSay(param);
		
		return modelAndView;
	}
	
	@PostMapping("/ilchonsay/update/{minihomeNo}")
	@ResponseBody
	public ModelAndView update(@RequestBody HashMap<String, Object> param, @PathVariable("minihomeNo") int minihomeNo,
			ModelAndView modelAndView){
		
		Map<String, Object> map = new HashMap<String, Object>(param);
		
		System.out.println(param);
		
		map.put("data", minihomeservice.updateilchonSay(param)); 
		
		System.out.println(map);
		
		return modelAndView;
	}
	
	@PostMapping("/ilchonsay/delete/{minihomeNo}")
	@ResponseBody
	public ModelAndView Ownerdelete(@RequestBody HashMap<String, Object> param, @PathVariable("minihomeNo") int minihomeNo
			,ModelAndView modelAndView){
		Map<String, Object> map = new HashMap<String, Object>(param);
		
		System.out.println(param);
		
		map.put("delete", minihomeservice.deleteilchonSay(param));
		
		
		return modelAndView;
		
	}
	
	@PostMapping("/ilchonsay/userdelete/{minihomeNo}")
	@ResponseBody
	public ModelAndView delete(@RequestBody HashMap<String, Object> param,
			@PathVariable("minihomeNo") int minihomeNo,
			ModelAndView modelAndView){
		Map<String, Object> map = new HashMap<String, Object>(param);
		
		System.out.println(param);
		
		map.put("delete", minihomeservice.deleteilchonSay(param));
		
		
		return modelAndView;
		
	}
	
	/*
	 * @GetMapping("/minihomeMain") public String minihomeMain() {
	 * 
	 * return "minihome/home/miniroom"; }
	 */

}