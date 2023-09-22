// 상품 수량 선택 후 ADD TO CART 누를 때 데이터 전송
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
        const total = productPrice * selectedQuantity; // 수량과 상품금액을 곱해서 총 금액 계산
        const data = {
            "memberNo": loginMemberNo,
            "productNo" : productNo,
            "productPrice": productPrice,
            "quantity" : selectedQuantity,
            "total": total
        };

        // 서버로 요청을 보냄
        fetch("/cart/addToCart", {
            method: "POST",
            headers: { "Content-Type": "application/json" },
            body: JSON.stringify(data),
        })
            .then((resp) => resp.json())
            .then(result => {
                if (result > 0) { // result가 0보다 클 때 성공
                    console.log("성공입니다!");
                    alert("상품이 장바구니에 담겼습니다!");
                    document.getElementById("select").selectedIndex = 0;

                }else if(result === -2){
                    alert("동일 상품을 5개이상 구매하실 수 없습니다.\n장바구니를 확인해주세요 😊");
                }
                else {
                    console.log("장바구니 기능 실패ㅠㅠ");
                    alert("장바구니 기능 실패ㅠㅠ");
                }
            })
            .catch((error) => {
                console.error("Error:", error);
            });
    });
});


// BUY IT NOW 버튼
document.addEventListener("DOMContentLoaded", function() {
    // "ADD TO CART" 버튼에 클릭 이벤트 리스너 추가
    const nowBtn = document.getElementById("now-btn");

    nowBtn.addEventListener("click", function(e) {

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
        const total = productPrice * selectedQuantity; // 수량과 상품금액을 곱해서 총 금액 계산
        const data = {
            "memberNo": loginMemberNo,
            "productNo" : productNo,
            "productPrice": productPrice,
            "quantity" : selectedQuantity,
            "total": total
        };

        // 서버로 요청을 보냄
        fetch("/cart/buyItNow", {
            method: "POST",
            headers: { "Content-Type": "application/json" },
            body: JSON.stringify(data),
        })
            .then((resp) => resp.json())
            .then(result => {
                if (result > 0) { // result가 0보다 클 때 성공

                    console.log("성공입니다!");
                    alert("상품 담고 장바구니로 이동");
                    window.location.href = "/board/cartList";

                }else if(result === -2){
                    alert("동일 상품을 5개이상 구매하실 수 없습니다.\n장바구니를 확인해주세요 😊");
                }
                else {
                    console.log("장바구니 기능 실패ㅠㅠ");
                    alert("장바구니 기능 실패ㅠㅠ");
                }
            })
            .catch((error) => {
                console.error("Error:", error);
            });
    });
});
