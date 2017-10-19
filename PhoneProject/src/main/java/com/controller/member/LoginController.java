package com.controller.member;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.dto.member.MemberDTO;
import com.service.member.MemberService;

@Controller
public class LoginController {
	
	@Autowired
	MemberService service;
	
	@RequestMapping(value="/loginForm", method=RequestMethod.GET)
	public String memberForm() {
		return "loginForm";
	}
	
	@RequestMapping(value="/login", method=RequestMethod.POST)
	public String login(@RequestParam Map<String, String> map,Model m, HttpSession session){
		MemberDTO dto = service.login(map);
		if(dto==null) {
			m.addAttribute("mesg", "아이디또는 비밀번호가 일치하지 않습니다.");
			return "loginForm";
		} else {
			session.setAttribute("login", dto);
			return "home";
		}
	}
	
	@RequestMapping(value="/findIDForm", method=RequestMethod.GET)
	public String findIDForm() {
		return "findIDForm";
	}
	
	@RequestMapping(value="/findIDResult", method=RequestMethod.POST)
	public String findIDResult(@RequestParam Map<String,String> map, Model m) {
		MemberDTO dto = service.findID(map);
		if(dto!=null) {
			m.addAttribute("mesg", "귀하의 아이디는 "+dto.getUserid()+"입니다.");
		} else {
			m.addAttribute("mesg", "입력하신 정보가 존재하지않습니다.");
		}
		return "findIDResult";
	}
	
	@RequestMapping(value="/findPasswdForm", method=RequestMethod.GET)
	public String findPasswdForm() {
		return "findPasswdForm";
	}
	
	@RequestMapping(value="/findPasswdResult", method=RequestMethod.POST)
	public String findPasswdResult(@RequestParam Map<String,String> map, Model m) {
		MemberDTO dto = service.findPasswd(map);
		if(dto!=null) {
			m.addAttribute("mesg", dto.getUsername()+"님의 비밀번호는 "+dto.getPasswd()+"입니다.");
		} else {
			m.addAttribute("mesg", "입력하신 정보가 존재하지않습니다.");
		}
		return "findPasswdResult";
	}
	
	@RequestMapping("/loginX/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}
	
	
	@ExceptionHandler(Exception.class)
	public String error() {
		return "error";
	}
	

}
