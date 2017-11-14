package com.controller.member;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
//github.com/sohleee/PhoneProject.git
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.dto.admin.AdminDTO;
import com.dto.member.MemberDTO;
import com.service.admin.AdminService;
import com.service.member.MemberService;

@Controller
public class LoginController {

	@Autowired
	MemberService service;
	@Autowired
	AdminService amservice;

  

	@RequestMapping(value = "/loginForm", method = RequestMethod.GET)
	public String loginForm() {
		return "loginForm";
	}

	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String login(@RequestParam Map<String, String> map, Model m, HttpSession session,HttpServletRequest reqeust) {
		session=reqeust.getSession();
		
		AdminDTO adto = amservice.getAdminData(map);
		if (adto == null) {
			MemberDTO dto = service.login(map);
			if (dto == null) {
				m.addAttribute("mesg", "아이디또는 비밀번호가 일치하지 않습니다.");
				return "loginForm";
			} else {

				session.setAttribute("login", dto);
				return "home";
			}
		} else {
			return AdminLogin(map, session, adto);
		}
	}
	//------------------------------------------------------------------------------

	@RequestMapping("/loginX/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}

	private String AdminLogin(Map<String, String> map, HttpSession session, AdminDTO dto) {

		session.setAttribute("login", dto);

		return "adminForm";
	}

/*	@ExceptionHandler(Exception.class)
	public String error() {
		return "error";
	}*/

	//sns ---------------------------------------------------------------------------
	@RequestMapping(value = "/callback", method = RequestMethod.GET)
	public String callback() {
		return "callback";
	}

	//Form or home
	@RequestMapping(value="/session")
	public String session(@RequestParam String email, @RequestParam String username,
			@RequestParam String snsid, HttpSession session, Model m) {
		MemberDTO dto = service.snsMember(snsid);
		if(dto != null) {
			session.setAttribute("login", dto);
			return "home";
		}else {
			m.addAttribute("email", email);
			m.addAttribute("username", username);
			m.addAttribute("snsid", snsid);
			return "snsForm";
		}
	}
	
	@RequestMapping(value="/snsAdd", method=RequestMethod.POST)
	public String insertSNSMember(@ModelAttribute MemberDTO mDTO, Model m) {
		service.insertSNSMember(mDTO);
		System.out.println(mDTO.getUsername());
		m.addAttribute("result", mDTO.getUsername()+"님 회원가입을 축하합니다. 다시 한번 로그인하세요.");
		return "home";
	}



}
