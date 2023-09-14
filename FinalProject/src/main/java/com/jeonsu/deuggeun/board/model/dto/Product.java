package com.jeonsu.deuggeun.board.model.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import java.util.List;

@Getter
@Setter
@ToString
public class Product {

    // PRODUCT 테이블 DTO
    private int productNo;
    private String productTitle;
    private String productContent;
    private String productName;
    private int productPrice;
    private int productCount;
    private int boardCode;
    private String productSt;
    private String productType;

    private String productContain;

    private String productMaterial;
    private String productIntake;
    private int memberNo;
    private String subTitle;
    private String productImg;

    // 상품 이미지 한개
//    private String pImagePath;


    // 상품 이미지 목록
    private List<ProductImage> pImageList;

}
