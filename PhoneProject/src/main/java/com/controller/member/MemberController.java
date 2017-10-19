package com.controller.member;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.dto.member.MemberDTO;
import com.service.member.MemberService;

@Controller
public class MemberController {
	
	@Autowired
	MemberService service;
	
	@RequestMapping(value="/memberForm", method=RequestMethod.GET)
	public String memberForm() {
		return "memberForm";
	}
	
	@RequestMapping(value="/memberAdd", method=RequestMethod.POST)
	public String memberAdd(@ModelAttribute MemberDTO mDTO,Model m) {
		service.insertMember(mDTO);
		m.addAttribute("result", mDTO.getUsername()+"님 회원가입을 축하합니다.");
		return "home";
	}
	
	@RequestMapping(value="/checkID")
	public String checkID(@RequestParam String userid, Model m) {
		String str = service.checkID(userid);
		if(userid.equals(str)) {
			m.addAttribute("mesg","이미 사용중인 아이디입니다.");
		} else if(userid != " " || userid.length() != 0 ) {
			m.addAttribute("mesg", userid +"는 사용 가능한 아이디입니다.");
		}
		return "checkID";
	}
	
	@RequestMapping(value="/checkEmail")
	public String checkEmail(@RequestParam String email, Model m) {
		String str = service.checkEmail(email);
		if(email.equals(str)) {
			m.addAttribute("mesg","등록된 이메일입니다.");
		} else if(email != " " || email.length() != 0 ) {
			m.addAttribute("mesg", email+"는 사용 가능한 이메일입니다.");
		}
		return "checkID";
	}
	
	@RequestMapping(value="/loginX/mypage")
	@ModelAttribute("login")
	public MemberDTO mypage(HttpSession session) {
		MemberDTO dto = (MemberDTO)session.getAttribute("login");
		dto= service.mypage(dto.getUserid());
		return dto;
	}
	
	@RequestMapping(value="/loginX/memberUpdate" , method=RequestMethod.GET)
	public String memberUpdate( @ModelAttribute("dto") MemberDTO dto , Model m) {
		service.updateMember(dto);
		m.addAttribute("mesg", "회원 수정 성공");
		return "home";
	}
	
	@RequestMapping(value="/loginX/memberDelete" , method=RequestMethod.GET)
	public String memberDelete(@RequestParam String userid, Model m, HttpSession session) {
	
		try {
		service.deleteMember(userid);
		m.addAttribute("mesg", "회원 삭제 성공");
		session.invalidate();
		} catch(Exception e) {
			e.printStackTrace();
		}
		return "home";
	}
	
	/*@(Exception.class)
	public String error() {
		return "error";
	}*/

}
