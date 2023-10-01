
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
            alert('이미 교환접수중인 상품입니다.');
            break;
        case 2:
            event.preventDefault();
            alert('이미 취소접수중인 상품입니다.');
            break;
        default:
            location.href = '/board/5/inquiry/' + productNo + '/insert?from=purchase';
            break;
    }
}