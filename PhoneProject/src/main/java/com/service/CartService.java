package com.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestParam;

import com.dao.CartDAO;
import com.dao.GoodsDAO;
import com.dto.CartDTO;
import com.dto.GoodsDTO;

@Service
public class CartService {

	@Autowired
	CartDAO dao;

	public void addCart(CartDTO dto) {
		dao.addCart(dto);
	}
	
	public List<CartDTO> cartList(String userid){
		return dao.cartList(userid);
	}
	

	public void AmountUpdate(HashMap<String, String> map) {
		dao.AmountUpdate(map);
	}
	
	public void delCart(int num) {
		dao.delCart(num);
	}
	
	public void deleteAll(List<String> list) {
		dao.deleteAll(list);
	}
	
	public CartDTO orderConfirm(int num) {
		return dao.orderConfirm(num);
	}
}

