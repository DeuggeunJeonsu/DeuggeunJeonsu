// // 회원의 구매목록과 비교해서 페이지 이동
// document.getElementById('insertBtn').addEventListener('click', function(e) {
//     e.preventDefault(); // 기본 이벤트 중지
//
//     fetch(`/checkPurchase/${productNo}`)
//         .then(response => response.json())
//         .then(data => {
//             if (data.purchased) {
//                 location.href = `/board/${boardCode}/review/${productNo}/insert`;
//             } else {
//                 alert('이 상품을 구매한 적이 없습니다.');
//             }
//         });
// });
