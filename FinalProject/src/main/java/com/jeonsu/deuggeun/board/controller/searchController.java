package com.jeonsu.deuggeun.board.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/search")
public class searchController {

    @RequestMapping("/all")
    public String searchAll(){
        return "/common/searchAll";
    }
}
