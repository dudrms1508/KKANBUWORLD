package com.kh.world.gift.controller;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.kh.world.gift.model.service.GiftService;
import com.kh.world.member.model.vo.Member;
import com.kh.world.shop.model.service.ProductService;
import com.kh.world.shop.model.vo.ProductVo;

@Controller
@SessionAttributes(value = {"loginMember"})
public class GiftShopController {
	
	@Autowired
	private ProductService productservice;

	@Autowired
	private GiftService giftService;

	// giftTest 테스트라 나중에 경로 바꿔줄 것
	@GetMapping("/giftTest/shop/mainshop")
	public ModelAndView list(ModelAndView modelAndView, @SessionAttribute("loginMember") Member loginMember) {		
		
		
		List<ProductVo> list =  productservice.selectProductAll();
		System.out.println(list);
		loginMember = giftService.findMemberByNo(loginMember.getNo());
		System.out.println("구매 후 도토리를 갱신한 회원 정보 :" + loginMember);
		
		// 회원 갱신함 (도토리 개수 반영)
		modelAndView.addObject("loginMember", loginMember);
		modelAndView.addObject("list", list);
		modelAndView.setViewName("webpage/gift/giftmainShop");
		
		return modelAndView;
	}
	
	@GetMapping("/webpage/giftTest/shop/buyPopUp/{product_code}")
	public ModelAndView datail(@PathVariable("product_code") int product_code, ModelAndView modelAndView, @SessionAttribute("loginMember") Member loginMember) {
		
		modelAndView.addObject("loginMember", loginMember);
		System.out.println(productservice.buyProduct(product_code));
		modelAndView.addObject("productvo", productservice.buyProduct(product_code));
		modelAndView.setViewName("/webpage/gift/giftbuyPopUp");			
		
		return modelAndView; 
	}
	
		
		// 이건 본인꺼 구매, 결제라서 신경 안써도 됨
	  @PostMapping("/giftTest/shop/buy")
	  @ResponseBody 
	  public int buy(@RequestBody HashMap<String, Object> param) {
	  
		  int result = 0;	  
	  
	  result = productservice.buyInsert(param);
	  result += productservice.updateAcorn(param);
	  result += productservice.updateMyItem(param);
	  
	  
	  return result;
	  
	  }
	 
	
	/*
	 * @RequestMapping(value = "/shop/buy", method = RequestMethod.POST) public int
	 * buy(@RequestBody BuyVo buyvo) throws Exception{
	 * 
	 * int result = 0; System.out.println(buyvo); result =
	 * productservice.buyInsert(buyvo);
	 * 
	 * return result;
	 * 
	 * }
	 */
	
	
	
	
	
}
