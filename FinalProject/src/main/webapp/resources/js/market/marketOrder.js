function sample6_execDaumPostcode() {
    new daum.Postcode({
        oncomplete: function (data) {
            var addr = '';

            if (data.userSelectedType === 'R') {
                addr = data.roadAddress;
            } else {
                addr = data.jibunAddress;
            }

            // 원하는 id로 값을 설정
            document.getElementById('delZip').value = data.zonecode;
            document.getElementById('delAddr1').value = addr;

            // 상세주소 필드 초기화
            document.getElementById('delAddr2').value = '';

            // 상세주소 필드로 포커스 이동
            document.getElementById('delAddr2').focus();
        }
    }).open();
}

// 취소하기 버튼
function cancelOrder() {
    window.location.href = '/board/cartList'; // 장바구니 페이지로 이동
}
