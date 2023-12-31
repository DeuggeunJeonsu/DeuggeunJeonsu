<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"  %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<%-- 구매내역 리스트 --%>
<c:set var="purchaseList" value="${purchaseList}" />
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>구매 내역</title>

    <%-- myPageSideBar-style.css 연결 --%>
    <link rel="stylesheet" href="/resources/css/member/myPage/myPageSideBar-style.css">
    <%-- myPurchaseList-style.css 연결 --%>
    <link rel="stylesheet" href="/resources/css/member/myPage/myPurchaseList-style.css">
    
    <%-- 헤더 아이콘 --%>
    <link rel="apple-touch-icon" sizes="180x180" href="/resources/images/favicon_io/apple-touch-icon.png">
    <link rel="icon" type="image/png" sizes="32x32" href="/resources/images/favicon_io/favicon-32x32.png">
    <link rel="icon" type="image/png" sizes="16x16" href="/resources/images/favicon_io/favicon-16x16.png">


</head>

<body>
    <%-- header include --%>
	<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>

    <c:if test="${!empty param.key}" >
        <c:set var="sp" value="&key=${param.key}"/>
    </c:if>
	
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
                    <select id="selectBox" name="key">
                        <option value="1">주문 처리 상태</option>
                        <option value="2">결제 완료</option>
                        <option value="3">배송 완료</option>
                        <option value="4">취소/교환</option>
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
                                <th>취소/교환/기타</th>
                                <th>리뷰</th>
                            </tr>
                        </thead>
                        <tbody id="purchase-list-tbody">

                            <c:forEach var="item" items="${purchaseList}">
                                <tr>
                                    <td>${item.orderDate}</td>
                                    <td>${item.orderNo}</td>
                                    <td>
                                        <a href="/board/5/detail/${item.productNo}">
                                                ${item.productName}
                                        </a>
                                    </td>

                                    <td><fmt:formatNumber value="${item.total}" pattern="#,###"/>원</td>

                                    <td>
                                        <c:choose>
                                            <c:when test="${item.orderStatus == 'Y' && (item.inquiryType == 0 || item.inquiryType == 3)}">결제 완료</c:when>

                                            <c:when test="${item.orderStatus == 'Y' && item.inquiryType == 1}">교환 접수중</c:when>
                                            <c:when test="${item.orderStatus == 'Y' && item.inquiryType == 2}">취소 접수중</c:when>
                                            <c:when test="${item.orderStatus == 'D'}">배송 완료</c:when>
                                        </c:choose>
                                    </td>

                                    <td>
                                        <button class="inquiryBtn inquiryBtnColor2" data-inquiryType="${item.inquiryType}"
                                                onclick="handleInquiryClick(event, ${item.productNo})">문의 하기</button>
                                    </td>

                                    <td>
                                        <button class="inquiryBtn inquiryBtnColor1"
                                                onclick="checkReview(${item.productNo})">리뷰 작성</button>
                                    </td>

                                </tr>
                                <input type="hidden" value="${item.productNo}" id="productNo" />
                            </c:forEach>
                            <tr>
                                <td>2023-04-04</td>
                                <td>9</td>
                                <td>매너매트</td>
                                <td>99,000원</td>
                                <td>배송 완료</td>
                                <td>
                                    <button class="inquiryBtn inquiryBtnColor2">문의 하기</button>
                                </td>
                                <td>
                                    <button class="inquiryBtn inquiryBtnColor1">리뷰 작성</button>
                                </td>
                            </tr>
                            <tr>
                                <td>2023-03-14</td>
                                <td>8</td>
                                <td>네오프렌 덤벨</td>
                                <td>8,500원</td>
                                <td>배송 완료</td>
                                <td>
                                    <button class="inquiryBtn inquiryBtnColor2">문의 하기</button>
                                </td>
                                <td>
                                    <button class="inquiryBtn inquiryBtnColor1">리뷰 작성</button>
                                </td>
                            </tr>
                            <tr>
                                <td>2023-02-10</td>
                                <td>7</td>
                                <td>L-아르기닌</td>
                                <td>15,000원</td>
                                <td>배송 완료</td>
                                <td>
                                    <button class="inquiryBtn inquiryBtnColor2">문의 하기</button>
                                </td>
                                <td>
                                    <button class="inquiryBtn inquiryBtnColor1">리뷰 작성</button>
                                </td>
                            </tr>
                            <tr>
                                <td>2023-01-16</td>
                                <td>6</td>
                                <td>맥반석 구운란</td>
                                <td>13,000원</td>
                                <td>배송 완료</td>
                                <td>
                                    <button class="inquiryBtn inquiryBtnColor2">문의 하기</button>
                                </td>
                                <td>
                                    <button class="inquiryBtn inquiryBtnColor1">리뷰 작성</button>
                                </td>
                            </tr>
                            <tr>
                                <td>2022-12-13</td>
                                <td>5</td>
                                <td>라텍스 밴드</td>
                                <td>9,000원</td>
                                <td>배송 완료</td>
                                <td>
                                    <button class="inquiryBtn inquiryBtnColor2">문의 하기</button>
                                </td>
                                <td>
                                    <button class="inquiryBtn inquiryBtnColor1">리뷰 작성</button>
                                </td>
                            </tr>
                            <tr>
                                <td>2022-12-13</td>
                                <td>5</td>
                                <td>로메인 샐러드</td>
                                <td>16,000원</td>
                                <td>배송 완료</td>
                                <td>
                                    <button class="inquiryBtn inquiryBtnColor2">문의 하기</button>
                                </td>
                                <td>
                                    <button class="inquiryBtn inquiryBtnColor1">리뷰 작성</button>
                                </td>
                            </tr>
                            <tr>
                                <td>2022-12-31</td>
                                <td>4</td>
                                <td>닭가슴살 어묵바</td>
                                <td>13,900원</td>
                                <td>배송 완료</td>
                                <td>
                                    <button class="inquiryBtn inquiryBtnColor2">문의 하기</button>
                                </td>
                                <td>
                                    <button class="inquiryBtn inquiryBtnColor1">리뷰 작성</button>
                                </td>
                            </tr>
                            <tr>
                                <td>2022-12-13</td>
                                <td>3</td>
                                <td>감자만두닭</td>
                                <td>32,900원</td>
                                <td>배송 완료</td>
                                <td>
                                    <button class="inquiryBtn inquiryBtnColor2">문의 하기</button>
                                </td>
                                <td>
                                    <button class="inquiryBtn inquiryBtnColor1">리뷰 작성</button>
                                </td>
                            </tr>
                            <tr>
                                <td>2022-11-11</td>
                                <td>2</td>
                                <td>요가링</td>
                                <td>4,900원</td>
                                <td>배송 완료</td>
                                <td>
                                    <button class="inquiryBtn inquiryBtnColor2">문의 하기</button>
                                </td>
                                <td>
                                    <button class="inquiryBtn inquiryBtnColor1">리뷰 작성</button>
                                </td>
                            </tr>
                            <tr>
                                <td>2022-10-05</td>
                                <td>1</td>
                                <td>다부진 한끼 도시락</td>
                                <td>23,900원</td>
                                <td>배송 완료</td>
                                <td>
                                    <button class="inquiryBtn inquiryBtnColor2">문의 하기</button>
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
    <script>
        const loginMemberNo = "${loginMember.memberNo}";
    </script>
    <script src="/resources/js/member/myPage/myPurchaseList.js"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</body>
</html>