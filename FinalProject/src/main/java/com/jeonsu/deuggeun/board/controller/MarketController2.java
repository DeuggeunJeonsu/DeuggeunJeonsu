//package com.jeonsu.deuggeun.board.controller;
//import com.jeonsu.deuggeun.board.model.dto.Product;
//import com.jeonsu.deuggeun.board.model.dto.ProductImage;
//import com.jeonsu.deuggeun.board.model.service.MarketService;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.stereotype.Controller;
//import org.springframework.ui.Model;
//import org.springframework.web.bind.annotation.GetMapping;
//import org.springframework.web.bind.annotation.PathVariable;
//import org.springframework.web.bind.annotation.RequestMapping;
//import org.springframework.web.servlet.mvc.support.RedirectAttributes;
//
//import java.util.HashMap;
//import java.util.List;
//import java.util.Map;
//
//@Controller
//@RequestMapping("/board")
//public class MarketController2 {
//
//    private final MarketService marketService;
//
//    @Autowired
//    public MarketController2(MarketService marketService) {
//
//        this.marketService = marketService;
//    }
//
//
//    //"/board/{boardCode}/review/{productNo}"
//    @GetMapping("/{boardCode}/review/{productNo}")
//    public String reviewList(@PathVariable("boardCode") int boardCode
//            , @PathVariable("productNo") int productNo
//            , Model model
//            , RedirectAttributes ra ){
//        Map<String, Object> map = new HashMap<String, Object>();
//
//
//        map.put("boardCode", boardCode);
//        map.put("productNo", productNo);
//
//        Product product = service.selectProduct(map);
//
//        List<ProductImage> productImageList = service.selectImageList(productNo);
//
//        String path = null;
//
//        if(product != null){
//            //return "board/market/marketReview";
//            path = "board/market/marketReview";
//            model.addAttribute("productImageList", productImageList);
//            model.addAttribute("product", product);
////			System.out.println("pro 이미지 리스트 : " + productImageList);
////			System.out.println("product의 값" + product);
//
//        }else{
//            path = "redirect:/board/" + boardCode + "/list";
//            ra.addFlashAttribute("message", "해당 상품이 존재하지 않습니다.");
//        }
//
//        return path;
//    }
//}
