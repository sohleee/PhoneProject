package com.dao.board;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dto.board.QNADTO;
import com.dto.board.QNAPageDTO;

@Repository
public class QNADAO {
	
	@Autowired
	SqlSessionTemplate template;
	
	public List<QNADTO> qnaList(HashMap<String, String> map){
		List<QNADTO> list=template.selectOne("qnaList",map);
		return list;
	}
	
	public QNAPageDTO qnapage(int curPage, int perPage, HashMap<String,String> map) {
		QNAPageDTO dto=new QNAPageDTO();
		int index=(curPage-1)*perPage;
		
		int totalCount=0;
		if(map.get("searchValue")==null) {
			totalCount=template.selectOne("qnatotalCount");
			System.out.println("this SearchValue null");
		}
		else {
			totalCount=template.selectOne("qnatotalCount1",map);
		}
		List<QNADTO> list=template.selectList("qnaList",map, new RowBounds(index, perPage));	
		dto.setList(list);
		dto.setCurPage(curPage);
		dto.setPerPage(perPage);
		dto.setTotalCount(totalCount);
		dto.setSearchName(map.get("searchName"));
		dto.setSearchValue(map.get("searchValue"));
		return dto;
	}
	public int qnainsert(QNADTO dto) {
		int n=template.insert("qnainsert",dto);
		return n;
	}
	
	public int qnadelete(HashMap<String,String> map) {
		int n=template.delete("qnadelete",map);
		return n;
	}
	public List<QNADTO> qnaretrieve(int num){
		List<QNADTO> list=template.selectList("qnaselectByNum", num);
		return list;
	}
	
	public QNADTO qnaselectByNum(int num) {
		QNADTO dto=template.selectOne("qnaselectByNum",num);
		return dto;
	}
	
	public int qnareadCnt(int num) {
		int n=template.update("qnareadCnt",num);
		return n;
	}
	
	public int qnaupdateByNum(QNADTO dto) {
		int n=template.update("qnaupdateByNum",dto);
		return n;
	}
}
