package com.dao.board;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dto.board.CommentDTO;

@Repository
public class CommentDAO {
	
	@Autowired
	SqlSessionTemplate template;
	
	public List<CommentDTO> commentList(HashMap<String, Integer> map){
		return template.selectList("commentList",map);
	}
	
	public int commentWrite(CommentDTO dto) {
		int n=template.insert("commentWrite",dto);
		return n;
	}
	
	public int commentDelete(HashMap<String,String> map) {
		int n=template.delete("commentDelete",map);
		return n;
	}
	
	
}