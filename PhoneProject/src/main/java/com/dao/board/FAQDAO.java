package com.dao.board;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dto.board.FAQDTO;
import com.dto.board.FAQPageDTO;

@Repository
public class FAQDAO {
	
	@Autowired
	SqlSessionTemplate template;
	
	public List<FAQDTO> faqList(HashMap<String,String> map){
		List<FAQDTO> list;
		if(map.get("category").equals("all")) {
			list=template.selectOne("faqList1",map);
		}else {
			list=template.selectOne("faqList2",map);
		}
		return list;
	}
	
	public FAQPageDTO faqPage(int curPage, int perPage, HashMap<String,String> map) {
		FAQPageDTO dto=new FAQPageDTO();
		int index=(curPage-1)*perPage;
		if(map.get("category").equals("all")) {
			List<FAQDTO> list=template.selectList("faqList1",map, new RowBounds(index, perPage));
			int totalCount=0;
			if(map.get("searchValue")==null) {
				totalCount=template.selectOne("faqtotalCount");
				dto.setList(list);
				dto.setCurPage(curPage);
				dto.setPerPage(perPage);
				dto.setTotalCount(totalCount);
			}
			else {
				totalCount=template.selectOne("faqtotalCount1",map);
				dto.setList(list);
				dto.setCurPage(curPage);
				dto.setPerPage(perPage);
				dto.setTotalCount(totalCount);
				dto.setSearchValue(map.get("searchValue"));
			}
		}else {
			List<FAQDTO> list=template.selectList("faqList2",map, new RowBounds(index, perPage));
			int totalCount=0;
			if(map.get("searchValue")==null) {
				totalCount=template.selectOne("faqtotalCount");
				dto.setList(list);
				dto.setCurPage(curPage);
				dto.setPerPage(perPage);
				dto.setTotalCount(totalCount);
			}
			else {
				totalCount=template.selectOne("faqtotalCount1",map);
				dto.setList(list);
				dto.setCurPage(curPage);
				dto.setPerPage(perPage);
				dto.setTotalCount(totalCount);
				dto.setSearchValue(map.get("searchValue"));
			}
			
		}
		return dto;
	}
	public int faqInsert(FAQDTO dto) {
		int n=template.insert("faqInsert",dto);
		return n;
	}
	
	public int faqDelete(String searchValue) {
		int n=template.delete("faqDelete",searchValue);
		return n;
	}
	public FAQDTO faqRetrieve(int num){
		FAQDTO dto=template.selectOne("faqselectByNum", num);
		return dto;
	}
	
	public int faqUpdateByNum(FAQDTO dto) {
		int n=template.update("faqUpdateByNum",dto);
		return n;
	}
	
}