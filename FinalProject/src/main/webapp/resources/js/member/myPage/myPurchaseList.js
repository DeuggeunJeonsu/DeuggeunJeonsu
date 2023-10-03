
function getQueryParam(name) {
    const urlParams = new URLSearchParams(window.location.search);
    return urlParams.get(name);
}

document.addEventListener('DOMContentLoaded', function() {
    const keyValue = getQueryParam("key");
    if (keyValue) {
        document.getElementById("selectBox").value = keyValue;
    }
});

document.getElementById("selectBox").addEventListener('change', function() {
    const keyValue = this.value;
    let url = `/myPage/myPurchaseList?key=${keyValue}`;
    window.location.href = url;
});

// 문의 번호에 따른 버튼 제어
function handleInquiryClick(event, productNo) {
    const button = event.target;
    const inquiryType = parseInt(button.getAttribute('data-inquiryType'));

    switch (inquiryType) {
        case 1:
            event.preventDefault();
            alert('이미 교환 접수 중인 상품입니다.');
            break;
        case 2:
            event.preventDefault();
            alert('이미 취소 접수 중인 상품입니다.');
            break;
        default:
            location.href = '/board/5/inquiry/' + productNo + '/insert?from=purchase';
            break;
    }
}

// 리뷰 작성 여부 확인
function checkReview(productNo) {
    $.ajax({
        url: '/board/checkReview',
        type: 'GET',
        data: {
            productNo: productNo,
            memberNo: loginMemberNo
        },
        success: function(result) {
            if(result > 0) {
                alert("이미 리뷰를 작성하셨습니다.");
            } else {
                location.href='/board/5/review/' + productNo + '/insert';
            }
        },
        error: function(error) {
            console.error("Error checking review:", error);
        }
    });
}