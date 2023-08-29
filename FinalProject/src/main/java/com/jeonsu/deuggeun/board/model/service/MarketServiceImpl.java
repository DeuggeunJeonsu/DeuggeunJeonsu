package com.jeonsu.deuggeun.board.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jeonsu.deuggeun.board.model.dao.MarketDAO;

@Service
public class MarketServiceImpl {
	
	@Autowired
	private MarketDAO dao;
	

}
