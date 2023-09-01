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
                    <hr style="border: solid 3px #ccc; margin-top: 50px; margin-bottom: 50px;">

                    <ul class="item-nav">
                        <li>
                            <a href="">상품정보</a>
                        </li>
                        <li>
                            <a href="">Review</a>
                        </li>
                        <li>
                            <a href="">Q&A</a>
                        </li>
                    </ul>

                    <hr style="border: solid 3px #ccc; margin-top: 50px; margin-bottom: 50px;">
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

                    <!-- <br>
                    <br>

                    <div class="item-detail">
                        
                        <h1>스틸 그린 30서빙(Steel Greens (30 serv))</h1>
                        <div class="text2">
                            <div class="text3">다이어트? 면역력? 이 주스를 마셔봐, 스틸 그린</div>
                            <br>
                            <strong>근피로 회복, 질좋은 수면, 고중량 훈련+다이어트 서포트</strong>
                            <br>
                            <br>
                            다양한 색의 채소를 믹스해 다른 제품보다 다양한 미네랄과 비타민을 얻을 수 있습니다. 채소가루는 즙과는 다릅니다. 먼저 식이섬유가 풍부하고 이 식이섬유는 장내
                            유익균들의 먹이가 되고 장내 유해균을 배출하는데 도움됩니다 이는 장내 환경을 좋게 만들어 세로토닌 생성에 도움이되며 이는 우울증을 해소하고 심심안정에 도움을 주며
                            멜라토닌으로 대사가 가능해 수면에도 긍정적인 영향을 미칩니다. 장내 환경이 좋을 시에는 염증수치의 감소를 기대 가능하며 갑상선 대사가 좋아짐을 경험 가능합니다.
                            <br>
                            <br>
                            장내 유익균의 증가는 소화흡수에 영향을 미쳐 근육 및 피로 회복에 도움이되며, 세로토닌의 대사는 수면회복에 도움을 주고 뇌 신경에 대해 안정을 기여해 고중량 훈련으로
                            인한 신경피로도 회복에 기여를 합니다. 마지막으로 다이어트 시에 갑상선 대사가 떨어지면 다이어트에 어려움을 겪게 되는데 갑상선 호르몬의 일부는 장내에서 대사되기에
                            스틸그린을 섭취하게 될 경우에는 다이어트에도 도움이 됩니다.
                        </div>

                        <div class="text2">
                            <h2>섭취방법</h2>
                            건강 보조 식품으로, 236 ~ 354ml 로 채워진 쉐이커 컵 또는 블렌더에 Steel Greens ™ 1 인분 (1 scoop)을 첨가하십시오.
                            차가운 물 또는 좋아하는 음료 (미각 취향에 맞게 조정)와 잘 혼합하십시오. 하루에 1 회 섭취하거나 건강 관리 전문가의 지시에 따라 섭취하십시오.
                        </div>
                    </div> -->

                
                </div>


            </section>
            <div class="page">
                페이지네이션 영역
            </div>


            <jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>

            <script src="/resources/js/main.js"></script>
        </body>

        </html>