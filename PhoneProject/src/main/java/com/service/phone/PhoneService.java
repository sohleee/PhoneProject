package com.service.phone;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.phone.PhoneDAO;
import com.dto.phone.PhoneFileDTO;
import com.dto.phone.PhoneDTO;

@Service
public class PhoneService {
	@Autowired
	PhoneDAO dao;
	public List<PhoneDTO> PhoneList() {
		return dao.PhoneList();
	}
	public List<PhoneDTO> phoneModelList(String telecom) {
		return dao.phoneModelList(telecom);
	}
	public PhoneDTO phoneRetrieve(String telecom_num) {
		return dao.phoneRetrieve(telecom_num);
	}
	public void phoneUpdate( HashMap<String, String> map) {
		dao.phoneUpdate(map);
	}
	public void PhoneAdd(HashMap<String, String> map) {
		dao.PhoneAdd(map);
	}
	public void phoneDelete(String telecom_num) {
		dao.phoneDelete(telecom_num);
	}
}
