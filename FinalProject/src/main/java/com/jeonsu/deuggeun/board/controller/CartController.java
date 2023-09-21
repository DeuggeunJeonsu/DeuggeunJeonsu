package com.jeonsu.deuggeun.board.controller;

import com.jeonsu.deuggeun.board.model.dto.Cart;
import com.jeonsu.deuggeun.board.model.dto.Order;
import com.jeonsu.deuggeun.board.model.service.MarketService;
import com.jeonsu.deuggeun.member.model.dto.Member;
import oracle.jdbc.proxy.annotation.Post;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.Map;

@SessionAttributes({"loginMember"})
@RestController
@RequestMapping("/cart")
public class CartController {

    private final MarketService service;

    // 의존성 주입
    @Autowired
    public CartController(MarketService service) {
        this.service = service;
    }

    // 장바구니에 상품 담기
    @PostMapping("/addToCart")
    public int addToCart(@RequestBody Cart cart) {
        System.out.println("컨트롤러 실행!!!");
        return service.addToCart(cart);
    }

    // 장바구니 상품 삭제
    @DeleteMapping("/remove")
    public int removeFromCart(@SessionAttribute(value = "loginMember", required = false) Member loginMember,
                              @RequestBody Cart cart) {

        int memberNo = loginMember.getMemberNo();
        int productNo = cart.getProductNo();

        Map<String, Object> map = new HashMap<String, Object>();
        map.put("memberNo", memberNo);
        map.put("productNo", productNo);
        map.put("cart", cart);

        return service.removeFromCart(map);
    }

     // 결제 성공 시 주문 테이블 등록
    @PostMapping("/insertOrder")
    public int insertOrder(@SessionAttribute(value = "loginMember", required = false) Member loginMember,
                           @RequestBody Map<String, Object> paymentInfo){

        if (loginMember == null) {
            return -1; // 세션이 없거나 로그인되지 않았을 때
        } else{
            int memberNo = loginMember.getMemberNo();

        // 새로운 Order 객체 생성
        Order order = new Order();

        order.setMemberNo(memberNo);
        order.setDelName((String) paymentInfo.get("buyer_name")); // 구매자 이름
        order.setDelEmail((String) paymentInfo.get("buyer_email")); // 구매자 이메일
        order.setPmCard((String) paymentInfo.get("card_name")); // 카드사
        order.setDelZip((String) paymentInfo.get("buyer_postcode")); // 우편번호
        order.setDelAddr((String) paymentInfo.get("buyer_addr")); // 주소
        order.setDelPhone((String) paymentInfo.get("buyer_tel")); // 전화번호
        order.setDelNotes((String) paymentInfo.get("buyer_notes")); // 요청사항
        order.setTotal(Integer.parseInt((String) paymentInfo.get("amount"))); // 총금액
        order.setOrderName((String) paymentInfo.get("name")); // 결제창에 뜨는 상품명
        order.setProductCount(Integer.parseInt((String) paymentInfo.get("productCount"))); // 상품 수량

        System.out.println(order);

        return service.insertOrder(order);
        }
    }
}

