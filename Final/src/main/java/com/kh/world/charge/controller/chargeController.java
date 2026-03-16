package com.kh.world.charge.controller;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.kh.world.charge.model.service.ChargeService;
import com.kh.world.member.model.vo.Member;

@Controller
@SessionAttributes(value = { "loginMember" })
public class chargeController {

	
	 @Autowired 
	 ChargeService chargeservice;
	 

	@GetMapping("/webpage/Charge/payment")
	public String popup() {

		System.out.println("/payment<<<<<<<<<<<<");
		return "/webpage/Charge/payment";
	}

	/*
	 * @GetMapping("/charge/point") public @ResponseBody void chargeAcorn(Long
	 * amount, @SessionAttribute("loginMember") Member loginMember) {
	 * System.out.println(amount);
	 * 
	 * int no;
	 * 
	 * }
	 */

	/*
	 * @RequestMapping(value = "/payment/callback_receive") public ResponseEntity<?>
	 * callback_receive(@RequestBody Map<String, Object> model){
	 * System.out.println("callback_receive"); String process_result = "결제 성공!";
	 * 
	 * // 응답하는 header 생성 HttpHeaders responseHeaders = new HttpHeaders();
	 * responseHeaders.add("Content-Type","application/json; charset=UTF-8");
	 * JsonObject responseObj = new JsonObject(); JSONObject responseObj = new
	 * JSONObject();
	 * 
	 * 
	 * try { String imp_uid = (String)model.get("imp_uid"); String merchant_uid =
	 * (String)model.get("merchant_uid"); boolean success =
	 * (Boolean)model.get("success"); String error_msg =
	 * (String)model.get("error_msg");
	 * 
	 * System.out.println("---call back receive---");
	 * System.out.println("-----------------------"); System.out.println("imp_uid: "
	 * + imp_uid); System.out.println("merchant_uid: " + merchant_uid);
	 * System.out.println("success: " + success);
	 * 
	 * if(success == true) { // db select
	 * 
	 * String api_key = "3504606722523513"; String api_secret =
	 * "vpn5tjWsnr2klGi988izljP88ff0BhMjFJQ8wW08mx8YCFeiQgEuo5k1ItujREaovFrd8lFIy8AdZIxr";
	 * 
	 * IamportClient ic = new IamportClient(api_key, api_secret);
	 * IamportResponse<Payment> response = ic.paymentByImpUid(imp_uid);
	 * 
	 * BigDecimal iamport_amount = response.getResponse().getAmount(); // compare
	 * db_amount and api_amount // if(db_amount==api_amount)
	 * 
	 * responseObj.put("process_result", "결제 성공"); //db save , (update order_table
	 * set pay_result = 'success' , imp_uid=? where merchant_uid =?) //
	 * responseObj.put("process_result", "결제위변조"); // else{ result = "fail"; cancel
	 * API} }else { System.out.println("error_msg" + error_msg);
	 * responseObj.put("process_result", "결제 실패: " + error_msg); } }catch(Exception
	 * e) { e.printStackTrace(); responseObj.put("process_result",
	 * "결제 실패: 관리자에게 문의 주세요."); } return new
	 * ResponseEntity<String>(responseObj.toString(), responseHeaders,
	 * HttpStatus.OK);
	 * 
	 * }
	 */
	
	@PostMapping("/payment/callback_receive")
	@ResponseBody
	
	public int insertCash(@RequestBody HashMap<String, Object> param,
									@SessionAttribute("loginMember") Member loginMember
									){
		
		int result = 0;
		
		System.out.println("loginMember" + loginMember);
		
		System.out.println(param);
		
		result = chargeservice.insert(param, loginMember.getNo());
		result += chargeservice.update(param, loginMember.getNo());
		
		
		
		return result;
		
		
	}
	
	/*
	 * @RequestMapping("/payment/webhook_receive") public ResponseEntity<?>
	 * webhook_receive(@RequestBody Map<String, Object> model) {
	 * 
	 * HttpHeaders responseHeaders = new HttpHeaders();
	 * responseHeaders.add("Content-Type", "application/json; charset=UTF-8");
	 * 
	 * try { String imp_uid = (String) model.get("imp_uid"); String merchant_uid =
	 * (String) model.get("merchant_uid"); String status = (String)
	 * model.get("status");
	 * 
	 * String api_key = "3504606722523513"; String api_secret =
	 * "vpn5tjWsnr2klGi988izljP88ff0BhMjFJQ8wW08mx8YCFeiQgEuo5k1ItujREaovFrd8lFIy8AdZIxr";
	 * 
	 * IamportClient ic = new IamportClient(api_key, api_secret);
	 * IamportResponse<Payment> response = ic.paymentByImpUid(imp_uid);
	 * 
	 * BigDecimal iamport_amount = response.getResponse().getAmount();
	 * 
	 * } catch (Exception e) { e.printStackTrace(); return new
	 * ResponseEntity(HttpStatus.INTERNAL_SERVER_ERROR);
	 * 
	 * }
	 * 
	 * return new ResponseEntity<String>("결과 반영 성공", responseHeaders,
	 * HttpStatus.OK); }
	 */
}
