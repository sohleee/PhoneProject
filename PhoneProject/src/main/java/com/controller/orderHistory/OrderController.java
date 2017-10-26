package com.controller.orderHistory;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.dto.cart.OrderDTO;
import com.dto.member.MemberDTO;
import com.service.orderHistory.OrderService;

@Controller
public class OrderController {

	@Autowired
	OrderService service;

	@RequestMapping("/orderHistory")
	public String orderHistory(@RequestParam Map<String,String> map, Model m) {

		service.orderHistory(map);
		
		m.addAttribute("oDTO", map);
		return "orderHistory";
	}
	@RequestMapping("/orderHistoryList")
	public String orderHistoryList(HttpServletRequest reqeust, HttpSession session, Model m) {
		String userid=(String)((MemberDTO)session.getAttribute("login")).getUserid(); 
	  List<OrderDTO>list=service.orderHistoryList(userid);
		
		m.addAttribute("list", list);
		return "orderHistoryList";
	}

}
