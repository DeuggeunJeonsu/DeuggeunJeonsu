// // market.productPrice에서 숫자 가져오기 (예: 1000000000)
// const productPrice = market.productPrice;
//
// // 숫자를 쉼표로 구분된 문자열로 포맷하는 함수
// function formatPrice(price) {
//     return price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
// }
//
// // 포맷된 텍스트 생성
// const formattedPrice = formatPrice(productPrice);
//
// // 결과를 HTML 요소에 삽입
// document.getElementById('formattedPrice').textContent = formattedPrice + '원';
//
