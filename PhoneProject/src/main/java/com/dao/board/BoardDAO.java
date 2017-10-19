package com.dao.board;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dto.board.BoardDTO;
import com.dto.board.FileDTO;
import com.dto.board.PageDTO;

@Repository 
public class BoardDAO {
	
	@Autowired
	SqlSessionTemplate template;
	public List<BoardDTO> boardList(){
		return template.selectList("boardList");
	}
	
	public void boardWrite(HashMap<String,String>map){
		if(map.get("board_image")==null) {
			template.insert("boardWrite1",map);
		}else {
			template.insert("boardWrite2",map);
		}
	}
	public BoardDTO boardRetrieve(int boardnum){
		int n=readCnt(boardnum);
		return template.selectOne("boardRetrieve",boardnum);
	}
	
	private int readCnt(int boardnum) {
		int n=template.update("boardReadCnt",boardnum);
		return n;
	}
	
	public void boardDelete(int boardnum){
		template.delete("boardDelete",boardnum);
	}
	
	public void boardUpdate(HashMap<String,String>map) {
		if(map.get("board_image")==null) {
			template.update("boardUpdate1",map);
		}else {
			template.update("boardUpdate2",map);
		}
	}
	
	
	public PageDTO boardPage(int curPage, int perPage, HashMap<String,String> map) {
		PageDTO dto=new PageDTO();
		int index=(curPage-1)*perPage;
		List<BoardDTO> list=template.selectList("boardList",map, new RowBounds(index, perPage));
		int totalCount=0;
		if(map.get("searchValue")==null) {
			totalCount=template.selectOne("boardCount1");
		}
		else {
			totalCount=template.selectOne("boardCount2",map);
		}
		
		dto.setList(list);
		dto.setCurPage(curPage);
		dto.setPerPage(perPage);
		dto.setTotalCount(totalCount);
		dto.setSearchName(map.get("searchName"));
		dto.setSearchValue(map.get("searchValue"));
		return dto;
	}
	
	
}
