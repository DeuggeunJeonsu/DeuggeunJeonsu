package com.jeonsu.deuggeun.board.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
@RequestMapping("/board/6")
public class EntrieBoardList {
	

    @GetMapping("/list")
    public String entireBoardList (Model model) {
    	
        return "board/entireBoard/entireBoardList";
        
        
        
    }
}
