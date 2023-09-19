// 상품 수량 선택 후 ADD TO CART 누를때 데이터 전송
// DOM 로드 완료 후 실행
document.addEventListener("DOMContentLoaded", function() {
    // "ADD TO CART" 버튼에 클릭 이벤트 리스너 추가
    const cartBtn = document.getElementById("cart-btn");

    cartBtn.addEventListener("click", function(e) {

        if (loginMemberNo == "") {
            alert("로그인 후 이용해주세요");
            return;
        }
        // 이벤트 기본 동작 중지 (폼 전송 중지)
        e.preventDefault();

        // "수량"에서 선택한 값을 가져옴
        const selectElement = document.getElementById("select");
        const selectedQuantity = selectElement.value;

        // 선택한 "수량"을 서버로 보내기 위한 객체
        const data = {
            "memberNo": loginMemberNo,
            "productNo" : productNo,
            "price": productPrice,
            "quantity" : selectedQuantity
        };

        // 서버로 요청을 보냄
        fetch("/cart/addToCart", {
            method: "POST",
            headers: { "Content-Type": "application/json"},
            body: JSON.stringify(data)
        })
            .then(resp => resp.json())
            .then(data => {
                // 서버로부터 성공 메시지를 받으면 알림 메시지를 표시
                if (data.success) {
                    console.log("성공이드아!");
                    alert("상품이 장바구니에 담겼습니다!");
                } else {
                    console.log("오류 발생...")
                    alert("장바구니 기능 실패ㅠㅠ");
                }
            })
            .catch((error) => {
                console.error("Error:", error);
            });
    });
});
