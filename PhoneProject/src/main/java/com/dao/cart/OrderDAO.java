package com.dao.cart;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.dto.cart.OrderDTO;
import com.dto.cart.SalesDTO;

public class OrderDAO {

	public int orderHistory(SqlSession session, OrderDTO dto) {
		int n=session.insert("addOrder",dto);
		 System.out.println("OrderDAO :"+n);
		return n;
				
	}
	public int insertSales(SqlSession session,SalesDTO dto ) {
		return session.insert("addSales",dto);
	}
	public List<OrderDTO> orderList(SqlSession session, String userid) {
		// TODO Auto-generated method stub
		return session.selectList("orderList",userid);
	}

}
