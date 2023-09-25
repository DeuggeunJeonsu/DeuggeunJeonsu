<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>MD Pick! 추천상품</title>
    <link rel="stylesheet" href="/resources/css/common/main.css">
</head>
<body>
<h2 class="main-article-tit">MD Pick! 추천 상품</h2>
<div class="carousel-container">
    <ul class="carousel">
        <li>
            <div class="image-item">
                <a href="/board/5/detail/2"><img src="/resources/images/market/test3-main.jpeg" alt="Image 1"></a>
                <h3 class="productName">[L-아르기닌]</h3>
                <div>ACTIVE 필수 아미노산 L-아르기닌 1000</div>
                <p>30,000원</p>
            </div>
            <div class="image-item">
                <a href="/board/5/detail/7"><img src="/resources/images/market/8-main.jpeg" alt="Image 2"></a>
                <h3>[쫄깃,담백 고소한 구운란]</h3>
                <div>내몸의 맥반석 구운란</div>
                <p>13,000원</p>
            </div>
            <div class="image-item">
                <a href="/board/5/detail/8"><img src="/resources/images/market/9-main.jpeg" alt="Image 3"></a>
                <h3>[한끼 도시락!]</h3>
                <div>건강하게 채우는 한끼 식사</div>
                <p>23,900원</p>
            </div>
            <div class="image-item">
                <a href="/board/5/detail/9"><img src="/resources/images/market/10-main.jpeg" alt="Image 4"></a>
                <h3>[카페 키-스프레소]</h3>
                <div>언제 어디서나 즐기는 나만의 카페</div>
                <p>28,000원</p>
            </div>
            <div class="image-item">
                <a href="/board/5/detail/1"><img src="/resources/images/market/test2-main.jpeg" alt="Image 5"></a>
                <h3 class="productName">[프리미엄 프로틴 파우더]</h3>
                <div>칼로바이 퍼펙트 파워쉐이크</div>
                <p>70,000원</p>
            </div>
            <div class="image-item">
                <a href="/board/5/detail/5"><img src="/resources/images/market/test6-main.jpeg" alt="Image 6"></a>
                <h3>[내가 몸짱이 될 견과믹스]</h3>
                <div>견과믹스 & 메추리알 샐러드</div>
                <p>30,000원</p>
            </div>
            <div class="image-item">
                <a href="/board/5/detail/3"><img src="/resources/images/market/test4-main.jpeg" alt="Image 7"></a>
                <h3>[라이프 프로틴]</h3>
                <div>마시는 라이프 프로틴</div>
                <p>10,000원</p>
            </div>
            <div class="image-item">
                <a href="/board/5/detail/10"><img src="/resources/images/market/11-main.jpeg" alt="Image 8"></a>
                <h3>[탄력 저항 스쿼트 밴드]</h3>
                <div>칼로바이 루프밴드</div>
                <p>11,900원</p>
            </div>

        </li>
    </ul>

    <button class="prev"><i class="fa-solid fa-chevron-left"></i></button>
    <button class="next"><i class="fa-solid fa-chevron-right"></i></button>

</div>
<div class="place"></div>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
    $(document).ready(function () {
        const $carousel = $('.carousel');
        const $carouselItems = $('.image-item');
        const singleItemWidth = $carouselItems.outerWidth(true); // 각 이미지 항목의 너비 (마진 포함)
        const visibleItemsCount = 4; // 한 번에 보이는 항목 수
        const visibleWidth = singleItemWidth * visibleItemsCount; // 한 번에 보이는 전체 너비

        let index = 0;
        let maxIndex = $carouselItems.length / visibleItemsCount - 1; // 최대 인덱스 계산

        $('.next').click(function () {
            if (index < maxIndex) {
                index++;
                $carousel.css('transform', 'translateX(' + (-visibleWidth * index) + 'px)');
            }
        });

        $('.prev').click(function () {
            if (index > 0) {
                index--;
                $carousel.css('transform', 'translateX(' + (-visibleWidth * index) + 'px)');
            }
        });
    });

</script>
</body>
</html>
