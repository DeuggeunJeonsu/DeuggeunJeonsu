package com.jeonsu.deuggeun.board.controller;

import com.jeonsu.deuggeun.board.model.dto.Cart;
import com.jeonsu.deuggeun.board.model.service.MarketService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/cart")
public class CartController {

    private final MarketService service;

    // 의존성 주입
    @Autowired
    public CartController(MarketService service) {
        this.service = service;
    }

    @PostMapping("/addToCart")
    public int addToCart(@RequestBody Cart cart) {
        return service.addToCart(cart);
    }

}

