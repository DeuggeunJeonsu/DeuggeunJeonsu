package com.jeonsu.deuggeun.board.model.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import java.util.List;

@Getter
@Setter
@ToString
public class Product {
    //PRODUCT_NO
    //MEMBER_NO
    //PRODUCT_NAME
    //PRODUCT_PRICE
    //PRODUCT_COUNT
    //BOARD_CODE
    //PRODUCT_ST
    //PRODUCT_TYPE
    //PRODUCT_CONTENT
    //PRODUCT_MATERIAL
    //PRODUCT_INTAKE

    // PRODUCT 테이블 DTO
    private int productNo;
    private int memberNo;
    private String productName;
    private int productPrice;
    private int productCount;
    private int boardCode;
    private String productSt;
    private String productType;
    private String productContent;
    private String productMaterial;
    private String productIntake;

    // 상품 이미지 목록
    private List<ProductImage> pImageList;
}
