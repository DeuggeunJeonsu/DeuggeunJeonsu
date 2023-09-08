<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <!DOCTYPE html>
        <html>

        <head>
            <meta charset="UTF-8">
            <title>게시판 이름</title>

            <%-- marketDetail-style.css 연결 --%>
                <link rel="stylesheet" href="../resources/css/board/market/marketDetail-style.css">

                <!-- Font Awesome CDN 추가 -->
                <link rel="stylesheet"
                    href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css"
                    integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8sh+Wy4y5AuWn1C4EyyIbJs6YXvPECJwFPa28H"
                    crossorigin="anonymous">
        </head>

        <body>

            <jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>

            <section id="main-container">
                <div class="main-con">
                    <div class="top-container">
                        <div class="left-content">
                            <img src="/resources/images/market/test2-main.jpeg" alt="" id="main-photo">
                        </div>
                        <div class="right-content">
                            <div id="title">[황금비율 프리미엄 프로틴 파우더]</div>
                            <hr>
                            <div id="amount">
                                <h3>70,000원</h3>
                            </div>
                            <div class="right" id="text">
                                <h3>칼로바이 퍼펙트 파워쉐이크 대용량 2kg</h3>
                            </div>
                            <div class="right">근피로 회복, 질좋은 수면, 고중량 훈련+다이어트 서포트 스틸 그린™은 신체의 항산화 시스템, 소화 기능 및 면역 건강을 지원하면서
                                자연스럽고 기분 좋은 에너지를 제공하도록 설계되었습니다. 수퍼 푸드 채소 이외에도 Steel Greens ™에는 최대 흡수를위한 DigeZyme® 소화 효소
                                및 LactoSpore® (Bacillus coagulans MTCC 5856)가 포함되어 있습니다.</div>
                            <div class="number-con">
                                <div class="number">
                                    <div>수량</div>
                                    <select name="selectNumber" id="select">
                                        <option> - [필수] 수량을 선택해 주세요 -</option>
                                        <option value="1">1개</option>
                                        <option value="2">2개</option>
                                        <option value="3">3개</option>
                                        <option value="3">4개</option>
                                        <option value="3">5개</option>
                                        <option value="3">- 최대 구매 수량 5개 -</option>
                                    </select>
                                </div>
                                <div class="min">(최소주문수량 1개 이상)</div>
                            </div>
                            <div class="price">
                                <button type="submit" id="cart-btn" class="submit-btn">ADD TO CART</button>
                                <button type="submit" id="now-btn" class="submit-btn">BUY IT NOW</button>
                            </div>
                        </div>
                    </div>
                    <hr style="border: solid 1px #ccc; margin-top: 50px; margin-bottom: 50px;">

                    <ul class="item-nav">
                        <li>
                            <a href="/market/marketDetail">상품정보</a>
                        </li>
                        <li>
                            <a href="/market/marketReview">Review</a>
                        </li>
                        <li>
                            <a href="/market/marketInquire">상품문의</a>
                        </li>
                    </ul>

                    <hr style="border: solid 1px #ccc; margin-top: 50px; margin-bottom: 50px;">
                    <!-- 상품 상세 -->
                    <div class="item-content">
                        <div><img src="/resources/images/market/test2.jpeg" alt=""></div>
                        <br>
                        <div><img src="/resources/images/market/test2-detail1.jpeg" alt=""></div>
                        <br>
                        <div><img src="/resources/images/market/test2-detail2.jpeg" alt=""></div>
                        <br>
                        <div><img src="/resources/images/market/test2-detail3.jpeg" alt=""></div>
                        <br>
                        <div><img src="/resources/images/market/test2-detail4.jpeg" alt=""></div>
                        <br>
                        <div><img src="/resources/images/market/test2-detail5.jpeg" alt=""></div>
                        <br>
                        <div><img src="/resources/images/market/test2-detail6.jpeg" alt=""></div>
                        <br>
                        <div><img src="/resources/images/market/test2-detail7.jpeg" alt=""></div>
                        <br>
                    </div>

                    <div class="notice">
                        <ul>
                            <li class="title">제품명</li>
                            <li>퍼펙트 파워쉐이크 초코맛(대용량)</li>
                        </ul>
                        <ul>
                            <li class="title">제품유형</li>
                            <li>기타가공품</li>
                        </ul>
                        <ul>
                            <li class="title">내용량</li>
                            <li>2kg</li>
                        </ul>
                        <ul>
                            <li class="title">원료 및 함량</li>
                            <li>[퍼펙트 파워쉐이크 초코맛]분리유청단백분말(미국산), 농축유청단백분말(미국산), 혼합탈지분유(네덜란드산), 코코아분말 6 %(네덜란드산), 분말유크림,
                                혼합제재초콜릿향분말[말토덱스트린, 덱스트린, 프로필렌글리콜, 정제수, 카라멜색소, 합성향료(초콜릿향), 아라비아검, 주정, 코코아분말, 설탕, 잔탄검,
                                고과당], 혼합제재초코렛향분말[덱스트린, 혼합제재(초코렛향베이스(합성향료), 에틸말톨)], 혼합제재밀크향분말[덱스트린, 유당,
                                혼합제재(밀크향키베이스(합성향료), 아라비아검], 비타민미네랄프리믹스[분말비타민A, 분말비타민E, 비타민C, 비타민B6염산염, 비타민B1질산염, 엽산,
                                니코틴산아미드, 비타민B2, 제삼인산칼슘(칼슘), 푸마르산제일철(철분), 산화아연(아연)], 효소처리스테비아,
                                수크랄로스(감미료),아미노산혼합분말(L-트레오닌, 글리신, L-발린, L-이소로이신, L-로이신, L-페닐알라닌, L-히스티딘, L-라이신, L-메티오닌,
                                L-트립토판) 알레르기 유발물질 : 대두, 밀, 우유</li>
                        </ul>
                        <ul>
                            <li class="title">섭취방법</li>
                            <li>1일 1~2회, 1회 (44 g)을 물 또는 우유 200~250 ml에 타서 섭취하십시오.
                                운동 전 또는 운동 후 30분 이내에 섭취하시면 더욱 좋습니다.</li>
                        </ul>
                        <ul>
                            <li class="title">배송정보</li>
                            <li>- 배송 방법 : CJ대한통운 <br>
                                - 배송 지역 : 전국 <br>
                                - 배송 기간 : 2일 ~ 3일(단, 공휴일, 기념일 등 제외) <br>
                                - 배송 안내 : · 당일 오후 1시 주문 건에 한하여 당일 발송되며, 1시 이후에는 주문취소 불가(사전예약, 타임특가 및
                                냉동/신선 제품의 경우 상세페이지 주문 마감시간 확인)· 도서, 산간 오지 등 교통이 불편한 지역은 지역에 따라 2~3일 추가 소요· 추석, 설, 연말연시,
                                접수 물량이 많은 경우에 1~2일 지연될 수 있음· 군부대(사서함)주소의 경우 배송이 불가능할 수 있음
                            </li>
                        </ul>
                    </div>



                </div>


            </section>


            <jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>

            <%-- <script src="/resources/js/main.js"></script> --%>
        </body>

        </html>