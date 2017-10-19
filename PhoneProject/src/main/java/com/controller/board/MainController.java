package com.controller.board;

import java.io.File;
import java.io.IOException;
import java.util.Collection;
import java.util.HashMap;
import java.util.Map;

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
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.service.board.BoardService;
import com.service.board.CommentService;
import com.service.board.FAQService;
import com.dto.board.BoardDTO;
import com.dto.board.CommentDTO;
import com.dto.board.FileDTO;

@Controller
public class MainController {

	@Autowired
	BoardService service;
	@Autowired
	CommentService cservice;
	@Autowired
	FAQService fservice;
	
		
		@RequestMapping(value="/", method=RequestMethod.GET)
		public String boardList(@RequestParam(required=false, defaultValue="1")int curPage,
		@RequestParam(required=false, defaultValue="5") int perPage,
		@RequestParam(required=false,defaultValue="") String searchValue,
		@RequestParam(required=false,defaultValue="title") String searchName,
		@RequestParam(required=false, defaultValue="all") String category,
		HashMap<String,String> map,HashMap<String,String> map2,Model m) {
			map.put("searchValue", searchValue);
			map.put("searchName",searchName);
			m.addAttribute("bpage",service.boardPage(curPage, perPage, map));
				map2.put("searchValue", searchValue);
				map2.put("category", category);
				m.addAttribute("category",category);
				m.addAttribute("fpage",fservice.faqPage(curPage, perPage, map2));
			return "home";
		}
		
}
