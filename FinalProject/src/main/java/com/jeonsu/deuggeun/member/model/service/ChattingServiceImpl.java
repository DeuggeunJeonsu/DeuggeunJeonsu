package com.jeonsu.deuggeun.member.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jeonsu.deuggeun.common.utility.Util;
import com.jeonsu.deuggeun.member.model.dao.ChattingDAO;
import com.jeonsu.deuggeun.member.model.dto.ChattingRoom;
import com.jeonsu.deuggeun.member.model.dto.Member;
import com.jeonsu.deuggeun.member.model.dto.Message;
import com.jeonsu.deuggeun.member.model.websocket.ChattingWebsocketHandler;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class ChattingServiceImpl implements ChattingService{

    @Autowired
    private ChattingDAO dao;

    // 채팅방 목록 조회
    @Override
    public List<ChattingRoom> selectRoomList(int memberNo) {
        return dao.selectRoomList(memberNo);
    }
    
    // 채팅방 목록 내 회원 검색
    @Override
    public List<ChattingRoom> selectRoomListInUser(Map<String, Object> map) {
        return dao.selectRoomListInUser(map);
    }
    
    // 해당 회원과 채팅방이 있는지 없는지 조회
    @Override
    public int checkChattingNo(Map<String, Integer> map) {
        return dao.checkChattingNo(map);
    }

    // 해당 회원과 채팅방 생성
    @Override
    public int createChattingRoom(Map<String, Integer> map) {
        return dao.createChattingRoom(map);
    }

    // 메세지 삽입
    @Override
    public int insertMessage(Message msg) {
        msg.setMessageContent(Util.XSSHandling(msg.getMessageContent()));
        return dao.insertMessage(msg);
    }

    // 채팅 읽음 표시
    @Override
    public int updateReadFlag(Map<String, Object> paramMap) {
        return dao.updateReadFlag(paramMap);
    }

    // 채팅방 내부 메세지 목록 조회
    @Override
    public List<Message> selectMessageList( Map<String, Object> paramMap) {
    	
        List<Message> messageList = dao.selectMessageList(  Integer.parseInt( String.valueOf(paramMap.get("chattingNo") )));
        
        if(!messageList.isEmpty()) {
            int result = dao.updateReadFlag(paramMap);
            if(result<0) log.error("채팅방 내부 메세지 목록 조회 실패");
        }
        return messageList;
    }

    // 채팅 상대 검색
    @Override
    public List<Member> selectTarget(Map<String, Object> map) {
    	return dao.selectTarget(map);
    }

    // 회원 테마 저장
	@Override
	public int updateThema(Map<String, Object> map) {
		return dao.updateThema(map);
	}
 
}