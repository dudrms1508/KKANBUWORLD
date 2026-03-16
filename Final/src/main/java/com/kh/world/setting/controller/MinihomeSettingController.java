package com.kh.world.setting.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.kh.world.member.model.vo.Member;
import com.kh.world.minihome.model.service.MinihomeService;
import com.kh.world.minihome.model.vo.Minihome;
import com.kh.world.setting.model.service.SettingService;
import com.kh.world.shop.model.vo.ProductVo;

@Controller
@RequestMapping("/minihome")
@SessionAttributes(value = {"loginMember"})
public class MinihomeSettingController {
	
	 @Autowired 
	 SettingService settingservice;
	 
	 @Autowired
	 MinihomeService minihomeService;
	
	
	@GetMapping("/minihomeSetting/{minihomeNo}")
	public ModelAndView minihomeSetting(@PathVariable("minihomeNo") int minihomeNo ,ModelAndView modelAndView) {
		
		Minihome minihomeVo =  settingservice.readMinihome(minihomeNo);
		
		System.out.println("히힣 찍자 " + minihomeVo);
		
		modelAndView.addObject("minihomeVo",minihomeVo);
		
		
		System.out.println(minihomeNo);
		modelAndView.addObject("minihomeNo", minihomeNo);
		
		modelAndView.setViewName("minihome/setting/minihomeSetting");
		
		
		return modelAndView;
		
	}
	
	@GetMapping("/settingTabView/{minihomeNo}")
	public ModelAndView settingTabView(@PathVariable("minihomeNo") int minihomeNo,
									   ModelAndView modelAndView) {
		
		modelAndView.addObject("minihomeNo", minihomeNo);
		modelAndView.setViewName("minihome/setting/settingTab");
		
		return modelAndView;
		
	}
	
	@GetMapping("/settingTab2View/{minihomeNo}")
	public ModelAndView settingTab2View(@PathVariable("minihomeNo") int minihomeNo,
										ModelAndView modelAndView) {
		
		int miniNo;
		miniNo =  minihomeService.getuserno(minihomeNo);		
		
		List<ProductVo> skinList = settingservice.getSkinList(miniNo); 
		
		modelAndView.addObject("skinList", skinList);
		modelAndView.addObject(miniNo);
		
		modelAndView.setViewName("minihome/setting/settingTab2");
		modelAndView.addObject("minihomeNo", minihomeNo);
		
		return modelAndView;
		
	}
	
	@GetMapping("/settingTab3View/{minihomeNo}")
	public ModelAndView settingTab3View(@PathVariable("minihomeNo") int minihomeNo,
										ModelAndView modelAndView) {
		
		int miniNo;
		miniNo =  minihomeService.getuserno(minihomeNo);
		
		List<ProductVo> bgmList = settingservice.getMusicList(miniNo);
		
		modelAndView.addObject("bgmList", bgmList);
		modelAndView.addObject(miniNo);		
		System.out.println("bgm 리스트임" + bgmList);
		modelAndView.addObject("minihomeNo", minihomeNo);
		modelAndView.setViewName("minihome/setting/settingTab3");
		
		return modelAndView;
		
	}
	
	@PostMapping("/setting/update/search")
	@ResponseBody
	public Map<String, Object> updateUser(@RequestBody HashMap<String, Object> param){
		
		Map<String, Object> map = new HashMap<String, Object>();		
		System.out.println("param : " + param);
		
		int result = 0;
		if(result > 0) {
			
		}else {
			result = settingservice.updateSearch(param); 
			/* map.put("update", settingservice.updateSearch(param)); */
		}	
		return map;
	}
	
	@PostMapping("/setting/update/mbti")
	@ResponseBody
	public Map<String, Object> updateMbti(@RequestBody HashMap<String, Object> param){
		
		Map<String, Object> map = new HashMap<String, Object>();
		System.out.println("param ??" + param);
		
		int result = 0;
		if(result > 0) {
			
		}else {
			result = settingservice.updatembti(param);
		}
		
		
		return map;
	}
	
	/* 0425 기존 작업
	 * @PostMapping("/setting/update/skin")
	 * 
	 * @ResponseBody public Map<String, Object> updateSkin(@RequestBody
	 * HashMap<String, Object> param){ Map<String, Object> map = new HashMap<String,
	 * Object>(); System.out.println(map); System.out.println("skinparam :" +
	 * param);
	 * 
	 * int result = 0; if(result > 0) {
	 * 
	 * }else { result = settingservice.updateSkin(param); }
	 * 
	 * 
	 * 
	 * return map; }
	 */
	
	@RequestMapping(value = "/setting/update/skin", method = RequestMethod.PUT)
	public ResponseEntity<Integer> updateTheme(@RequestBody Minihome minihomevo, @SessionAttribute("loginMember") Member loginMember){
		
		System.out.println("열루 요청 성공했음");
		int userno = loginMember.getNo();
		int result = 0;
		ResponseEntity<Integer> entity = null;
		
		minihomevo.setUserNo(userno);
		
		System.out.println("minihomevo : " + minihomevo);
		
		result = settingservice.updateTheme(minihomevo);
		
		if(result == 1) {
			entity = new ResponseEntity<Integer>(result , HttpStatus.OK);
		}else {
			entity = new ResponseEntity<Integer>(result , HttpStatus.OK);
		}
		
		return entity;
	}
		
	
	
//	@GetMapping("/minihome/minihomeSetting/{minihomeNo}")
//	public String minihomeSetting(@PathVariable("minihomeNo") int minihomeNo,
//								Model model) {
//		
//		model.addAttribute("minihomeNo", minihomeNo);
//		
//		return "minihome/setting/minihomeSetting";
//	}
//	
	
//	@GetMapping("/minihome/settingTabView/{minihomeNo}")
//	public String settingTabView(@PathVariable("minihomeNo") int minihomeNo,
//								 Model model) {
//		
//		model.addAttribute("minihomeNo", minihomeNo);
//		
//		return "minihome/setting/settingTab";
//	}
	
//	@GetMapping("/minihome/settingTab2View/{minihomeNo}")
//	public String settingTab2View(@PathVariable("minihomeNo") int minihomeNo,
//			 					  Model model) {
//		
//		model.addAttribute("minihomeNo", minihomeNo);
//		
//		return "minihome/setting/settingTab2";
//	}
	
//	@GetMapping("/minihome/settingTab3View/{minihomeNo}")
//	public String settingTab3View(@PathVariable("minihomeNo") int minihomeNo,
//			  					  Model model) {
//		
//		model.addAttribute("minihomeNo", minihomeNo);
//		
//		return "minihome/setting/settingTab3";
//	} 

}