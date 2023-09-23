<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"  %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<%-- 구매내역 리스트 --%>
<c:set var="orderList" value="${orderList}" />
<html>
<head>
    <title>결제완료 페이지</title>

    <link rel="stylesheet" href="/resources/css/board/market/Success.css">
    <%-- 헤더 아이콘 --%>
    <link rel="apple-touch-icon" sizes="180x180" href="/resources/images/favicon_io/apple-touch-icon.png">
    <link rel="icon" type="image/png" sizes="32x32" href="/resources/images/favicon_io/favicon-32x32.png">
    <link rel="icon" type="image/png" sizes="16x16" href="/resources/images/favicon_io/favicon-16x16.png">
</head>
<body>
<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
<div class="order-complete-container">
    <div class="order-complete-box">
        <i class="fas fa-check-circle"></i>
<c:forEach var="order" items="${orderList}">
        <h1>${order.memberNickname}님의 주문이 완료되었습니다!</h1>
        <br>
        <br>
        <p>◼︎ 주문 번호 : <span>${order.orderNo}</span></p>
        <p>◼︎ 결제금액 : <span><fmt:formatNumber type="number" value="${order.total}" pattern="#,###원" /></span></p>
        <p>◼︎ 결제수단 : <span>카드결제</span></p>
        <p>◼︎ 배송 요청사항 : <span>${order.delNotes}</span></p>
        <p>◼︎ 배송지 정보 :  <span>${order.delAddr}</span></p>
</c:forEach>
        <br>
        <p class="test">언제나 득근마켓을 이용해주셔서 감사합니다 !</p>
        <p class="test">빠른 시간 내에 주문 상품을 배송하겠습니다 😊</p>
        <br>
        <br>
        <a href="/" class="btn-return-home">홈으로 돌아가기</a>
    </div>
</div>

<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
</body>
</html>
