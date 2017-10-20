package com.controller.board;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.dto.board.BoardDTO;
import com.dto.board.QNADTO;
import com.dto.member.MemberDTO;
import com.service.board.BoardService;
import com.service.board.FAQService;
import com.service.board.QNAService;

@Controller
@RequestMapping("/qna")
public class QNAController {

	@Autowired
	QNAService service;
	
		@RequestMapping(value="/qnaList", method=RequestMethod.GET)
		public String qnaList(@RequestParam(required=false, defaultValue="1")int curPage,
		@RequestParam(required=false, defaultValue="3") int perPage,
		HashMap<String,String> map,Model m, HttpSession session) {
			MemberDTO mdto=(MemberDTO)session.getAttribute("login");
			if(mdto==null) {
				m.addAttribute("result", "로그인이 필요한 서비스입니다.");
				return "redirect:/";
			}
			else {
				map.put("userid", mdto.getUserid());
				m.addAttribute("username",mdto.getUsername());
				m.addAttribute("userid",mdto.getUserid());
				m.addAttribute("page",service.qnaPage(curPage, perPage, map));
				m.addAttribute("perPage",perPage);
				return "qnaList";
			}
			
		}
		

		@RequestMapping(value="/qnaWrite", method=RequestMethod.POST)
		public String qnaWrite(QNADTO dto) {
			service.qnaWrite(dto);
			return "redirect:qnaList";
		}
		
		@RequestMapping(value="/qnaRetrieve", method=RequestMethod.GET)
		public String faqRetrieve(@RequestParam int num,Model m) {
				m.addAttribute("retrieve",service.qnaRetrieve(num));
				return "qnaRetrieve";
		}
	
}
