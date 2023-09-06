<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <!DOCTYPE html>
        <html>

        <head>
            <meta charset="UTF-8">
            <title>게시판 이름</title>

            <%-- marketReview-style.css 연결 --%>
                <link rel="stylesheet" href="../resources/css/board/market/marketReview-style.css">

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
                            <a href="/market/marketQnA">Q&A</a>
                        </li>
                    </ul>

                    <hr style="border: solid 1px #ccc; margin-top: 50px; margin-bottom: 50px;">

                    <section class="reivew-list">
                        <h1 class="board-name">Review</h1>
                        <h3>득근전수 회원님들의 상품 후기를 확인해보세요 ~ :)</h3>
                        <br>
                        <br>
                        <table>
                            <thead>
                                <tr>
                                    <th>글번호</th>
                                    <th>제목</th>
                                    <th>작성자</th>
                                    <th>작성날짜</th>
                                    <th>조회수</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td>5</td>
                                    <td><a href="#">다섯번째 게시글</a></td>
                                    <td>유저일이지롱</td>
                                    <td>2023-08-31</td>
                                    <td>100</td>
                                </tr>
                                <tr>
                                    <td>4</td>
                                    <td><a href="#">네번째 게시글</a></td>
                                    <td>유저일이지롱</td>
                                    <td>2023-09-01</td>
                                    <td>85</td>
                                </tr>
                                <tr>
                                    <td>3</td>
                                    <td><a href="#">세번째 게시글</a></td>
                                    <td>유저일이지롱</td>
                                    <td>2023-09-01</td>
                                    <td>85</td>
                                </tr>
                                <tr>
                                    <td>2</td>
                                    <td><a href="#">두번째 게시글</a></td>
                                    <td>유저일이지롱</td>
                                    <td>2023-09-01</td>
                                    <td>85</td>
                                </tr>
                                <tr>
                                    <td>1</td>
                                    <td><a href="#">첫번째 게시글</a></td>
                                    <td>유저일이지롱</td>
                                    <td>2023-09-01</td>
                                    <td>85</td>
                                </tr>
                            </tbody>
                        </table>


                        <div class="btn-area">

                            <button id="insertBtn">글쓰기</button>
                            <!-- 로그인 상태일 경우 글쓰기 버튼 노출 -->

                            <!-- <c:if test="${!empty loginMember}"> -->
                            <!-- </c:if> -->

                        </div>

                        <div class="pagination-area">


                            <ul class="pagination">

                                <!-- 첫 페이지로 이동 -->
                                <li><a href="/board/${boardCode}?cp=1${sp}">&lt;&lt;</a></li>

                                <!-- 이전 목록 마지막 번호로 이동 -->
                                <li><a href="/board/${boardCode}?cp=${pagination.prevPage}${sp}">&lt;</a></li>


                                <!-- 특정 페이지로 이동 -->
                                <c:forEach var="i" begin="${pagination.startPage}" end="${pagination.endPage}" step="1">

                                    <c:choose>
                                        <c:when test="${ i == pagination.currentPage}">
                                            <!-- 현재 보고있는 페이지 -->
                                            <li><a class="current">${i}</a></li>
                                        </c:when>

                                        <c:otherwise>
                                            <!-- 현재 페이지를 제외한 나머지 -->
                                            <li><a href="/board/${boardCode}?cp=${i}${sp}">${i}</a></li>

                                        </c:otherwise>
                                    </c:choose>

                                </c:forEach>

                                <!-- 다음 목록 시작 번호로 이동 -->
                                <li><a href="/board/${boardCode}?cp=${pagination.nextPage}${sp}">&gt;</a></li>

                                <!-- 끝 페이지로 이동 -->
                                <li><a href="/board/${boardCode}?cp=${pagination.maxPage}${sp}">&gt;&gt;</a></li>

                            </ul>

                        </div>

                </div>

            </section>


            <jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>

            <script src="/resources/js/main.js"></script>
        </body>

        </html>