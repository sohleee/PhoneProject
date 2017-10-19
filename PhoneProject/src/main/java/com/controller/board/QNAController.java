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
		HashMap<String,String> map,Model m) {
			map.put("userid", "userid");
			m.addAttribute("username","username");
			m.addAttribute("userid","userid");
			m.addAttribute("page",service.qnaPage(curPage, perPage, map));
			m.addAttribute("perPage",perPage);
			return "qnaList";
		}
		
/*qnaListServlet
		
		String target="qnaList.jsp";
		try {
			if(mdto==null) {
				target="home.jsp";
				request.setAttribute("QNA", "로그인이 필요한 서비스입니다.");
			}
			else {
				String userid=mdto.getUserid();
				HashMap<String,String> map=new HashMap<>();
				map.put("userid", userid);
		
			*/
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
