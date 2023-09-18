package com.jeonsu.deuggeun.board.model.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class Inquiry {
    //BOARD_NO
    //ADMIN_CHECK_FL
    //INQUIRY_TYPE
    private int inquiryNo;
    private int productNo;
    private String uploadImage;
    private int boardNo;
    private String inquiryTitle;
    private String inquiryContent;
    private String inquiryCreateDate;
    private String adminFlag;
    private String inquiryFlag;
    private String memberNickname;
    private String profileImage;
    private int boardCode;
    private int memberNo;
}
