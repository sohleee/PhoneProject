package com.service.board;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.board.CommentDAO;
import com.dto.board.CommentDTO;

@Service
public class CommentService {

	@Autowired
	CommentDAO dao;
	
	public List<CommentDTO> commentList(HashMap<String,Integer> map){
		return dao.commentList(map);
	}
	
	
	public void commentWrite(CommentDTO dto){
		dao.commentWrite(dto);
	}
	
	public void commentDelete(HashMap<String,String> map){
		dao.commentDelete(map);
	}
	
	
	
}