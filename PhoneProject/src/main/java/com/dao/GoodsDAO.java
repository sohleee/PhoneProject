package com.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.dto.GoodsDTO;

@Repository 
public class GoodsDAO {
	
	@Autowired
	SqlSessionTemplate template;
	
	public List<GoodsDTO> goodsList(@RequestParam String gcategory){
		List<GoodsDTO> list= template.selectList("goodsList",gcategory);
		return list;
	}
	
	public GoodsDTO goodsRetrieve(String gCode){
		GoodsDTO dto= template.selectOne("goodsRetrieve",gCode);
		return dto;
	}
}
