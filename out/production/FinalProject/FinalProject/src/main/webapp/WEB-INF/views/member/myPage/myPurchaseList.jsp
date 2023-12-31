<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"  %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>구매 내역</title>

    <%-- myPageSideBar-style.css 연결 --%>
    <link rel="stylesheet" href="../resources/css/member/myPage/myPageSideBar-style.css">
    <%-- myPurchaseList-style.css 연결 --%>
    <link rel="stylesheet" href="../resources/css/member/myPage/myPurchaseList-style.css">
    
</head>

<body>
    <%-- header include --%>
	<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
	
	<section id="main-container">

        <!-- 마이페이지 사이드바 include -->
        <jsp:include page="/WEB-INF/views/member/myPage/myPageSideBar.jsp"></jsp:include>

        <div id="right-content-area">
            <div id="title-area">
                <div><h1>구매 내역</h1></div>
                <div>득근 마켓에서 구매하신 물품 내역을 확인할 수 있습니다.</div>
            </div>

            <div id="main-content-area">

                <div>
                    <select id="selectBox">
                        <option>주문 처리 상태</option>
                        <option>결제 대기 중</option>
                        <option>결제 완료</option>
                        <option>배송 완료</option>
                        <option>취소 완료</option>
                        <option>교환 완료</option>
                        <option>반품 완료</option>
                    </select>
                </div>

                <div>
                    <table id="purchaseList">
                        <thead class="theadColor">
                            <tr>
                                <th>주문 일자</th>
                                <th>주문 번호</th>
                                <th>상품명</th>
                                <th>상품 구매 금액</th>
                                <th>주문 처리 상태</th>
                                <th>취소/교환/반품</th>
                                <th>리뷰</th>
                            </tr>
                        </thead>

                        <tbody>
                            <tr>
                                <td>2023.01.01</td>
                                <td>00012354</td>
                                <td>단백질 쉐이크</td>
                                <td>35,000</td>
                                <td>결제 대기 중</td>
                                <td>
                                    <button class="inquiryBtn inquiryBtnColor2">문의하기</button>
                                </td>
                                <td>
                                    <button class="inquiryBtn inquiryBtnColor1">리뷰 작성</button>
                                </td>
                            </tr>
                            <tr>
                                <td>2023.01.01</td>
                                <td>00012354</td>
                                <td>단백질 쉐이크</td>
                                <td>35,000</td>
                                <td class="delivery">배송 완료</td>
                                <td>
                                    <button class="inquiryBtn inquiryBtnColor2">문의글 보기</button>
                                </td>
                                <td>
                                    <button class="inquiryBtn inquiryBtnColor1">리뷰 보기</button>
                                </td>
                            </tr>
                            <tr>
                                <td>2023.01.01</td>
                                <td>00012354</td>
                                <td>단백질 쉐이크</td>
                                <td>35,000</td>
                                <td class="delivery">배송 완료</td>
                                <td>
                                    <button class="inquiryBtn inquiryBtnColor2">문의하기</button>
                                </td>
                                <td>
                                    <button class="inquiryBtn inquiryBtnColor1">리뷰 작성</button>
                                </td>
                            </tr>
                            <tr>
                                <td>2023.01.01</td>
                                <td>00012354</td>
                                <td>단백질 쉐이크</td>
                                <td>35,000</td>
                                <td class="delivery">배송 완료</td>
                                <td>
                                    <button class="inquiryBtn inquiryBtnColor2">문의하기</button>
                                </td>
                                <td>
                                    <button class="inquiryBtn inquiryBtnColor1">리뷰 작성</button>
                                </td>
                            </tr>
                            <tr>
                                <td>2023.01.01</td>
                                <td>00012354</td>
                                <td>단백질 쉐이크</td>
                                <td>35,000</td>
                                <td class="delivery">배송 완료</td>
                                <td>
                                    <button class="inquiryBtn inquiryBtnColor2">문의하기</button>
                                </td>
                                <td>
                                    <button class="inquiryBtn inquiryBtnColor1">리뷰 작성</button>
                                </td>
                            </tr>
                            <tr>
                                <td>2023.01.01</td>
                                <td>00012354</td>
                                <td>단백질 쉐이크</td>
                                <td>35,000</td>
                                <td>결제 대기 중</td>
                                <td>
                                    <button class="inquiryBtn inquiryBtnColor2">문의하기</button>
                                </td>
                                <td>
                                    <button class="inquiryBtn inquiryBtnColor1">리뷰 작성</button>
                                </td>
                            </tr>     
                            <tr>
                                <td>2023.01.01</td>
                                <td>00012354</td>
                                <td>단백질 쉐이크</td>
                                <td>35,000</td>
                                <td>결제 대기 중</td>
                                <td>
                                    <button class="inquiryBtn inquiryBtnColor2">문의하기</button>
                                </td>
                                <td>
                                    <button class="inquiryBtn inquiryBtnColor1">리뷰 작성</button>
                                </td>
                            </tr>  
                            <tr>
                                <td>2023.01.01</td>
                                <td>00012354</td>
                                <td>단백질 쉐이크</td>
                                <td>35,000</td>
                                <td>결제 대기 중</td>
                                <td>
                                    <button class="inquiryBtn inquiryBtnColor2">문의하기</button>
                                </td>
                                <td>
                                    <button class="inquiryBtn inquiryBtnColor1">리뷰 작성</button>
                                </td>
                            </tr>  
                            <tr>
                                <td>2023.01.01</td>
                                <td>00012354</td>
                                <td>단백질 쉐이크</td>
                                <td>35,000</td>
                                <td>결제 대기 중</td>
                                <td>
                                    <button class="inquiryBtn inquiryBtnColor2">문의하기</button>
                                </td>
                                <td>
                                    <button class="inquiryBtn inquiryBtnColor1">리뷰 작성</button>
                                </td>
                            </tr>  
                            <tr>
                                <td>2023.01.01</td>
                                <td>00012354</td>
                                <td>단백질 쉐이크</td>
                                <td>35,000</td>
                                <td>결제 대기 중</td>
                                <td>
                                    <button class="inquiryBtn inquiryBtnColor2">문의하기</button>
                                </td>
                                <td>
                                    <button class="inquiryBtn inquiryBtnColor1">리뷰 작성</button>
                                </td>
                            </tr>                
                            <tr>
                                <td>2023.01.01</td>
                                <td>00012354</td>
                                <td>단백질 쉐이크</td>
                                <td>35,000</td>
                                <td>결제 대기 중</td>
                                <td>
                                    <button class="inquiryBtn inquiryBtnColor2">문의하기</button>
                                </td>
                                <td>
                                    <button class="inquiryBtn inquiryBtnColor1">리뷰 작성</button>
                                </td>
                            </tr>  
                            <tr>
                                <td>2023.01.01</td>
                                <td>00012354</td>
                                <td>단백질 쉐이크</td>
                                <td>35,000</td>
                                <td>결제 대기 중</td>
                                <td>
                                    <button class="inquiryBtn inquiryBtnColor2">문의하기</button>
                                </td>
                                <td>
                                    <button class="inquiryBtn inquiryBtnColor1">리뷰 작성</button>
                                </td>
                            </tr>           

                        </tbody>
                    </table>
                </div>

            </div>
        </div>

	</section>

    <!-- footer include -->
	<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>

    <!-- main.js 연결 -->
	<script src="../resources/js/main.js"></script>

</body>
</html>