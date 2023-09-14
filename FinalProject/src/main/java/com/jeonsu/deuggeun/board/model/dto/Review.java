package com.jeonsu.deuggeun.board.model.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class Review {

    private int memberNo;
    private int productNo;
    private String uploadImage;
    private int boardNo;
    private int inquiryType;
    private String boardTitle;
    private String boardContent;
    private String memberNickname;
    private String CreateDate;
    private int readCount;
    private int boardCode;

}
