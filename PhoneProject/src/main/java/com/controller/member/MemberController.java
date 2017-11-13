package com.controller.member;

import java.util.HashMap;
import java.util.Map;
import java.util.Random;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.dto.member.MemberDTO;
import com.service.member.MemberService;

@Controller
public class MemberController {
	
	@Autowired
	MemberService service;
	
	@RequestMapping(value="/terms", method=RequestMethod.GET)
	public String terms() {
		return "terms";
	}
	
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
		return "redirect:/";
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
		return "redirect:/";
	}
	
	/*@ExceptionHandler(Exception.class)
	public String error() {
		return "home";
	}*/
	
	//mail----------------------------------------------------------------
		@RequestMapping(value = "/findIDForm", method = RequestMethod.GET)
		public String findIDForm() {
			return "findIDForm";
		}

		@RequestMapping(value = "/findID", method = RequestMethod.POST)
		public String findID(@RequestParam Map<String, String> map, Model m,
				@RequestParam String email, RedirectAttributes ra) {
			MemberDTO dto = service.findID(map);
			if (dto != null) {
				if(!dto.getEmail().equals(email)) {
					m.addAttribute("resultMsg", "입력하신 이메일의 회원정보와 가입된 아이디가 일치하지 않습니다.");
					return "redirect:/findIDForm";
				}else {
	            
				String subject = "Phone 아이디 찾기 안내입니다."; //제목
				StringBuilder sb = new StringBuilder();
	            sb.append("귀하의 아이디는 " + dto.getUserid() + " 입니다.");
	         
	            m.addAttribute("resultMsg", "귀하의 이메일 주소로 해당 이메일로 가입된 아이디를 발송 하였습니다.");
	            return "loginForm";
				}
	        }else {
	            m.addAttribute("resultMsg", "귀하의 이메일로 가입된 아이디가 존재하지 않습니다.");
	            return "redirect:/findIDForm";
	        }
		}
		

		@RequestMapping(value = "/findPasswdForm", method = RequestMethod.GET)
		public String findPasswdForm() {
			return "findPasswdForm";
		}
		//비밀번호 찾기
		@RequestMapping(value = "/findPasswd", method = RequestMethod.POST)
		public String findPasswd(@RequestParam Map<String, String> map, 
				@RequestParam String email, RedirectAttributes ra, HashMap<String, String> hashmap
				,Model m){
			MemberDTO dto = service.findPasswd(map);
			if (dto != null) {
				if(!dto.getEmail().equals(email)) {
					ra.addFlashAttribute("resultMsg", "입력하신 이메일의 회원정보와 가입된 아이디가 일치하지 않습니다.");
					return "redirect:/findPasswdForm";
				}
				//임시 비밀번호
				int ran = new Random().nextInt(100000) + 10000; 
	            String password = String.valueOf(ran);
	            hashmap.put("passwd", password);
	            System.out.println("1<<"+password);
	            hashmap.put("email", dto.getEmail());
	            System.out.println("2<<"+password);
	            System.out.println("3>>"+dto.getPasswd());
	            
				String subject = "Phone 임시 비밀번호 발급 안내 입니다."; //제목
				StringBuilder sb = new StringBuilder();
	            sb.append("귀하의 임시 비밀번호는 " + password + " 입니다.");
	            /** 메일 전송
	             * subject 제목 ,text 내용, from 보내는 메일 주소,to 받는 메일 주소, filePath 첨부 파일 경로: 첨부파일 없을시 null **/
	        
	            //ra.addFlashAttribute("resultMsg", "귀하의 이메일 주소로 새로운 임시 비밀번호를 발송 하였습니다.");
	            m.addAttribute("resultMsg", "귀하의 이메일 주소로 새로운 임시 비밀번호를 발송 하였습니다.");
	            return "loginForm";
	        } else {
	            m.addAttribute("resultMsg", "귀하의 이메일로 가입된 아이디가 존재하지 않습니다.");
	            return "redirect:/findPasswdForm";
	        }
	    }

}
