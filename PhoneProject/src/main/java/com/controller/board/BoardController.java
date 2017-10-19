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

import com.dto.board.BoardDTO;
import com.dto.board.CommentDTO;
import com.dto.board.FileDTO;
import com.service.board.BoardService;
import com.service.board.CommentService;

@Controller
@RequestMapping("/board")
public class BoardController {

	@Autowired
	BoardService service;
	@Autowired
	CommentService cservice;
	
		@RequestMapping(value="/boardList", method=RequestMethod.GET)
		public String boardList(@RequestParam(required=false, defaultValue="1")int curPage,
		@RequestParam(required=false, defaultValue="10") int perPage,
		@RequestParam(required=false,defaultValue="") String searchValue,
		@RequestParam(required=false,defaultValue="title") String searchName,
		HashMap<String,String> map,Model m) {
			map.put("searchValue", searchValue);
			map.put("searchName",searchName);
			m.addAttribute("page",service.boardPage(curPage, perPage, map));
			return "boardList";
		}
		
		@RequestMapping(value="/boardWriteForm")
		public String boardWriteForm(Model m) {
			m.addAttribute("username","aa");
			m.addAttribute("userid","bb");
			return "boardWriteForm";
		}
		@RequestMapping(value="/boardWrite", method=RequestMethod.POST)
		public ModelAndView boardWrite(@Valid @ModelAttribute("xxx") FileDTO dto, BindingResult result) {
			ModelAndView mav=new ModelAndView();
			HashMap<String,String> map= new HashMap<>();
			if(result.hasErrors()) {
				mav.addObject("dto",dto);
				mav.addObject("username","aa");
				mav.addObject("userid","bb");
				mav.setViewName("boardWriteForm");
				return mav;
			}
			
				if(dto.getBoard_image().getOriginalFilename()=="") {
					String content = dto.getContent().replace("\r\n","<br>");
					 
					map.put("userid", dto.getUserid());
					map.put("title", dto.getTitle());
					map.put("author", dto.getAuthor());
					map.put("content", content);
				}else {
					CommonsMultipartFile theFile = dto.getBoard_image();
					String originalFilename = theFile.getOriginalFilename();
					
					System.out.println(">>>"+originalFilename);
					File f=new File("/phone/board/images",originalFilename);
				      
				    try{
				    	theFile.transferTo(f);
				    }catch (Exception e) {
				    	e.printStackTrace();
				      }
				    String content = dto.getContent().replace("\r\n","<br>");
				    map.put("userid", dto.getUserid());
				    map.put("title", dto.getTitle());
				    map.put("author", dto.getAuthor());
				    map.put("content",content);
				    map.put("board_image", originalFilename);
				}
			
			
			service.boardWrite(map);
			mav.setViewName("redirect:boardList");
			return mav;
		}
		
		/*@RequestMapping(value="/boardWrite", method=RequestMethod.POST)
		public String boardWrite(@Valid @ModelAttribute("xxx") FileDTO dto, BindingResult result) {
			HashMap<String,String> map= new HashMap<>();
			if(result.hasErrors()) {
				ModelAndView mav=new ModelAndView();
				System.out.println("//"+dto.getAuthor()+dto.getTitle()+dto.getContent());
				mav.addObject("dto",dto);
				mav.addObject("username","aa");
				return "boardWriteForm";
			}
			
				if(dto.getBoard_image().getOriginalFilename()=="") {
					String content = dto.getContent().replace("\r\n","<br>");
					 
					map.put("userid", dto.getUserid());
					map.put("title", dto.getTitle());
					map.put("author", dto.getAuthor());
					map.put("content", content);
				}else {
					CommonsMultipartFile theFile = dto.getBoard_image();
					String originalFilename = theFile.getOriginalFilename();
					
					System.out.println(">>>"+originalFilename);
					File f=new File("c:\\upload",originalFilename);
				      
				    try{
				    	theFile.transferTo(f);
				    }catch (Exception e) {
				    	e.printStackTrace();
				      }
				    String content = dto.getContent().replace("\r\n","<br>");
				    map.put("userid", dto.getUserid());
				    map.put("title", dto.getTitle());
				    map.put("author", dto.getAuthor());
				    map.put("content",content);
				    map.put("board_image", originalFilename);
				}
			
			
			service.boardWrite(map);
			return "redirect:boardList";
		}*/
			
		
		
		@RequestMapping(value="/boardRetrieve", method=RequestMethod.GET)
		public String boardRetrieve(int boardnum, Model m, HashMap<String,Integer> map) {	
			m.addAttribute("retrieve",service.boardRetrieve(boardnum));
			map.put("boardnum", boardnum);
			m.addAttribute("comment",cservice.commentList(map));
			return "boardRetrieve";
		}
		
		@RequestMapping(value="/boardDelete", method=RequestMethod.GET)
		public String boardDelete(@RequestParam int boardnum){
				service.boardDelete(boardnum);
				return "redirect:boardList";	
		}
		
		@RequestMapping(value="/boardUpdateForm", method=RequestMethod.GET)
		public String boardUpdateForm(BoardDTO board,Model m) {
			String content = board.getContent().replace("<br>","\r\n");
			board.setContent(content);
			m.addAttribute("username","aa");
			m.addAttribute("userid","bb");
			m.addAttribute("dto",board);
			return "boardUpdateForm";
		}
		
		@RequestMapping(value="/boardUpdate", method=RequestMethod.POST)
		public String boardUpdate(FileDTO dto, HashMap<String,String> map) {
			if(dto.getBoard_image().getOriginalFilename()=="") {
				map.put("title", dto.getTitle());
				map.put("author", dto.getAuthor());
				map.put("content", dto.getContent());
				map.put("boardnum",String.valueOf(dto.getBoardnum()));
			}else {
				CommonsMultipartFile theFile = dto.getBoard_image();
				String originalFilename = theFile.getOriginalFilename();
				
				System.out.println(">>>"+originalFilename);
				File f=new File("c:\\upload",originalFilename);
			      
			    try{
			    	theFile.transferTo(f);
			    }catch (Exception e) {
			    	e.printStackTrace();
			      }
			      
			      map.put("title", dto.getTitle());
			      map.put("author", dto.getAuthor());
			      map.put("content", dto.getContent());
			      map.put("board_image", originalFilename);
			      map.put("boardnum",String.valueOf(dto.getBoardnum()));

			}
			service.boardUpdate(map);
			return "redirect:boardList";
		}
		
		@RequestMapping(value="/boardComment", method=RequestMethod.GET)
		public String boardComment(CommentDTO dto, HashMap<String,Integer> map, Model m) {
			dto.setUsername("username");
			String content = dto.getContent().replace("\r\n","<br>");
			dto.setContent(content);
			cservice.commentWrite(dto);
			m.addAttribute("boardnum",dto.getBoardnum());
			m.addAttribute("retrieve",service.boardRetrieve(dto.getBoardnum()));
			m.addAttribute("comment",cservice.commentList(map));
			return "boardRetrieve";
		}
		
}
