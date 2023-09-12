package com.jeonsu.deuggeun.board.controller;
import com.jeonsu.deuggeun.board.model.service.MarketService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

@Controller
public class MarketController2 {

    private final MarketService marketService;

    @Autowired
    public MarketController2(MarketService marketService) {
        this.marketService = marketService;
    }

}