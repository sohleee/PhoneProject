package com.dao.phone;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dto.phone.FileDTO;
import com.dto.phone.PhoneDTO;
@Repository
public class PhoneDAO {

	@Autowired
	SqlSessionTemplate template;
	
	public List<PhoneDTO> PhoneList() {
		List<PhoneDTO> list = template.selectList("PhoneList");
		return list;
	}
	public List<PhoneDTO> phoneModelList(String phone_model_num) {
		List<PhoneDTO> list = template.selectList("phoneModelList",phone_model_num);
		return list;
	}
	public PhoneDTO phoneRetrieve(String telecom_num) {
		PhoneDTO dto = template.selectOne("phoneRetrieve",telecom_num);
		return dto;
	}
	public void phoneUpdate( HashMap<String, String> map) {
		template.update("phoneUpdate",map);	
	}
	public void PhoneAdd(HashMap<String, String> map) {
		template.insert("PhoneAdd",map);
		
	}
	public void phoneDelete(String telecom_num) {
		template.delete("phoneDelete",telecom_num);
	}
}
