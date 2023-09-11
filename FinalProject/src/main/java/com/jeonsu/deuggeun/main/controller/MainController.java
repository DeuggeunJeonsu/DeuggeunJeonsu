package com.jeonsu.deuggeun.main.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MainController {
	
	@RequestMapping("/")
	public String mainForward() {
		return "common/main";
	}
	
	@RequestMapping("/survey")
	public String survey() {
		return "common/survey/survey";
	}
	
	@RequestMapping("/bmi")
	public String ranking() {
		return "common/bmi";
	}

}
