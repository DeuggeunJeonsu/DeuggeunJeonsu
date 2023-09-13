package com.jeonsu.deuggeun.board.model.dto;

import java.util.List;

//import com.jeonsu.deuggeun.board.model.dto.BoardImage;
//import com.jeonsu.deuggeun.board.model.dto.Comment;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class Board {

	private int boardNo; // 게시글 번호
	private String boardTitle; // 게시글 제목
	private String boardContent; // 게시글 내용
	private String boardCreateDate; // 게시글 작성일
	private String boardState; // 게시글 상태(Y: 정상, N: 삭제)
	private String boardUpdateDate; // 게시글 마지막 수정일
	private int readCount; // 게시글 조회수
	private int boardCode; // 게시판 코드(1: 운동정보/ 2:운동공유/ 3:자유/ 4: 공지/ 5:마켓)
	private String boardName; // 게시판 이름
	private int tagNo; // 해시태그 번호
	private String tagContent; // 해시태그 내용

	private int memberNo; // 작성자 회원 번호
	private String memberNickname; // 작성자 닉네임
	private String profileImage; // 작성자 프로필 이미지
	private String thumbnail; // 게시글 썸네일
	
	private int commentCount; // 댓글 수
	private int likeCount;    // 좋아요 수

	// 상품 관련
	private int productPrice;
	private String pImagePath;

	public String getpImagePath() {
		return pImagePath;
	}

	public void setpImagePath(String pImagePath) {
		this.pImagePath = pImagePath;
	}

	// 이미지 목록
//	private List<BoardImage> imageList;

	// 댓글 목록
//	private List<Comment> commentList;
	
	// 운동 루틴 목록
//	private List<Routine> routineList;
	
}
