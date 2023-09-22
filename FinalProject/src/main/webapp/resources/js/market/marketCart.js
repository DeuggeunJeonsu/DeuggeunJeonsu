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
});
