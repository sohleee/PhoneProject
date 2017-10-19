package com.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.dao.BoardDAO;
import com.dao.CartDAO;
import com.dao.OrderDAO;
import com.dto.BoardDTO;
import com.dto.OrderDTO;
import com.dto.PageDTO;

@Service
public class OrderService {

	@Autowired
	OrderDAO orderDAO;
	@Autowired
	CartDAO cartDAO;
	
	@Transactional
	public void orderDone(OrderDTO dto,int num) {
		orderDAO.orderDone(dto);
		cartDAO.delCart(num);
	}
}
