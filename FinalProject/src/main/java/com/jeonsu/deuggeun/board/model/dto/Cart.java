package com.jeonsu.deuggeun.board.model.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class Cart {

    private int productNo;
    private int memberNo;
    private int quantity; // 수량
    private String orderFlag;
    private int total; // 총 금액
    private int orderNo; // 주문번호는 결제후에 생성되야 함
    private int productPrice; // 상품금액
    private String productName; // 상품명
    private String itemStatus;
    private String memberNickname; // 사용자명
//    private int totalCount; // 총개수
}
