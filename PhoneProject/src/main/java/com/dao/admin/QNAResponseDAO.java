package com.dao.admin;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dto.qna.QNADTO;
import com.dto.qna.QNAPageDTO;

@Repository("qNAResponseDAO")
public class QNAResponseDAO {
	
	@Autowired
	SqlSessionTemplate template;
	public List<QNADTO> qnaList(Map<String, String> map){
		List<QNADTO> list=template.selectOne("qnaList",map);
		return list;
	}
	
	public QNAPageDTO qnapage(Map<String,String> map) {
		QNAPageDTO dto=new QNAPageDTO();
		int curPage=Integer.parseInt(map.get("curPage"));
		int perPage=Integer.parseInt(map.get("perPage"));
		int curIdx = Integer.parseInt(map.get("curIdx"));
		int index=((curPage-1))*perPage;
		index*=(1+curIdx);
		
		
		List<QNADTO> list=template.selectList("AdminQNAboardList",map, new RowBounds(index, perPage));
		int totalCount=0;
		if(map.get("searchValue")==null) {
			totalCount=template.selectOne("AdminQNAtotalCount");
		}
		else {
			totalCount=template.selectOne("AdminQNAtotalCount1",map);
		}
		
		dto.setList(list);
		dto.setCurPage(curPage);
		dto.setPerPage(perPage);
		dto.setCurIdx(curIdx);
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
	public void qna_delete(int num) {
		template.delete("qnadeleteAndNumber",num);
		
	}
	
	public List<QNADTO> qnaretrieve( int num){
		List<QNADTO> list=template.selectList("qnaselectByNum", num);
		return list;
	}
	
	public QNADTO qnaselectByNum(int num) {
		/*int n=template.selectOne("AdminQNAselectCounter",num);
		if(n<=1)
			template.update("updateAnswer",num);*/
		QNADTO dto=template.selectOne("AdminQNAselectByNum",num);
		return dto;
	}
	
	public int qnareadCnt(int num) {
		int n=template.update("qnareadCnt",num);
		return n;
	}
	public int qnaAnswer(QNADTO dto) {
		System.out.println("test");
		int n=template.insert("AdminQNAinsertBoard",dto);
		return n;
	}
	public int qnaupdateByNum(QNADTO dto) {
		int n=template.update("qnaupdateByNum",dto);
		return n;
	}
}
