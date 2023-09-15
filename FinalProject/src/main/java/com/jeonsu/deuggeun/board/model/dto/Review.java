package com.jeonsu.deuggeun.board.model.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class Review {

    private int memberNo;
    private int reviewNo;
    private int productNo;
    private String reviewTitle;
    private String reviewContent;
    private String uploadImage;
    private int boardCode;
    private String memberNickname;
    private String reviewCreateDate;
    private int readCount;
    private String reviewFlag;

}
