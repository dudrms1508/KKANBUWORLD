//package com.kh.world.minihome.controller;
//
//import java.util.HashMap;
//import java.util.List;
//import java.util.Map;
//
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.stereotype.Controller;
//import org.springframework.stereotype.Service;
//import org.springframework.web.bind.annotation.GetMapping;
//import org.springframework.web.bind.annotation.PathVariable;
//import org.springframework.web.bind.annotation.PostMapping;
//import org.springframework.web.bind.annotation.RequestBody;
//import org.springframework.web.bind.annotation.RequestMapping;
//import org.springframework.web.bind.annotation.ResponseBody;
//import org.springframework.web.bind.annotation.SessionAttribute;
//import org.springframework.web.bind.annotation.SessionAttributes;
//import org.springframework.web.servlet.ModelAndView;
//import org.springframework.web.servlet.ModelAndViewDefiningException;
//
//import com.kh.world.member.model.vo.Member;
//import com.kh.world.minihome.model.service.MinihomeService;
//import com.kh.world.minihome.model.vo.COMENT;
//import com.kh.world.mypage.model.vo.MyItem;
//import com.kh.world.shop.model.vo.ProductVo;
//
//
//@Controller
//@RequestMapping("/minihome")
//@SessionAttributes(value = {"loginMember"})
//public class minihomeController {
//
//	@Autowired
//	MinihomeService  minihomeservice;
//	
//	// 팝업으로 뜨도록 공통적인 width, height 설정 해야함
//	@GetMapping("/minihomepage/{minihomeNo}")
//	private ModelAndView minihome(ModelAndView modelAndView,
//								  @PathVariable("minihomeNo") int minihomeNo, @SessionAttribute("loginMember") Member loginMember ) {
//		
//		System.out.println("minihomeNo" + minihomeNo);
//		
//		int miniNo = 0;
//		
//		miniNo =  minihomeservice.getuserno(minihomeNo);	
//		
//		modelAndView.addObject(miniNo);
//		modelAndView.addObject(loginMember);
//		
//		System.out.println("miniNo :" + miniNo);
//		System.out.println("loginMember : " + miniNo);
//		/* modelAndView.addObject() */
//		modelAndView.setViewName("minihome/home/minihomepage");
//		
//		return modelAndView;
//		
//		}
//	
//	@GetMapping("/minihomeMain/{minihomeNo}")
//	public ModelAndView minihomeMain(ModelAndView modelAndView,
//									@PathVariable("minihomeNo") int minihomeNo, 
//									@SessionAttribute("loginMember") Member loginMember) {
//		
//		int miniNo = 0;
//		miniNo =  minihomeservice.getuserno(minihomeNo);
//		
//		
//		List<COMENT> list = minihomeservice.getComnetList(minihomeNo);
//		 
//		System.out.println(list);
//		 
//		modelAndView.addObject("list", list);
//		
//	    modelAndView.addObject(miniNo);
//		modelAndView.addObject(loginMember);
//		modelAndView.setViewName("minihome/home/miniroom");
//		return modelAndView;
//	}
//	
//	@PostMapping("/ilchonsay/insert")
//	@ResponseBody public ModelAndView ilchonsayInsert(@RequestBody HashMap<String, Object> param,									
//									ModelAndView modelAndView) {
//		
//		
//		Map<String, Object> map = new HashMap<String, Object>(param);
//		
//
//		System.out.println("map :" + map);
//		
//		int result = 0;
//		result = minihomeservice.insertilchonSay(param);
//		
//		return modelAndView;
//	}
//	
//	@PostMapping("/ilchonsay/update/{minihomeNo}")
//	@ResponseBody
//	public Map<String, Object> update(@RequestBody HashMap<String, Object> param, @PathVariable("minihomeNo") int minihomeNo){
//		
//		Map<String, Object> map = new HashMap<String, Object>(param);
//		
//		System.out.println(param);
//		
//		map.put("data", minihomeservice.updateilchonSay(param)); 
//		
//		System.out.println(map);
//		
//		return map;
//	}
//	
//	@PostMapping("/ilchonsay/delete/{minihomeNo}")
//	@ResponseBody
//	public Map<String, Object> delete(@RequestBody HashMap<String, Object> param, @PathVariable("minihomeNo") int minihomeNo){
//		Map<String, Object> map = new HashMap<String, Object>(param);
//		
//		System.out.println(param);
//		
//		map.put("delete", minihomeservice.deleteilchonSay(param));
//		
//		
//		return map;
//		
//	}
//	
//	/*
//	 * @GetMapping("/minihomeMain") public String minihomeMain() {
//	 * 
//	 * return "minihome/home/miniroom"; }
//	 */
//
//
//}