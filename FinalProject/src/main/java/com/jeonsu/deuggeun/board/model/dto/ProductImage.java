package com.jeonsu.deuggeun.board.model.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class ProductImage {

    // PRODUCT_IMG 테이블

    //P_IMG_NO
    //P_IMG_PATH
    //PRODUCT_NO
    private int pImageNo;
    private int productNo;
    private String pImagePath;

}
