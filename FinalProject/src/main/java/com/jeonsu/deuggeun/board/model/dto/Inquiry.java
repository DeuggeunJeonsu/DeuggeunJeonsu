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
    private int boardNo;
    private String adminCheckFlag;
    private int inquiryType;
}
