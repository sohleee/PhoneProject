package com.dao.cart;

import java.util.List;
import java.util.Map;
import java.util.Set;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dto.cart.OrderDTO;
import com.dto.cart.SalesDTO;

@Repository("orderDAO")
public class OrderDAO {

	@Autowired
	SqlSessionTemplate template;
	public void orderHistory( Map<String,String> map) {
		
		Set<String> set = map.keySet();
		for (String key : set) {
			System.out.println(key+":"+map.get(key));
		}
		template.insert("addOrder",map);
		template.delete("deleteItem",Integer.parseInt(map.get("num")));
		insertSales(map);
	}
	public void insertSales( Map<String,String> dto ) {
		 template.insert("addSales",dto);
	}
	public List<OrderDTO> orderList( String userid) {
		// TODO Auto-generated method stub
		return template.selectList("orderList",userid);
	}

}
