package com.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestParam;

import com.dao.GoodsDAO;
import com.dto.GoodsDTO;

@Service
public class GoodsService {

	@Autowired
	GoodsDAO dao;

	public List<GoodsDTO> goodsList(@RequestParam String gcategory){
		return dao.goodsList(gcategory);
	}
	
	public GoodsDTO goodsRetrieve(String gCode){
		return dao.goodsRetrieve(gCode);
	}
}

