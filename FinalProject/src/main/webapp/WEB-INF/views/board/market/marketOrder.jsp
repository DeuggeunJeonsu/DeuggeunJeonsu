<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <!DOCTYPE html>
        <html>

        <head>
            <meta charset="UTF-8">
            <title>게시판 이름</title>

            <%-- marketReview-style.css 연결 --%>
                <link rel="stylesheet" href="../resources/css/board/market/marketOrder-style.css">
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
                <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
        </head>

        <body>

            <jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>

            <section id="main-container">
                <div class="main-con">
                    <br>
                    <br>
                    <br>
                    <br>
                    <br>
                    <h1 class="board-name">배송지 정보를 입력해주세요</h1>
                    <br>
                
                    <form action="/delivery_info" method="post">
                        <table>
                            <tbody>
                                <tr>
                                    <th>이름</th>
                                    <td>
                                        <input type="text" class="form_input" name="delName" value="" id="del_name">
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row">휴대폰 번호</th>
                                    <td>
                                        <input type="text" class="form_input" name="delPhone" value="" maxlength="4"
                                            style="width: 55px;"> -
                                        <input type="text" class="form_input" name="delPhone" value="" maxlength="4"
                                            style="width: 55px;"> -
                                        <input type="text" class="form_input" name="delPhone" value="" maxlength="4"
                                            style="width: 55px;">
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row">주소</th>
                                    <td>
                                        <div class="address">
                                            <div class="addr-input">
                                                <input type="text" class="form_input" id="delZip" name="delZip"
                                                    value="" placeholder="우편번호">
                                                <button type="button" class="addr-search"
                                                    onclick="sample6_execDaumPostcode()">우편번호 찾기</button>
                                            </div>
                                        </div>
                                        <input type="text" class="form_input form_address" id="delAddr1"
                                            name="delAddress" value="" placeholder="주소">
                                        <input type="text" class="form_input form_address" id="delAddr2"
                                            name="delAddress" value="" placeholder="상세주소">
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row">배송요청사항</th>
                                    <td>
                                        <textarea class="form_input form_text" name="delNotes" rows="4"
                                            cols="50" placeholder="조심히 안전하게 와주세요 :)"></textarea>
                                    </td>
                                </tr>
                            
                            </tbody>
                        </table>
                    </form>
                    <button onclick="requestPay()" id="paymentBtn" type="submit">결제하기</button>
    
                </div>

                <div class="notice">

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
                    <ul>
                        <li class="title">상품결제정보</li>
                        <li>- 고액 결제의 경우 안전을 위해 카드사에서 확인 전화를 드릴 수도 있습니다.<br>
                            - 확인 과정에서 도난 카드의 사용이나 타인 명의의 주문 등 정상적인 주문이 아니라고 판단될 경우임의로 주문을 보류 또는 취소할 수 있습니다.<br>
                            - 주문 시 입력한 입금자와 실제 입금자의 성명이 반드시 일치해야 하며, 7일 이내로 입금되지 않은 주문은 자동취소 됩니다.
                        </li>
                    </ul>
                </div>

            </section>
            

            <jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
            <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
            <script src="/resources/js/main.js"></script>
            <script src="/resources/js/market/marketOrder.js"></script>
        </body>

        </html>