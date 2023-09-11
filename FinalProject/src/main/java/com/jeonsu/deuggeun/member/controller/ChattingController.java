package com.jeonsu.deuggeun.member.controller;

import org.springframework.stereotype.Controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;


@Controller
public class ChattingController {
    
    // 채팅 페이지
    @GetMapping("/chatting")
    public String chatting(Model model) {
        
//        List<ChattingRoom> roomList = service.selectRoomList(loginMember.getMemberNo());
//        model.addAttribute("roomList", roomList);
        return "common/chatting";
    }    

}