package com.service.cart;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.cart.CartDAO;
import com.dto.cart.CartDTO;

@Service("cartService")
public class CartService {
	
	@Autowired
	CartDAO dao;
	
	
	public List<CartDTO> cartAllList( String userid) {
		System.out.println("cartservice : "+userid);
		 List<CartDTO> list =dao.cartAllList(userid);
		return list;
	}

	public void amountUpdate( HashMap<String, Integer> map) { // ���� update
		
		 dao.amountUpdate(map);
	}

	public void delItem( int num) {	//������ ����
		// TODO Auto-generated method stub
		dao.delItem( num);
	
		
	}

	public CartDTO orderConfirm( CartDTO dto) { //�ֹ� Ȯ��â

		return dao.orderConfirm(dto);
	}

	public void insertItem( CartDTO dto) {
		// TODO Auto-generated method stub
		dao.insertItem(dto);
		
	}

	public int createOrderNum() {
		
		
		return dao.createOrderNum();
	}
}
