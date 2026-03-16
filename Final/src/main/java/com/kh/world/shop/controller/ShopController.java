package com.kh.world.shop.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.ModelAndViewDefiningException;

import com.kh.world.member.model.vo.Member;
import com.kh.world.shop.model.service.ProductService;
import com.kh.world.shop.model.vo.BuyVo;
import com.kh.world.shop.model.vo.ProductVo;
import com.kh.world.shop.model.vo.musicVo;

@Controller
@SessionAttributes(value = {"loginMember"})
public class ShopController {
	
	@Autowired
	private ProductService productservice;
	
	@GetMapping("/webpage/shop/mainshop")
	public ModelAndView list(ModelAndView modelAndView) {		
		
		List<ProductVo> list =  productservice.selectProductAll();
		
		System.out.println(list);
		
		modelAndView.addObject("list", list);
		modelAndView.setViewName("/webpage/shop/mainShop");
		
		return modelAndView;
	}
	
	@GetMapping("/webpage/shop/buyPopUp/{product_code}")
	public ModelAndView datail(@PathVariable("product_code") int product_code, ModelAndView modelAndView) 
	{
		modelAndView.addObject("productvo", productservice.buyProduct(product_code));
		modelAndView.setViewName("/webpage/shop/buyPopUp");			
		
		return modelAndView; 
	}
	
	  @PostMapping("/shop/but/getAcorn")
	  @ResponseBody
	  public Map<String, Object> getAcorn(@RequestBody HashMap<String, Object> param) {
	
		  Map<String, Object> map = new HashMap<String, Object>(param);
		  
		  System.out.println("param" + param);
		  
		  map.put("acorn", productservice.selectAcorn(param)); 
		  
		  System.out.println("map" +  map);
		  
		  return map;		  
	  }
	
	
	  @PostMapping("/shop/buy")	  
	  @ResponseBody public Map<String, Object> buy(@RequestBody HashMap<String, Object> param, ModelAndView modelAndView) {
	  
	  int result = 0;	  
	  int resultcount = 0;	  
	  int product_code = (Integer)param.get("product_code");
	  int user_no = (Integer)param.get("user_no");
	  
	  Map<String, Object> map = new HashMap<String, Object>();
	  
	  resultcount = productservice.selectProductCount(product_code, user_no);
	  System.out.println(resultcount);
	  
	  if(resultcount > 0) {				
		map.put("msg", "이미 보유한 상품입니다");				  
		  
	  }else {		  
		  result = productservice.buyInsert(param);		  
		  result += productservice.updateAcorn(param);
		  result += productservice.updateMyItem(param);
		  map.put("msg","결제 완료");		  
		  
	  }
		return  map;	  
	  
	  }
	 
	  @GetMapping("/shop/musicShop")
	  public ModelAndView musicShop(ModelAndView modelAndView){

		  List<musicVo> list = productservice.selectProductMusic();
		  
		  modelAndView.addObject("list", list);
		  modelAndView.setViewName("webpage/shop/musicShop");		  
		  
		  return modelAndView;
	  }
	  
	  @GetMapping("/musicBuy/{music.product_code}")
	  public ModelAndView openmusicPopup(ModelAndView modelAndView, @PathVariable("music.product_code") int product_code) {
		  
		  modelAndView.addObject("productvo", productservice.musicdetail(product_code));
		  
		  System.out.println(modelAndView);
		  modelAndView.setViewName("/webpage/shop/musicbuyPopUp");
		  return modelAndView;
	  }
	  

	
	
}
