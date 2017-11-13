package com.controller.cart;

import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.dto.cart.CartDTO;
import com.dto.member.MemberDTO;
import com.service.cart.CartService;
import com.service.member.MemberService;

@Controller
public class CartController {

	@Autowired
	CartService service;
	@Autowired
	MemberService mservice;

	@RequestMapping("/cartList")
	public String cartForm(HttpServletRequest request, HttpSession session, Model m) {
		session = request.getSession();
		MemberDTO mem = (MemberDTO) session.getAttribute("login");
		if (mem == null) {
			// mem = new
			// MemberDTO("test","1","tester","444","555","요기","죠기","010","1111","2222","dfsfs");
			return "loginForm";
		}
		return showCartList(mem.getUserid(), m);
	}

	@RequestMapping("/cartAdd")
	public String cartAdd(@RequestParam Map<String, String> map, HttpSession session, Model m) {
		String userid = map.get("userid");
		String phone_model_num = map.get("phone_model_num");
		String phone_name = map.get("phone_name");
		String phone_price = map.get("phone_price");
		String phone_image = map.get("phone_image");
		String telecom_num = map.get("telecom_num");
		String telecom = map.get("telecom");
		int phone_amount = 1;
		CartDTO dto = new CartDTO();

		userid = (String) ((MemberDTO) session.getAttribute("login")).getUserid();
		dto.setPhone_amount(phone_amount);
		dto.setPhone_image(phone_image);
		dto.setPhone_model_num(phone_model_num);
		dto.setPhone_name(phone_name);
		dto.setPhone_price(Integer.parseInt(phone_price));
		dto.setUserid(userid);
		dto.setTelecom_num(telecom_num);
		dto.setTelecom(telecom);

		service.insertItem(dto);
		m.addAttribute("dto", dto);

		
		return showCartList(userid,m);
	}

	@RequestMapping(value="/delCart",method=RequestMethod.GET)
	@ResponseBody
	public void cartdel(@RequestParam String num) {

		service.delItem(Integer.parseInt(num));

	}
	@RequestMapping("/amountUpdate")
	@ResponseBody
	public void cartAmountUpdate(@RequestParam Map<String,String> map) {

	    HashMap<String, Integer> hmap = new HashMap<>();
	    hmap.put("phone_amount", Integer.parseInt(map.get("phone_amount")));
	    hmap.put("num", Integer.parseInt(map.get("num")));

			service.amountUpdate(hmap);
	
	}
	
	@RequestMapping("/deleteItems")
	@ResponseBody
	public void cartDeleteItems(HttpServletRequest req) {
		String [] checks= req.getParameterValues("check");
			System.out.println("checker "+checks.length);
	    service.deleteItems(Arrays.asList(checks));
	}
	

	@RequestMapping("/order")
	public String orderForm(@RequestParam Map<String,String> map,HttpServletRequest reqeust,HttpSession session,Model m) {

		String num =map.get("num");
		String userid = map.get("userid");
		String phone_model_num=map.get("phone_model_num");
		String phone_name=map.get("phone_name");
		String phone_price=map.get("phone_price");
		String phone_image=map.get("phone_image");
		String telecom_num=map.get("telecom_num");
		String telecom=map.get("telecom");
		String phone_amount=map.get("phone_amount");
	
		session=reqeust.getSession();
		CartDTO dto = new CartDTO();
		MemberDTO mem = new MemberDTO();
		int inum=0;
		if(num==null) {
			inum = service.createOrderNum();

		}
		if(userid==null) {
			mem= (MemberDTO)session.getAttribute("login");
			userid =mem.getUserid();
		}
		if(phone_amount==null || phone_amount.equals("")) {
			phone_amount="1";
		}
		dto.setPhone_amount(Integer.parseInt(phone_amount));
		dto.setPhone_image(phone_image);
		dto.setPhone_model_num(phone_model_num);
		dto.setPhone_name(phone_name);
		dto.setPhone_price(Integer.parseInt(phone_price));
		dto.setUserid(userid);
		dto.setTelecom_num(telecom_num);
		dto.setNum(inum);
		dto.setTelecom(telecom);
	
			MemberDTO mDto=mservice.mypage(userid);
			
			//System.out.println(cDto.toString());
			m.addAttribute("cDTO", dto);
			m.addAttribute("mDTO", mDto);
			System.out.println(mDto.toString());
			return "payment";
	}

	
	
	
	private String showCartList(String userid, Model m) {
		List<CartDTO> list = service.cartAllList(userid);
		m.addAttribute("cartList", list);
		return "cartList";
	}

	@ExceptionHandler(Exception.class)
	public String error(Exception exception) {
		exception.printStackTrace();
		return "error";
	}

}
