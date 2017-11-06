package com.controller.board;

import java.io.File;
import java.io.IOException;
import java.util.Collection;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
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

import com.dto.admin.AdminDTO;
import com.dto.board.BoardDTO;
import com.dto.board.CommentDTO;
import com.dto.board.FileDTO;
import com.dto.member.MemberDTO;
import com.dto.member.ParentsMember;
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
		public String boardWriteForm(Model m,HttpSession session) {
			MemberDTO mdto=(MemberDTO)session.getAttribute("login");
			if(mdto==null) {
				return "redirect:boardList";
			}
			else {
				m.addAttribute("username",mdto.getUsername());
				m.addAttribute("userid",mdto.getUserid());
				return "boardWriteForm";
			}
		}
		@RequestMapping(value="/boardWrite", method=RequestMethod.POST)
		public ModelAndView boardWrite(@Valid @ModelAttribute("xxx") FileDTO dto,HttpSession session, BindingResult result) {
			ModelAndView mav=new ModelAndView();
			HashMap<String,String> map= new HashMap<>();
			MemberDTO mdto=(MemberDTO)session.getAttribute("login");
			if(result.hasErrors()) {
				mav.addObject("dto",dto);
				mav.addObject("username",mdto.getUsername());
				mav.addObject("userid",mdto.getUserid());
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
					File f=new File("C:\\upload",originalFilename);
				      
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
		
		
		@RequestMapping(value="/boardRetrieve", method=RequestMethod.GET)
		public String boardRetrieve(int boardnum, Model m, HashMap<String,Integer> map) {	
			m.addAttribute("retrieve",service.boardRetrieve(boardnum));
			map.put("boardnum", boardnum);
			m.addAttribute("comment",cservice.commentList(map));
			return "boardRetrieve";
		}
		
		@RequestMapping(value="/boardDelete", method=RequestMethod.GET)
		public String boardDelete(@RequestParam int boardnum, @RequestParam String userid, HashMap<String,String> map,HttpSession session, Model m){
			ParentsMember mdto=null;
			if(((ParentsMember)session.getAttribute("login")).getUserid().equals("master")) {
				mdto=(AdminDTO)session.getAttribute("login");
				mdto.setUserid(userid);
				map.put("userid", userid);
			}else {
				 mdto=(ParentsMember)session.getAttribute("login");
				map.put("userid", mdto.getUserid());
			}
			map.put("boardnum", String.valueOf(boardnum));
			if(mdto!=null) {
				if(mdto.getUserid().equals(userid)) {
					service.boardDelete(map);
					m.addAttribute("result", "글이 삭제되었습니다");
				}
				else {
					m.addAttribute("result", "본인이 작성한 글만 삭제 가능합니다");
				}
			}
			return "forward:boardList";
		}
		
		@RequestMapping(value="/boardUpdateForm", method=RequestMethod.GET)
		public String boardUpdateForm(BoardDTO board,Model m,HttpSession session) {
			MemberDTO mdto=(MemberDTO)session.getAttribute("login");
			String content = board.getContent().replace("<br>","\r\n");
			board.setContent(content);
			m.addAttribute("username",mdto.getUsername());
			m.addAttribute("userid",mdto.getUserid());
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
				File f = new File("C:\\upload",originalFilename);
			      
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
		public String boardComment(CommentDTO dto, HashMap<String,Integer> map, Model m,HttpSession session) {
			MemberDTO mdto=(MemberDTO)session.getAttribute("login");
			dto.setUsername(mdto.getUsername());
			dto.setUserid(mdto.getUserid());
			String content = dto.getContent().replace("\r\n","<br>");
			dto.setContent(content);
			cservice.commentWrite(dto);
			m.addAttribute("boardnum",dto.getBoardnum());
			m.addAttribute("retrieve",service.boardRetrieve(dto.getBoardnum()));
			m.addAttribute("comment",cservice.commentList(map));
			return "boardRetrieve";
		}
		
		@RequestMapping(value="/commentDelete", method=RequestMethod.GET)
		public String commentDelete(@RequestParam String userid, @RequestParam int num,HashMap<String,String> map,HttpSession session, Model m){
			MemberDTO mdto=(MemberDTO)session.getAttribute("login");
			map.put("userid", mdto.getUserid());
			map.put("num", String.valueOf(num));
			if(mdto!=null) {
				if(mdto.getUserid().equals(userid)) {
					cservice.commentDelete(map);
					m.addAttribute("result", "댓글이 삭제되었습니다");
				}
				else {
					m.addAttribute("result", "본인이 작성한 댓글만 삭제 가능합니다");
				}
			}
			return "forward:boardList";
		}
}
