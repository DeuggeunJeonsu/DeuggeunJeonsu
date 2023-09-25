// 장바구니 수량 업데이트 함수를 호출
function updateShoppingCount() {
    const url = "/shoppingCount";
    $.ajax({
        type: "GET",
        url: url,
        dataType: "text",
        success: function(response) {
            $('#shopping-count').text(response);
        },
        error: function(error) {
            console.error("데이터 가져오기 오류: ", error);
        }
    });
}

// -------------------------- 스크롤 함수 --------------------------

document.addEventListener('DOMContentLoaded', function () {
    var scrollTopBtn = document.querySelector('.scroll-top-btn');

    window.addEventListener('scroll', function () {
        if (window.pageYOffset > 500) {
            scrollTopBtn.classList.add('show');
        } else {
            scrollTopBtn.classList.remove('show');
        }
    });

    scrollTopBtn.addEventListener('click', function (e) {
        e.preventDefault();
        window.scrollTo({
            top: 0,
            behavior: 'smooth'
        });
    });
});


// -------------------------- 스크롤 함수 끝 --------------------------

function changeBtn(btnId) {
    const buttons = document.querySelectorAll(".select_btn");

    buttons.forEach(function (button) {
        if (button.id === btnId) {
            button.classList.add("selected");

        } else {
            button.classList.remove("selected");
        }
    });
}

// 버튼 클릭 이벤트 리스너 추가
myButton.addEventListener('click', function() {
    window.scrollTo({
        top: 0,
        behavior: "smooth"  // 부드럽게 스크롤
    });
});

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
                    updateShoppingCount();
                    // location.reload(true);
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

// 카카오톡 공유하기 버튼

    Kakao.Share.createDefaultButton({
    container: '#kakaotalk-sharing-btn',
    objectType: 'feed',
    content: {
        title: productTitle,  // title에 productTitle 값을 사용
        description: productName,
        imageUrl:
    'http://k.kakaocdn.net/dn/Q2iNx/btqgeRgV54P/VLdBs9cvyn8BJXB3o7N8UK/kakaolink40_original.png',
    link: {
    // [내 애플리케이션] > [플랫폼] 에서 등록한 사이트 도메인과 일치해야 함
    mobileWebUrl: 'http://43.200.124.195:8080',
    webUrl: 'http://43.200.124.195:8080',
},
},
    social: {
    likeCount: 286,
    commentCount: 45,
    sharedCount: 845,
},
    buttons: [
{
    title: '웹으로 보기',
    link: {
    mobileWebUrl: 'http://43.200.124.195:8080',
    webUrl: 'http://43.200.124.195:8080',
},
},
{
    title: '앱으로 보기',
    link: {
    mobileWebUrl: 'http://43.200.124.195:8080',
    webUrl: 'http://43.200.124.195:8080',
},
},
    ],
});