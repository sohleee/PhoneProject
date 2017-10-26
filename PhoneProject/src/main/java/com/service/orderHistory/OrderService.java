package com.service.orderHistory;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.cart.OrderDAO;
import com.dto.cart.OrderDTO;

@Service("orderService")
public class OrderService {
	
	@Autowired
	OrderDAO dao;
	public void orderHistory(Map<String,String> map) {
		// TODO Auto-generated method stub
		dao.orderHistory(map);
	}
	public List<OrderDTO> orderHistoryList(String userid) {
		// TODO Auto-generated method stub
		return dao.orderList(userid);
	}

}
