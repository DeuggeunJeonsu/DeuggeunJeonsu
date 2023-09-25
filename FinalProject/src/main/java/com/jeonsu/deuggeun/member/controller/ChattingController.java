package com.jeonsu.deuggeun.member.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.jeonsu.deuggeun.member.model.dto.ChattingRoom;
import com.jeonsu.deuggeun.member.model.dto.Message;
import com.jeonsu.deuggeun.member.model.service.ChattingService;

import lombok.extern.slf4j.Slf4j;

import com.jeonsu.deuggeun.member.model.dto.Member;

@SessionAttributes({"loginMember"})
@Controller
@Slf4j
public class ChattingController {
    
    @Autowired
    private ChattingService service;
    
    // 채팅 페이지로 이동
    @GetMapping("/chatting")
    public String chatting(@SessionAttribute("loginMember") Member loginMember, Model model) {
    	log.debug("{}",loginMember);
        // 채팅방 목록 조회해서 전달
        List<ChattingRoom> roomList = service.selectRoomList(loginMember.getMemberNo());
        model.addAttribute("roomList", roomList);
        return "common/chatting";
    }
    
    // 채팅 상대 검색 ajax
    @GetMapping(value="/chatting/selectTarget", produces="application/json; charset=UTF-8")
    @ResponseBody
    public List<Member> selectTarget(String query, @SessionAttribute("loginMember") Member loginMember){
       Map<String, Object> map = new HashMap<>();
       map.put("memberNo", loginMember.getMemberNo());
       map.put("query", query);
       return service.selectTarget(map);
    }
    
    // 채팅방 입장(없으면 생성)
    @GetMapping("/chatting/enter")
    @ResponseBody
    public int chattingEnter(int targetNo, @SessionAttribute("loginMember") Member loginMember) {
     
        Map<String, Integer> map = new HashMap<String, Integer>();
        
        map.put("targetNo", targetNo);
        map.put("loginMemberNo", loginMember.getMemberNo());
        
        int chattingNo = service.checkChattingNo(map);
        
        if(chattingNo == 0) {
            chattingNo = service.createChattingRoom(map);
        }
        
        return chattingNo;
    }
    
    // 채팅방 목록 조회
    @GetMapping(value="/chatting/roomList", produces="application/json; charset=UTF-8")
    @ResponseBody
    public List<ChattingRoom> selectRoomList(@SessionAttribute("loginMember") Member loginMember) {
       return service.selectRoomList(loginMember.getMemberNo());
    }
    
    
    // 채팅 읽음 표시
    @PutMapping("/chatting/updateReadFlag")
    @ResponseBody
    public int updateReadFlag(@RequestBody Map<String, Object> paramMap) {
        return service.updateReadFlag(paramMap);
    }
    
    // 채팅방 내부 메세지 목록 조회
    @GetMapping(value="/chatting/selectMessage", produces="application/json; charset=UTF-8")
    @ResponseBody
    public List<Message> selectMessageList(@RequestParam Map<String, Object> paramMap) {
        return service.selectMessageList(paramMap);
    }
    

}