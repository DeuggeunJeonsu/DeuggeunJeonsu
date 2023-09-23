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

var IMP = window.IMP;
IMP.init('imp53362054');

var today = new Date();
var hours = today.getHours(); // 시
var minutes = today.getMinutes();  // 분
var seconds = today.getSeconds();  // 초
var milliseconds = today.getMilliseconds();
var makeMerchantUid = hours +  minutes + seconds + milliseconds;
// var totalAmountSum = "${totalAmountSum}";
function requestPay() {

    var delName = document.getElementById("delName").value.trim();
    var delEmail = document.getElementById("delEmail").value.trim();
    var delPhone = document.getElementById("delPhone").value.trim();
    var delZip = document.getElementById("delZip").value.trim();
    var delAddr1 = document.getElementById("delAddr1").value.trim();
    var delAddr2 = document.getElementById("delAddr2").value.trim();
    var delNotes = document.getElementById("delNotes").value.trim();
   // var totalAmountSum = "${totalAmountSum}";
    var totalAmountSum = document.getElementById("totalAmountSum").value;
    var productName = document.getElementById("productName").value;
    let productCount = document.getElementById('productCount').value;

    console.log("productNo의 총 개수: " + productCount);
    console.log("totalAmountSum의 값 : " + totalAmountSum);

    if (delName === "") {
        alert("이름은 필수 입력 사항입니다.");
        return false;
    }
    // 이름 유효성
    var nameRegEx = /^[a-zA-Z가-힣\s]+$/;
    if (!nameRegEx.test(delName)) {
        alert("이름은 알파벳 또는 한글만 가능합니다.");
        return false;
    }
    if (delPhone === "") {
        alert("휴대폰 번호는 필수 입력 사항입니다.");
        return false;
    }
    // 이메일 유효성
    if(delEmail === ""){
        alert("이메일을 입력해주세요.")
        return false;
    }
    var emailRegEx = /^[A-Za-z\d\-\_]{4,}@[가-힣\w\-\_]+(\.\w+){1,3}$/;
    if(!emailRegEx.test(delEmail)){
        alert("유효하지 않은 이메일 형식 입니다.");
        return false;
    }

    //  전화번호 유효성
    const regExp = /^0(1[01679]|2|[3-6][1-5]|70)\d{3,4}\d{4}$/;
    if (!regExp.test(delPhone)) {
        alert("유효하지 않은 전화번호 형식 입니다.");
        return false;
    }

    // 우편번호 유효성
    if (delZip === "") {
        alert("우편번호는 필수 입력 사항입니다.");
        return false;
    }
    const regExp2 = /^[0-9]{5,7}$/;
    if(!regExp2.test(delZip)){
        alert("유효하지 않은 우편번호 형식 입니다.");
        return false;
    }

    // 주소 필수 입력사항
    if (delAddr1 === "") {
        alert("주소는 필수 입력 사항입니다.");
        return false;
    }
    if(delAddr2 === ""){
        alert("상세주소를 입력해주세요!")
        return false;
    }

    if (delNotes === "") {
        delNotes = "조심히 안전하게 와주세요";
    }

    var paymentSuccess = false;

    console.log('requestPay() 실행.');
    IMP.request_pay({
        pg : 'html5_inicis',
        pay_method: "card",
        merchant_uid: "IMP"+makeMerchantUid,   // 주문번호
        name : '주문명 : ' + productName + '..',
        amount : totalAmountSum,
        productCount : productCount,
        buyer_email: delEmail, // 이메일
        buyer_name: delName,  // 이름
        buyer_addr: delAddr1 + ' ' + delAddr2,  // 주소와 상세주소
        buyer_postcode: delZip,  // 우편번호
        buyer_notes: delNotes  // 배송 요청 사항

    }, function (rsp) { // callback
        //rsp.imp_uid 값으로 결제 단건조회 API를 호출하여 결제결과를 판단합니다.
        if(rsp.success){
            console.log(rsp);
            paymentSuccess = true; // 성공

            const dataToSend = {
                merchant_uid: "IMP" + makeMerchantUid,
                name: '주문명 : ' + productName + '..',
                amount: totalAmountSum,
                productCount : productCount,
                buyer_email: delEmail,
                buyer_name: delName,
                buyer_tel: delPhone,
                buyer_addr: delAddr1 + ' ' + delAddr2,
                buyer_postcode: delZip,
                buyer_notes : delNotes

            };

            fetch('/cart/insertOrder', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json',
                },
                body: JSON.stringify(dataToSend),
            })
                .then(resp => resp.json())
                .then(result  => {
                    if(result > 0){ // 성공
                        console.log('Success:', result);
                        alert('고객님의 주문이 완료되었습니다 ㅎㅎ');
                        window.location.href = `/board/success/${result}`
                    }else{
                        alert('결제에 실패했습니다ㅠㅠ');
                        console.log('주문데이터 등록 실패ㅠㅠ');
                        window.location.href = "/board/cartList";
                    }
                })
                .catch((error) => {
                    console.error('Error:', error);
                });
        } else{
            console.log(rsp);
            paymentSuccess = false; // 실패
        }
    });
}

// 취소하기 버튼
function cancelOrder() {
    window.location.href = '/board/cartList'; // 장바구니 페이지로 이동
}
