package com.controller.cart;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.dto.cart.CartDTO;
import com.dto.member.MemberDTO;
import com.service.cart.CartService;

@Controller
public class CartController {

	@Autowired
	CartService service;
	
	@RequestMapping("/cartList")
	public String cartForm(HttpServletRequest request, HttpSession session,Model m) {
		session= request.getSession();
		MemberDTO mem = (MemberDTO)session.getAttribute("login"); 
		if(mem==null) {
			// mem = new MemberDTO("test","1","tester","444","555","요기","죠기","010","1111","2222","dfsfs");
			return "loginForm";
		}
		CartService service = new CartService();
		List<CartDTO> list = service.cartAllList(mem.getUserid());
			m.addAttribute("cartList", list);
		return "cartList";
		}
	@RequestMapping("/cartAdd")
	public String cartAdd(@RequestParam Map<String,String> map, HttpSession session,Model m) {
		String userid = map.get("userid");
		String phone_model_num=map.get("phone_model_num");
		String phone_name=map.get("phone_name");
		String phone_price=map.get("phone_price");
		String phone_image=map.get("phone_image");
		String telecom_num=map.get("telecom_num");
		int phone_amount=1;
		CartService service = new CartService();
		CartDTO dto = new CartDTO();
	
	
		dto.setPhone_amount(phone_amount);
		dto.setPhone_image(phone_image);
		dto.setPhone_model_num(phone_model_num);
		dto.setPhone_name(phone_name);
		dto.setPhone_price(Integer.parseInt(phone_price));
		dto.setUserid(userid);
		dto.setTelecom_num(telecom_num);
		try {
			service.insertItem(dto);
			m.addAttribute("dto", dto);
		}catch (Exception e) {
			// TODO: handle exception
		}
		return "cartList";
		}
}
