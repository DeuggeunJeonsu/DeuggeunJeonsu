// 상품 수량 선택 후 ADD TO CART 누를 때 데이터 전송
// DOM 로드 완료 후 실행
document.addEventListener("DOMContentLoaded", function() {
    // "ADD TO CART" 버튼에 클릭 이벤트 리스너 추가
    const cartBtn = document.getElementById("cart-btn");

    cartBtn.addEventListener("click", function(e) {

        if (loginMemberNo == "") {
            Swal.fire({
                icon: 'warning',
                title: '알림',
                text: '로그인 후 이용해주세요'
            });
            return;
        }
        // 이벤트 기본 동작 중지 (폼 전송 중지)
        e.preventDefault();

        // "수량"에서 선택한 값을 가져옴
        const selectElement = document.getElementById("select");
        const selectedQuantity = selectElement.value;

        if (selectedQuantity === "- [필수] 수량을 선택해 주세요 -") {
            Swal.fire({
                icon: 'warning',
                title: '알림',
                text: '수량을 선택해주세요!'
            });
            return;  // 추가된 검증 후 코드 중지
        }

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
                if (result > 0) {
                    Swal.fire({
                        icon: 'success',
                        title: '성공!',
                        text: '상품이 장바구니에 담겼습니다!'
                    });
                    document.getElementById("select").selectedIndex = 0;

                } else if(result === -2) {
                    Swal.fire({
                        icon: 'warning',
                        title: '주의!',
                        html: "동일 상품을 5개이상 구매하실 수 없습니다.<br>장바구니를 확인해주세요 😊"
                    });
                } else {
                    Swal.fire({
                        icon: 'error',
                        title: '실패!',
                        text: '장바구니 기능 실패ㅠㅠ'
                    });
                }
            })
            .catch((error) => {
                console.error("Error:", error);
            });
    });
});

// 바로 구매하기 버튼
// BUY IT NOW 버튼
document.addEventListener("DOMContentLoaded", function() {
    // "ADD TO CART" 버튼에 클릭 이벤트 리스너 추가
    const nowBtn = document.getElementById("now-btn");

    nowBtn.addEventListener("click", function(e) {

        if (loginMemberNo == "") {
            Swal.fire({
                icon: 'warning',
                title: '알림',
                text: '로그인 후 이용해주세요'
            });
            return;
        }
        // 이벤트 기본 동작 중지 (폼 전송 중지)
        e.preventDefault();

        // "수량"에서 선택한 값을 가져옴
        const selectElement = document.getElementById("select");
        const selectedQuantity = selectElement.value;

        // 수량 선택이 되지 않은 경우 경고 표시
        if (selectedQuantity === "- [필수] 수량을 선택해 주세요 -") {
            Swal.fire({
                icon: 'warning',
                title: '알림',
                text: '수량을 선택해주세요!'
            });
            return;  // 추가된 검증 후 코드 중지
        }

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
                if (result > 0) {
                    Swal.fire({
                        icon: 'success',
                        title: '성공!',
                        text: '상품 담고 장바구니로 이동'
                    }).then(() => {
                        window.location.href = "/board/cartList";
                    });

                } else if(result === -2) {
                    Swal.fire({
                        icon: 'warning',
                        title: '주의!',
                        html: "동일 상품을 5개이상 구매하실 수 없습니다.<br>장바구니를 확인해주세요 😊"
                    });
                } else {
                    Swal.fire({
                        icon: 'error',
                        title: '실패!',
                        text: '장바구니 기능 실패ㅠㅠ'
                    });
                }
            })
            .catch((error) => {
                console.error("Error:", error);
            });
    });
});
