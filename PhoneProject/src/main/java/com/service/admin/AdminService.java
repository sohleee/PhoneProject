package com.service.admin;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.dao.admin.AdminDAO;
import com.dao.admin.QNAResponseDAO;
import com.dto.admin.AdminDTO;
import com.dto.admin.MemberMngPageDTO;
import com.dto.cart.SalesDTO;
import com.dto.qna.QNADTO;
import com.dto.qna.QNAPageDTO;

@Service("AdminService")
public class AdminService {
	@Autowired
	AdminDAO dao;
	@Autowired
	QNAResponseDAO qnadao;
	public AdminDTO getAdminData( Map<String, String> map) {
		return dao.getAdminData(map);
	}

	public List<SalesDTO> getSalesChartDatas( Map<String, String> map) {

		return  dao.getSalesChartDatas(map);
	}
	
	public MemberMngPageDTO page(Map<String, String> map){
	
		return dao.page( map);

	}
	public QNAPageDTO qnapage(Map<String, String> map){
		
		return qnadao.qnapage( map);

	}
	public MemberMngPageDTO membersDelete(String[] num,Map<String,String> map) {
		ArrayList<String>numlist= new ArrayList<>();
		for (String string : num) {
			numlist.add(string);
		}
		 dao.membersDelete(numlist);
		return dao.page(map);
	}
	@Transactional
	public MemberMngPageDTO memberUpdate(Map<String, String> map2,Map<String,String> map){
	
		dao.memberUpdate(map2);
			
		
		return dao.page(map);
	}
	
	
	public void qnaMngretrieve(Map<String,String> map)  {
				dao.qnaAnswer( map);
		
			
		}
	public void qnaDelete(int num) {
		qnadao.qna_delete(num);
	}

}
