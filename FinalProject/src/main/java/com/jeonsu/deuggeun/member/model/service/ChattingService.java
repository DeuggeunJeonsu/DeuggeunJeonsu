package com.jeonsu.deuggeun.member.model.service;

import java.util.List;
import java.util.Map;

import com.jeonsu.deuggeun.member.model.dto.ChattingRoom;
import com.jeonsu.deuggeun.member.model.dto.Message;
import com.jeonsu.deuggeun.member.model.dto.Member;

public interface ChattingService {
    
	/** 채팅방 목록 조회
	 * @param memberNo
	 * @return chattingRoomList
	 */
    List<ChattingRoom> selectRoomList(int memberNo);
    
    /** 채팅방 목록내 회원 검색
	 * @param memberNo
	 * @return chattingRoomList
	 */
    List<ChattingRoom> selectRoomListInUser(Map<String, Object> map);

    /** 해당 회원과 채팅방이 있는지 없는지 조회
     * @param map
     * @return result
     */
    int checkChattingNo(Map<String, Integer> map);

    /** 해당 회원과 채팅방 생성
     * @param map
     * @return result
     */
    int createChattingRoom(Map<String, Integer> map);

    /** 메세지 삽입
     * @param msg
     * @return result
     */
    int insertMessage(Message msg);

    /** 채팅 읽음 표시
     * @param paramMap
     * @return result
     */
    int updateReadFlag(Map<String, Object> paramMap);

    /** 채팅방 내부 메세지 목록 조회
     * @param paramMap
     * @return messageList
     */
    List<Message> selectMessageList( Map<String, Object> paramMap);

   /** 채팅 상대 검색
    * @param map 
    * @return memberList
    */
   List<Member> selectTarget(Map<String, Object> map);

   /** 회원 테마 저장
    * @param map
    * @return
    */
   int updateThema(Map<String, Object> map);

}