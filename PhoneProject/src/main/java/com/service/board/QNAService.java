package com.service.board;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.board.QNADAO;
import com.dto.board.QNADTO;
import com.dto.board.QNAPageDTO;

@Service
public class QNAService {

	@Autowired
	QNADAO dao;
	
	public List<QNADTO> qnaList(HashMap<String,String> map){
		return dao.qnaList(map);
	}
	
	public QNAPageDTO qnaPage(int curPage, int perPage, HashMap<String, String> map){
		return dao.qnapage(curPage, perPage, map);
	}//page end
	
	public void qnaWrite(QNADTO dto){
		dao.qnainsert(dto);
	}
	
	public void qnaDelete(HashMap<String,String> map){
		dao.qnadelete(map);
	}
	
	public List<QNADTO> qnaRetrieve(int num){
		return dao.qnaretrieve(num);
	}
	
	public void qnaUpdateByNum(QNADTO dto){
		dao.qnaupdateByNum(dto);
	}
}
