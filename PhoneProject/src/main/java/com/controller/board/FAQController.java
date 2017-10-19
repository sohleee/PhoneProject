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

import com.dto.BoardDTO;
import com.service.BoardService;
import com.service.FAQService;

@Controller
@RequestMapping("/faq")
public class FAQController {

	@Autowired
	FAQService service;
	
		@RequestMapping(value="/faqList", method=RequestMethod.GET)
		public String faqList(@RequestParam(required=false, defaultValue="1")int curPage,
		@RequestParam(required=false, defaultValue="10") int perPage,
		@RequestParam(required=false,defaultValue="") String searchValue,
		@RequestParam(required=false, defaultValue="") String category,
		HashMap<String,String> map,Model m) {
			map.put("searchValue", searchValue);
			map.put("category", category);
			m.addAttribute("category",category);
			m.addAttribute("page",service.faqPage(curPage, perPage, map));
			return "faqList";
		}

		@RequestMapping(value="/faqRetrieve", method=RequestMethod.GET)
		public String faqRetrieve(@RequestParam int num,Model m) {
				m.addAttribute("retrieve",service.faqRetrieve(num));
				return "faqRetrieve";
		}
	
}
