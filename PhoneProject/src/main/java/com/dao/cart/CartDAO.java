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
	
		List<CartDTO> list= template.selectList("cartAllList",userid);
			
		return list;
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
	     int n = template.insert("insertItem",dto);
		System.out.println("cartDAO :"+n);
	}

	public int createOrderNum() {
		template.selectList("createOrderNum");
		int num =template.selectOne("getOrderNum");
		return num;
	}
	public void deleteItems(List<String> list) {
		// TODO Auto-generated method stub
		template.delete("delAllCart",list);
	}
	
}
