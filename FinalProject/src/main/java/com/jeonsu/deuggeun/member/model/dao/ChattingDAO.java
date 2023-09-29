package com.jeonsu.deuggeun.member.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jeonsu.deuggeun.member.model.dto.ChattingRoom;
import com.jeonsu.deuggeun.member.model.dto.Message;
import com.jeonsu.deuggeun.member.model.dto.Member;

@Repository
public class ChattingDAO {
    
    @Autowired
    private SqlSessionTemplate sqlSession;
    
    // 채팅방 목록 조회
    public List<ChattingRoom> selectRoomList(int memberNo) {
        return sqlSession.selectList("chattingMapper.selectRoomList", memberNo);
    }

    // 해당 회원과 채팅방이 있는지 없는지 조회
    public int checkChattingNo(Map<String, Integer> map) {
        return sqlSession.selectOne("chattingMapper.checkChattingNo", map);
    }

    // 해당 회원과 채팅방 생성
    public int createChattingRoom(Map<String, Integer> map) {
        int result = sqlSession.insert("chattingMapper.createChattingRoom", map);
        int chattingNo = 0;
        if(result > 0)  chattingNo = (int)map.get("chattingNo");
        return chattingNo;
    }

    // 메세지 삽입
    public int insertMessage(Message msg) {
        return sqlSession.insert("chattingMapper.insertMessage", msg);
    }

    // 채팅 읽음 표시
    public int updateReadFlag(Map<String, Object> paramMap) {
        return sqlSession.update("chattingMapper.updateReadFlag", paramMap);
    }

    // 채팅방 내부 메세지 목록 조회
    public List<Message> selectMessageList(int chattingNo) {
       return sqlSession.selectList("chattingMapper.selectMessageList", chattingNo);
    }

    // 채팅 상대 검색
    public List<Member> selectTarget(Map<String, Object> map) {
    	return sqlSession.selectList("chattingMapper.selectTarget", map);
    }

    // 회원 테마 저장
	public int updateThema(Map<String, Object> map) {
		return sqlSession.update("chattingMapper.updateThema",map);
	}
}