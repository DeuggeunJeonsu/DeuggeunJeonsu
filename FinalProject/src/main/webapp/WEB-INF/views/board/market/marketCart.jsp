<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <!DOCTYPE html>
        <html>

        <head>
            <meta charset="UTF-8">
            <title>게시판 이름</title>

            <%-- marketReview-style.css 연결 --%>
                <link rel="stylesheet" href="../resources/css/board/market/marketCart-style.css">
                <!-- jQuery -->
                <script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
                <!-- iamport.payment.js -->
                <script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
                <script src="/resources/js/market/payment.js"></script>
                <!-- Font Awesome CDN 추가 -->
                <link rel="stylesheet"
                    href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css"
                    integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8sh+Wy4y5AuWn1C4EyyIbJs6YXvPECJwFPa28H"
                    crossorigin="anonymous">
        </head>

        <body>

            <jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>

            <section id="main-container">
                <div class="img-con">
                    <img src="/resources/images/market/freeD.png" alt="" id="delLogo">
                </div>
                <br>
                <br>
                <br>
                <div class="main-con">
                    <h1 class="board-name">주문하기</h1>
                    <h3>늘 사랑을 주신 득근 전수 회원님께
                        감사의 마음을 담아 무료배송 이벤트를 진행합니다
                    </h3>
                    <h3>(사장님께는 비밀 👀)</h3>
                    <br>
                    <br>
                    <table>
                        <thead>
                            <tr>
                                <th>상품 정보</th>
                                <th>가격</th>
                                <th>수량</th>
                                <th>합계</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>단백질 쉐이크</td>
                                <td>50,000원</td>
                                <td>1</td>
                                <td>50,000원</td>
                            </tr>
                            <tr>
                                <td>단백질 쉐이크</td>
                                <td>50,000원</td>
                                <td>2</td>
                                <td>100,000원</td>

                            </tr>
                            <tr>
                                <td>다크 아이런 케틀벨</td>
                                <td>2,000원</td>
                                <td>5</td>
                                <td>10,000원</td>
                            </tr>
                            <tr>
                                <td>웨이트 중량조끼 5kg </td>
                                <td>26,000원</td>
                                <td>1</td>
                                <td>26,000원</td>
                            </tr>
                            <tr>
                                <td class="total-info">
                                    <p class="text">총 상품 금액</p>
                                    <p class="total-amount">186,000<span>원</span></p>
                                </td>

                                <td class="total-info">
                                    <p class="text">총 배송비</p>
                                    <p class="total-amount">+0<span>원</span></p>
                                </td>

                                <td class="total-info">
                                    <p class="text">결제예정금액</p>
                                    <p class="total-amount">186,000<span>원</span></p>
                                </td>

                                <td><a href="/market/marketOrder" id="paymentBtn">주문하기</a></td>
                            </tr>
                        </tbody>
                    </table>

                </div>


            </section>

            <jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
            
        </body>

        </html>