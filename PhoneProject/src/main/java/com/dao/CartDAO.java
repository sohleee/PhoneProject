package com.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dto.CartDTO;
import com.dto.BoardDTO;
import com.dto.PageDTO;

@Repository 
public class CartDAO {
	
	@Autowired
	SqlSessionTemplate template;
	
	public void addCart(CartDTO dto) {
		template.insert("addCart",dto);
	}
	
	public List<CartDTO> cartList(String userid){
		List<CartDTO> list=template.selectList("cartList",userid);
		return list;
	}
	
	public void AmountUpdate(HashMap<String, String> map) {
		template.update("amountUpdate",map);
	}
	
	public void delCart(int num) {
		template.delete("delCart",num);
	}
	
	public void deleteAll(List<String> list) {
		template.delete("delAllCart",list);
	}
	
	public CartDTO orderConfirm(int num) {
		CartDTO dto=template.selectOne("orderConfirm",num);
		return dto;
	}
}
