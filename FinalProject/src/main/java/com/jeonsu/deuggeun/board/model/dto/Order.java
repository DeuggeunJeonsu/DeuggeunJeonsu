package com.jeonsu.deuggeun.board.model.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class Order {
    private String orderName;
    //ORDER_NO
    private int orderNo;
    //TOTAL_AMOUNT
    private int total;
    //ORDER_DATE
    private String orderDate;
    //PM_CARD
    private String pmCard;
    //ORDER_ST
    private String orderStatus;
    //DEL_NAME
    private String delName;
    // DEL_EMAIL
    private String delEmail;
    //DEL_ZIP
    private String delZip;
    //DEL_ADDR
    private String delAddr;
    //DEL_PHONE
    private String delPhone;
    //ORDER_COUNT
    private int orderCount;
    //CANCEL_ST
    private String cancelStatus;
    //CHANGE_ST
    private String changeStatus;
    //MEMBER_NO
    private int memberNo;
    private String delNotes;
    private int productCount;
    private String memberNickname;
}
