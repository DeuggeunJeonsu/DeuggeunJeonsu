package com.jeonsu.deuggeun.board.controller;

import com.jeonsu.deuggeun.board.model.service.MarketService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.Map;

@Controller
@RequestMapping("/search")
public class SearchController {

    private final MarketService service;
    public SearchController(MarketService service){
        this.service = service;
    }

    @RequestMapping("/all")
    public String searchAll(Model model,
                            @RequestParam Map<String, Object> paramMap){

        paramMap.put("keyword", paramMap.get("keyword"));
        Map<String, Object> map = service.searchAll(paramMap);

        model.addAttribute("map", map);

        return "/common/searchAll";
    }
}
