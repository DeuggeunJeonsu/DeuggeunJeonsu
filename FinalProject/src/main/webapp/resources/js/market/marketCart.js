// $(document).ready(function () {
//     // 삭제 버튼 클릭 이벤트 처리
//     $(".delete-btn").click(function () {
//         var productNo = $(this).data("product-no");
//         var $clickedButton = $(this); // 클릭된 버튼 요소를 변수에 할당
//
//         fetch("/cart/remove", {
//             method: "DELETE",
//             headers: {
//                 "Content-Type": "application/json",
//             },
//             body: JSON.stringify({
//                 productNo: productNo
//             })
//         })
//             .then(resp => resp.json())
//             .then(result => {
//                 if (result > 0) { // 성공
//                     $clickedButton.closest("tr").remove();
//                 } else { // 실패
//                     console.error("상품 삭제 실패ㅠㅠ");
//                 }
//             })
//             .catch(error => {
//                 console.error("Fetch 오류:", error);
//             });
//     });
// });
$(document).ready(function () {
    // 삭제 버튼 클릭 이벤트 처리
    $(".delete-btn").click(function () {
        var productNo = $(this).data("product-no");
        var $clickedButton = $(this); // 클릭된 버튼 요소를 변수에 할당

        fetch("/cart/remove", {
            method: "DELETE",
            headers: {
                "Content-Type": "application/json",
            },
            body: JSON.stringify({
                productNo: productNo
            })
        })
            .then(resp => resp.json())
            .then(result => {
                if (result > 0) { // 성공
                    $clickedButton.closest("tr").remove();
                    location.reload(true);
                    // 상품 삭제 후 총 상품 금액과 결제 예정 금액 업데이트
                    updateTotalAmount();
                } else { // 실패
                    console.error("상품 삭제 실패ㅠㅠ");
                }
            })
            .catch(error => {
                console.error("Fetch 오류:", error);
            });
    });

    // 총 상품 금액 및 결제 예정 금액 업데이트 함수
    // function updateTotalAmount() {
    //     var totalAmountSum = 0;
    //     // 모든 항목의 가격 합계를 계산
    //     $(".total-amount").each(function () {
    //         var amount = parseInt($(this).text().replace(/[^0-9]/g, ""), 10);
    //         totalAmountSum += amount;
    //     });
    //
    //     // 총 상품 금액 및 결제 예정 금액 업데이트
    //     $(".total-amount").text(numberWithCommas(totalAmountSum) + "원");
    // }
    //
    // // 숫자를 3자리마다 콤마(,)로 구분하는 함수
    // function numberWithCommas(x) {
    //     return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
    // }
});
