package com.service.board;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.board.FAQDAO;
import com.dto.board.FAQDTO;
import com.dto.board.FAQPageDTO;

@Service
public class FAQService {

	@Autowired
	FAQDAO dao;
	
	public List<FAQDTO> faqList(HashMap<String,String> map){
		return dao.faqList(map);
	}
	
	public FAQPageDTO faqPage(int curPage, int perPage, HashMap<String,String> map){
		return dao.faqPage(curPage, perPage, map);
	}//page end
	
	public void faqInsert(FAQDTO dto){
		dao.faqInsert(dto);
	}
	
	public void faqDelete(String searchValue){
		dao.faqDelete(searchValue);
	}
	
	public FAQDTO faqRetrieve(int num){
		return dao.faqRetrieve(num);
	}
	
	public void faqUpdateByNum(FAQDTO dto){
		dao.faqUpdateByNum(dto);
	}
}