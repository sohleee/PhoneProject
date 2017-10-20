package com.dao.cart;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dto.cart.CartDTO;

@Repository("cartDAO")
public class CartDAO {

	@Autowired
	SqlSessionTemplate template;
	
	
	public List<CartDTO> cartAllList( String userid) {
	
		return template.selectList("cartAllList",userid);
	}

	public void amountUpdate( HashMap<String, Integer> map) { // ���� update
		
		 template.update("amountUpdate", map);
	}

	public void delItem( int num) {	//������ ����
		// TODO Auto-generated method stub
		template.delete("deleteItem", num);
	
		
	}

	public CartDTO orderConfirm( CartDTO dto) { //�ֹ� Ȯ��â

		return template.selectOne("orderConfirm",dto);
	}

	public void insertItem( CartDTO dto) {
		// TODO Auto-generated method stub
		template.insert("insertItem",dto);
		
	}

	public int createOrderNum() {
		template.insert("createOrderNum");
		int num =template.selectOne("getOrderNum");
		return num;
	}

	
}