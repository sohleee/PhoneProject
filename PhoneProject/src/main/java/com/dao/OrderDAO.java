package com.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dto.BoardDTO;
import com.dto.OrderDTO;
import com.dto.PageDTO;

@Repository 
public class OrderDAO {
	
	@Autowired
	SqlSessionTemplate template;
	
	public int orderDone(OrderDTO dto){
		int n=template.insert("orderDone",dto);
		return n;
	}
	
}
