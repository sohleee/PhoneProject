package com.dao.admin;

import java.util.ArrayList;
import java.util.Map;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dto.admin.AdminDTO;
import com.dto.admin.MemberMngPageDTO;
import com.dto.cart.SalesDTO;
import com.dto.member.MemberDTO;
import com.dto.qna.QNADTO;

@Repository("adminDAO")
public class AdminDAO {

	@Autowired
	SqlSessionTemplate template;
	public AdminDTO getAdminData( Map<String, String> map) {
		return template.selectOne("getAdminData", map);
	}

	public List<SalesDTO> getSalesChartDatas( Map<String, String> map) {

		List<SalesDTO> list = template.selectList("getSalesChartDatas", map);

		return list;
	}

	public List<MemberDTO> getAllMemberData() {
		// TODO Auto-generated method stub
		
		List<MemberDTO> list=template.selectList("getAllMemberData");
		
		return list;
	}


	public void membersDelete( ArrayList<String> num) {
		template.delete("membersDelete", num);
		
	}

	public void memberUpdate( Map<String, String> map2) {
		// TODO Auto-generated method stub
		 template.update("memberUpdate", map2);
	
	}

	public MemberMngPageDTO page( Map<String, String> map) {
		// TODO Auto-generated method stub
		int curPage= Integer.parseInt(map.get("curPage"));
		int curIdx= Integer.parseInt(map.get("curIdx"));
		int perPage= Integer.parseInt(map.get("perPage"));
		int index=((curPage-1))*perPage;
		index*=(1+curIdx);
	
		int totalCount=0;System.out.println(map.get("searchValue"));
		if(map.get("searchValue")==null) {
			totalCount=template.selectOne("MembertotalCount");
		}
		else {
			totalCount=template.selectOne("MembertotalCount1",map);
		}
		
		MemberMngPageDTO dto = new MemberMngPageDTO();
		List<MemberDTO> list=template.selectList("getAllMemberData",map, new RowBounds(index,perPage));
		dto.setM_list(list);
		dto.setCurIdx(curIdx);
		dto.setCurPage(curPage);
		dto.setPerPage(perPage);
		dto.setTotalCount(totalCount);
		dto.setSearchName(map.get("searchName"));
		dto.setSearchValue(map.get("searchValue"));
		return dto;
	}

	public void qnaAnswer(Map<String,String>map) {

		template.insert("AdminQNAinsertBoard",map);
	}
	public QNADTO qnaselectByNum(int num) {
	
		return template.selectOne("AdminQNAselectByNum",num);
	}
	public int getTodaySales() {
		return template.selectOne("todaySales");
	}
	public int getMonthSales() {
		return template.selectOne("monthSales");
	}
}
