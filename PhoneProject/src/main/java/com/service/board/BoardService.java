package com.service.board;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.board.BoardDAO;
import com.dto.board.BoardDTO;
import com.dto.board.FileDTO;
import com.dto.board.PageDTO;

@Service
public class BoardService {

	@Autowired
	BoardDAO dao;
	public List<BoardDTO> boardList(){
		return dao.boardList();
	}
	public void boardWrite(HashMap<String,String> map) {
		dao.boardWrite(map);
	}
	public BoardDTO boardRetrieve(int boardnum){
		return dao.boardRetrieve(boardnum);
	}
	
	public void boardUpdate(HashMap<String,String>map) {
		dao.boardUpdate(map);
	}
	
	public void boardDelete(int boardnum){
		dao.boardDelete(boardnum);
	}
	
	public PageDTO boardPage(int curPage, int perPage, HashMap<String,String> map) {
		return dao.boardPage(curPage, perPage, map);
	}	
	
}
