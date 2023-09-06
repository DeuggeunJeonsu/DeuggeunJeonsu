const paymentBtn = document.getElementById("paymentBtn");

var IMP = window.IMP;
IMP.init('imp53362054');

var today = new Date();
var hours = today.getHours(); // 시
var minutes = today.getMinutes();  // 분
var seconds = today.getSeconds();  // 초
var milliseconds = today.getMilliseconds();
var makeMerchantUid = hours + minutes + seconds + milliseconds;

paymentBtn.addEventListener("click", () => {

    requestPay();
});

function requestPay() {
    console.log('requestPay() 실행.');
    IMP.request_pay({
        pg: 'html5_inicis',
        pay_method: "card",
        merchant_uid: "IMP" + makeMerchantUid,   // 주문번호
        name: '주문명:결제테스트'/*상품명*/,
        amount: 1,                         // 숫자 타입
        buyer_email: "gildong@gmail.com",
        buyer_name: "홍길동",
        buyer_tel: "010-4242-4242",
        buyer_addr: "서울특별시 강남구 신사동",
        buyer_postcode: "01182"
    }, function (rsp) { // callback
        //rsp.imp_uid 값으로 결제 단건조회 API를 호출하여 결제결과를 판단합니다.
        if (rsp.success) {
            console.log(rsp);
            var msg = '결제가 완료되었습니다.';
			console.log("결제성공 ");

			$.ajax({
				type: "GET",
				url: 'payment',
				data: {
					amount: 1,
					imp_uid: rsp.imp_uid,
					merchant_uid: rsp.merchant_uid

				}
			});
        } else {
            console.log(rsp);
            var msg = '결제에 실패하였습니다.';
			msg += '에러내용 : ' + rsp.error_msg;
        }
    });
}