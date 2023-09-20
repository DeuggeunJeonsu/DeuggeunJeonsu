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

    // 장바구니에 상품 담기
    @PostMapping("/addToCart")
    public int addToCart(@RequestBody Cart cart) {
        System.out.println("컨트롤러 실행!!!");
        return service.addToCart(cart);
    }

}

