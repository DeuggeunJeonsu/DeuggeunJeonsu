<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%-- map에 저장된 값들을 각각 변수에 저장 --%>
<c:set var="pagination" value="${map.pagination}" />
<c:set var="marketList" value="${map.marketList}" />
<%--<c:set var="marketList" value="${map2.marketList}" />--%>
<c:forEach items="${boardTypeList}" var="boardType">
    <c:if test="${boardType.BOARD_CODE == boardCode}" >
        <c:set var="boardName" value="${boardType.BOARD_NAME}"/>
    </c:if>
</c:forEach>

        <!DOCTYPE html>
        <html>
        <head>
            <meta charset="UTF-8">
            <title>게시판 이름</title>

            <%-- marketList-style.css 연결 --%>
                <link rel="stylesheet" href="/resources/css/board/market/marketList-style.css">

                <!-- Font Awesome CDN 추가 -->
                <link rel="stylesheet"
                    href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css"
                    integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8sh+Wy4y5AuWn1C4EyyIbJs6YXvPECJwFPa28H"
                    crossorigin="anonymous">
                
                <link rel="apple-touch-icon" sizes="180x180" href="/resources/images/favicon_io/apple-touch-icon.png">
                <link rel="icon" type="image/png" sizes="32x32" href="/resources/images/favicon_io/favicon-32x32.png">
                <link rel="icon" type="image/png" sizes="16x16" href="/resources/images/favicon_io/favicon-16x16.png">
                <link rel="manifest" href="/resources/images/favicon_io/site.webmanifest">
                <link rel="icon" href="/resources/images/favicon_io/favicon.ico" type="image/x-icon">

        </head>

        <body>

            <jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>


            <%-- 검색을 진행한 경우 파라미터(key, query)를 쿼리스트링 형태로 저장한 변수를 선언 --%>
            <c:if test="${!empty param.keyword}">
                <c:set var="sp" value="&query=${param.keyword}"/>
            </c:if>

            <div class="place"></div>
            <section id="main-container">
                <div id="title-area">
                    <div class="board-title">득근 마켓</div>
                    <div>
                        <h3>건강한 삶을 지향하는 득근전수 회원님들을 위한 마켓입니다 :)</h3>
                    </div>
                </div>
                <div id="search-area">

                    <form action="/board/${boardCode}/list" method="GET">
                        <div class="search-place">
                            <input type="text" id="market-search" name="keyword" placeholder="찾으시는 제품을 검색해보세요" value="${param.keyword}">
                            <button id="search-button"><i class="fas fa-search"></i></button>
                        </div>
                    </form>

                    <div id="sort-btn-area">
                        <select id="type" name="sort">
                            <option value="n">신상품</option>
                            <option value="l">낮은가격</option>
                            <option value="h">높은가격</option>
                            <option value="b">사용후기</option>
                        </select>
                    </div>
                </div>

                <c:choose>
                    <c:when test="${empty marketList}">
<%--                            <h1 id="list-area2">"${param.keyword}" 게시글이 존재하지 않습니다.</h1>--%>
                            <div class="box">
                                <br>
                                <br>
                                <br>
                                <br>
                                <br>
                                <br>
                                <br>
                                <br>
                                <div class="pull">
                                    <svg width="120" height="120" viewBox="0 0 120 120" fill="none" xmlns="http://www.w3.org/2000/svg"><g opacity="0.4"><path d="M30.4043 52.5843C27.4309 52.6744 25.8992 52.7645 23.7367 54.2962C21.4842 55.7378 25.2684 57.0894 19.4118 58.6211C6.43714 62.1351 2.11224 71.3255 6.88765 72.4968C10.762 73.3978 15.2671 72.9473 20.3128 74.2087C23.4664 74.9296 26.1695 76.2811 28.8725 77.7227C32.4766 79.705 37.4322 80.4258 41.8472 79.5247C44.4602 78.9841 46.8028 77.993 49.4158 77.6326C55.4526 76.6415 61.7597 78.8039 67.9768 78.6237C70.9501 78.5336 73.8334 77.9029 76.3563 76.8217C78.789 75.7405 80.9515 73.3978 83.6545 72.7671C87.619 71.9562 92.2142 73.9384 95.6381 72.3166C100.774 69.8838 98.0708 63.5767 95.0975 59.9726C86.718 49.701 74.0136 51.1426 67.1659 51.503C53.11 52.314 44.0097 55.4675 30.4043 52.5843Z" fill="#ABABAB"></path><path d="M44.5502 25.9141C11.5729 27.7161 11.4828 63.7569 16.979 66.8204C25.5387 71.5958 27.6111 64.3876 32.0261 64.6579C33.9182 64.748 35.9905 66.0996 36.4411 67.7214C36.9817 69.6136 38.2431 71.3255 39.955 72.3166C41.667 73.3077 43.7393 73.1275 45.6314 72.5869C66.1747 66.2798 74.8245 62.2252 79.0593 62.946C85.907 64.1173 89.3309 62.7658 88.4299 55.9181C87.8893 52.0437 80.7712 23.9319 44.5502 25.9141Z" fill="#D0D0D0"></path><path d="M36.1116 67.7668L36.1118 67.7668L36.108 67.7546C35.8795 67.012 35.2542 66.3657 34.5381 65.9045C33.8132 65.4376 32.9215 65.1115 32.0585 65.06C30.5983 64.9571 29.2907 65.7918 28.0495 66.678L27.981 66.7229C26.6855 67.572 25.3451 68.4505 23.636 68.7612C21.9157 69.074 19.7583 68.8182 16.8631 67.1952L16.8625 67.1949C16.2311 66.842 15.6531 66.1204 15.1791 65.0351C14.7085 63.9575 14.3628 62.5717 14.164 60.9698C13.7665 57.7675 13.964 53.7716 14.8536 49.8121C15.6545 46.3423 17.565 40.5755 22.0274 35.5374C26.4776 30.5129 33.4929 26.1812 44.5763 25.6025L44.5776 25.6025C64.145 24.5303 75.1848 32.0486 81.3479 39.83C84.4379 43.7314 86.3123 47.713 87.4138 50.742C87.9643 52.2559 88.3209 53.5296 88.5394 54.4332C88.6487 54.8849 88.7233 55.2435 88.7702 55.4925C88.7938 55.6171 88.8102 55.7133 88.8205 55.7792C88.8227 55.7938 88.8247 55.8066 88.8263 55.8176C88.8283 55.8314 88.8298 55.8425 88.8309 55.851V55.8625L88.8357 55.8968C89.275 59.0603 88.7315 61.0328 87.4504 62.3174C85.9258 63.7575 83.4463 64.1611 78.9677 63.355L78.967 63.3549C77.5838 63.1078 75.7061 63.4099 73.1946 64.0969C70.6647 64.7889 67.4051 65.8983 63.2214 67.3379C62.4216 67.6045 61.5869 67.8845 60.7161 68.1767C56.5872 69.562 51.6482 71.2191 45.7905 72.9992C45.6408 73.0223 45.495 73.0452 45.3528 73.0675C44.3763 73.2207 43.5627 73.3484 42.7482 73.3484C41.5592 73.3484 40.5708 73.0941 39.7618 72.6087C38.068 71.5924 36.7075 69.8949 36.1116 67.7668ZM15.6812 49.9478C14.7223 54.0573 14.6057 57.8556 14.9623 60.7656C15.1404 62.2194 15.4384 63.4655 15.8172 64.4237C16.185 65.354 16.6668 66.1104 17.2775 66.447C19.8674 67.8806 21.8524 68.2161 23.5272 67.9329C25.1833 67.6528 26.4623 66.7753 27.6254 65.9701L27.6254 65.9701L27.6314 65.9659C28.8908 65.0663 30.2171 64.257 31.7558 64.257H31.7563H31.7568H31.7573H31.7579H31.7584H31.7589H31.7595H31.76H31.7605H31.761H31.7616H31.7621H31.7626H31.7632H31.7637H31.7642H31.7647H31.7653H31.7658H31.7663H31.7669H31.7674H31.7679H31.7684H31.769H31.7695H31.77H31.7706H31.7711H31.7716H31.7722H31.7727H31.7732H31.7737H31.7743H31.7748H31.7753H31.7759H31.7764H31.7769H31.7775H31.778H31.7785H31.7791H31.7796H31.7801H31.7806H31.7812H31.7817H31.7822H31.7828H31.7833H31.7838H31.7844H31.7849H31.7854H31.786H31.7865H31.7871H31.7876H31.7881H31.7887H31.7892H31.7897H31.7903H31.7908H31.7913H31.7919H31.7924H31.793H31.7935H31.794H31.7946H31.7951H31.7956H31.7962H31.7967H31.7973H31.7978H31.7983H31.7989H31.7994H31.8H31.8005H31.8011H31.8016H31.8021H31.8027H31.8032H31.8038H31.8043H31.8049H31.8054H31.806H31.8065H31.807H31.8076H31.8081H31.8087H31.8092H31.8098H31.8103H31.8109H31.8114H31.812H31.8125H31.8131H31.8136H31.8142H31.8147H31.8153H31.8158H31.8164H31.8169H31.8175H31.8181H31.8186H31.8192H31.8197H31.8203H31.8208H31.8214H31.822H31.8225H31.8231H31.8236H31.8242H31.8247H31.8253H31.8259H31.8264H31.827H31.8276H31.8281H31.8287H31.8293H31.8298H31.8304H31.831H31.8315H31.8321H31.8327H31.8332H31.8338H31.8344H31.8349H31.8355H31.8361H31.8366H31.8372H31.8378H31.8384H31.8389H31.8395H31.8401H31.8407H31.8412H31.8418H31.8424H31.843H31.8436H31.8441H31.8447H31.8453H31.8459H31.8465H31.8471H31.8476H31.8482H31.8488H31.8494H31.85H31.8506H31.8512H31.8518H31.8523H31.8529H31.8535H31.8541H31.8547H31.8553H31.8559H31.8565H31.8571H31.8577H31.8583H31.8589H31.8595H31.8601H31.8607H31.8613H31.8619H31.8625H31.8631H31.8637H31.8643H31.8649H31.8655H31.8661H31.8667H31.8673H31.8679H31.8686H31.8692H31.8698H31.8704H31.871H31.8716H31.8722H31.8728H31.8735H31.8741H31.8747H31.8753H31.8759H31.8766H31.8772H31.8778H31.8784H31.8791H31.8797H31.8803H31.8809H31.8816H31.8822H31.8828H31.8835H31.8841H31.8847H31.8854H31.886H31.8866H31.8873H31.8879H31.8885H31.8892H31.8898H31.8905H31.8911H31.8918H31.8924H31.893H31.8937H31.8943H31.895H31.8956H31.8963H31.8969H31.8976H31.8982H31.8989H31.8995H31.9002H31.9009H31.9015H31.9022H31.9028H31.9035H31.9042H31.9048H31.9055H31.9062H31.9068H31.9075H31.9082H31.9088H31.9095H31.9102H31.9108H31.9115H31.9122H31.9129H31.9136H31.9142H31.9149H31.9156H31.9163H31.917H31.9176H31.9183H31.919H31.9197H31.9204H31.9211H31.9218H31.9225H31.9232H31.9238H31.9245H31.9252H31.9259H31.9266H31.9273H31.928H31.9287H31.9294H31.9301H31.9309H31.9316H31.9323H31.933H31.9337H31.9344H31.9351H31.9358H31.9365H31.9373H31.938H31.9387H31.9394H31.9401H31.9409H31.9416H31.9423H31.943H31.9438H31.9445H31.9452H31.946H31.9467H31.9474H31.9482H31.9489H31.9496H31.9504H31.9511H31.9519H31.9526H31.9534H31.9541H31.9549H31.9556H31.9564H31.9571H31.9579H31.9586H31.9594H31.9601H31.9609H31.9616H31.9624H31.9632H31.9639H31.9647H31.9655H31.9662H31.967H31.9678H31.9686H31.9693H31.9701H31.9709H31.9717H31.9724H31.9732H31.974H31.9748H31.9756H31.9764H31.9771H31.9779H31.9787H31.9795H31.9803H31.9811H31.9819H31.9827H31.9835H31.9843H31.9851H31.9859H31.9867H31.9875H31.9883H31.9891H31.99H31.9908H31.9916H31.9924H31.9932H31.994H31.9949H31.9957H31.9965H31.9973H31.9982H31.999H31.9998H32.0006H32.0015H32.0023H32.0032H32.004H32.0048H32.0057H32.0065H32.0074H32.0082H32.0091H32.0099H32.0108H32.0116H32.0125H32.0133H32.0142H32.015H32.0159H32.0168H32.0176H32.0185H32.0194H32.0202H32.0211H32.022H32.0228H32.0237H32.0246H32.0255H32.0264H32.0272H32.0281H32.029H32.0299H32.0308H32.0317H32.0326H32.0335H32.0344H32.0353H32.0362H32.0371H32.038H32.0389H32.0398H32.0407H32.0416H32.0425H32.0434H32.0443H32.0452H32.0462H32.0471H32.048H32.0489H32.0499H32.0508H32.0517H32.0526H32.0536H32.0545H32.0554H32.0564H32.0573H32.0583H32.0592H32.0602H32.0611H32.0621H32.063H32.064H32.0649H32.0659H32.0668H32.0678H32.0688H32.0697H32.0707H32.0717H32.0726H32.0736H32.0746H32.0755H32.0765H32.0775H32.0785H32.0795H32.0805H32.0814H32.0824H32.0834H32.0844H32.0854H32.0864H32.0874H32.0884H32.0894H32.0904H32.0914H32.0924H32.0934H32.0944H32.0955H32.0965H32.0965C33.1649 64.343 34.2437 64.7575 35.1175 65.3712C36.0007 65.9916 36.6315 66.784 36.8613 67.5885L36.8613 67.5885L36.8632 67.5948C37.4346 69.4997 38.5879 71.0564 40.1589 71.9407C41.5806 72.7524 43.3566 72.8187 45.5067 72.1643C51.3944 70.3756 56.36 68.7096 60.4973 67.3215C61.3676 67.0295 62.2012 66.7498 62.9991 66.4839C63.1644 66.4287 63.3283 66.3741 63.4906 66.32C67.7128 64.9123 70.9001 63.8497 73.3974 63.1931C75.9988 62.5091 77.7772 62.2876 79.149 62.5368C81.1087 62.9013 82.7151 63.0223 83.998 62.8916C85.282 62.7608 86.2863 62.3728 86.9814 61.6778C88.142 60.5172 88.4794 58.6029 88.1163 55.9544C88.114 55.9289 88.111 55.9089 88.1104 55.905C88.1071 55.8806 88.1024 55.85 88.0965 55.8142C88.0847 55.7422 88.0671 55.6429 88.0429 55.5185C87.9944 55.2696 87.919 54.9165 87.81 54.475C87.5919 53.5919 87.2385 52.3524 86.6957 50.881C85.6106 47.9393 83.7652 44.0624 80.7226 40.2548C74.6715 32.6825 63.9258 25.4384 45.1807 26.2925L45.1379 25.8644L44.6403 25.9141L44.1428 25.9639L44.1812 26.3478C33.758 27.0471 27.0283 31.2177 22.7096 36.0789C18.3319 41.0068 16.4577 46.6138 15.6812 49.9478Z" fill="#8A8A8A" stroke="#8A8A8A"></path><path d="M28.0616 69.7037C27.7012 69.974 24.5476 72.4068 24.1872 72.7672C23.8268 73.0375 24.007 68.7126 24.007 66.0997C24.007 63.4867 26.1694 63.5768 26.1694 60.9638C26.1694 58.3509 24.0971 58.3509 24.0971 55.828C24.0971 53.2151 26.1694 53.2151 26.1694 50.6021C26.1694 47.9892 25.5387 46.5475 25.8991 46.5475C26.2595 46.5475 27.521 45.4663 27.7913 45.4663C28.1517 45.4663 29.5933 47.7189 29.5933 50.0615C29.5933 52.3141 27.521 52.3141 27.521 54.6567C27.521 56.9093 29.5933 56.9093 29.5933 59.2519C29.5933 61.5946 27.1606 61.7748 27.6111 64.0273C27.9715 66.37 28.422 69.4334 28.0616 69.7037Z" fill="#ABABAB"></path><path d="M39.2342 73.2176C38.8738 73.578 36.4411 74.2989 36.0806 74.6593C35.7202 75.0197 34.3687 71.6859 34.3687 68.6224C34.3687 65.559 37.3421 66.0996 37.3421 63.0361C37.3421 59.9726 35.2697 59.9726 35.2697 56.9993C35.2697 53.9358 37.3421 53.9358 37.3421 50.9624C37.3421 47.9891 36.6213 45.286 36.9817 45.286C37.3421 45.286 38.6035 44.8355 38.8738 44.8355C39.2342 44.8355 40.6758 47.5386 40.6758 50.1515C40.6758 52.8546 38.6035 52.8546 38.6035 55.4675C38.6035 58.1706 40.6758 58.1706 40.6758 60.7836C40.6758 63.4866 38.2431 63.7569 38.6936 66.3699C39.054 69.4334 39.5045 72.9473 39.2342 73.2176Z" fill="#ABABAB"></path><path d="M25.9892 46.5475C25.5387 46.5475 25.0882 46.1871 25.0882 45.6464C25.0882 45.1058 25.4486 44.7454 25.9892 44.7454C25.9892 44.7454 27.3408 44.6553 28.422 44.1147C28.8725 43.8444 29.4131 44.0246 29.6834 44.385C29.9537 44.8355 29.7735 45.3761 29.4131 45.6464C27.7913 46.5475 26.0793 46.5475 25.9892 46.5475Z" fill="#8A8A8A"></path><path d="M39.955 46.5474C39.8649 46.5474 39.8649 46.5474 39.955 46.5474C39.8649 46.5474 38.0629 46.4573 36.6213 45.6464C36.1708 45.3761 36.0807 44.8355 36.351 44.385C36.6213 43.9345 37.1619 43.8444 37.6124 44.1147C38.6035 44.7454 39.955 44.7454 40.0451 44.7454C40.5858 44.7454 40.9462 45.1959 40.9462 45.6464C40.766 46.187 40.4055 46.5474 39.955 46.5474Z" fill="#8A8A8A"></path><path d="M33.3776 50.3318C31.6657 50.3318 30.4042 49.3406 29.8636 48.6198C29.5933 48.2594 29.6834 47.6287 30.0438 47.3584C30.4042 47.0881 31.0349 47.1782 31.3052 47.5386C31.4854 47.7188 32.6568 49.2505 35.0895 47.9891C35.54 47.7188 36.0806 47.899 36.2609 48.3495C36.5312 48.8 36.351 49.3406 35.9004 49.5208C34.9994 50.1516 34.1885 50.3318 33.3776 50.3318Z" fill="#8A8A8A"></path><path d="M49.1276 55.8006C49.1384 55.7308 49.1473 55.6724 49.155 55.6245L49.1949 55.5846V55.3774C49.1949 55.3154 49.2301 55.2216 49.317 55.1455C49.3978 55.0749 49.4978 55.0421 49.6039 55.0597L49.6447 55.0665H49.6861C49.8967 55.0665 50.0466 55.2186 50.0038 55.4754L49.997 55.5163V55.5576C49.997 55.5566 49.997 55.5567 49.9969 55.5581C49.9968 55.5617 49.9963 55.5733 49.9948 55.5957C49.9929 55.624 49.9898 55.6626 49.9853 55.7114C49.9764 55.8089 49.9621 55.9426 49.9415 56.1085C49.9002 56.4402 49.8337 56.8972 49.7334 57.4457C49.5327 58.5437 49.1977 60.0021 48.6616 61.5552C47.5928 64.6513 45.7583 68.0266 42.6907 69.7543C42.5876 69.7678 42.4995 69.7921 42.4419 69.8086C42.419 69.8151 42.4027 69.8199 42.3895 69.8238C42.3763 69.8277 42.3662 69.8306 42.356 69.8335C42.209 69.8248 42.0954 69.7551 42.0002 69.6172C41.902 69.4426 41.9459 69.2045 42.1873 69.0556C45.2389 67.3812 46.9543 63.9377 47.9197 61.0076C48.4074 59.5272 48.7136 58.1472 48.9034 57.1336C48.9984 56.6263 49.0645 56.21 49.1094 55.9194C49.116 55.8766 49.122 55.8371 49.1276 55.8006ZM42.3329 69.8393C42.3329 69.8392 42.3342 69.8389 42.3366 69.8385C42.334 69.8391 42.3328 69.8393 42.3329 69.8393Z" fill="#8A8A8A" stroke="#8A8A8A"></path><path d="M44.6404 72.0463C44.3701 72.7671 43.5591 73.1275 42.8383 72.9473C42.568 72.8572 42.3878 72.677 42.2076 72.4968C41.8472 72.8572 41.3066 73.0374 40.766 72.8572C40.2254 72.677 39.865 72.2265 39.865 71.6859C39.5946 71.776 39.3243 71.776 39.1441 71.6859C38.4233 71.4156 38.0629 70.6047 38.2431 69.8839C38.2431 69.8839 38.6035 68.8026 39.6847 68.3521C39.6847 68.3521 39.7748 68.3521 39.7748 68.262C40.4056 67.9917 41.3967 67.9917 42.2977 68.3521C43.1987 68.7125 43.9195 69.2531 44.2799 69.8839C44.2799 69.8839 44.28 69.974 44.3701 69.974C45.0008 70.875 44.6404 72.0463 44.6404 72.0463Z" fill="#E2E2E2"></path><path d="M42.5735 67.7977L42.5599 67.7923L42.5459 67.7876C41.9733 67.5968 41.4673 67.4917 40.9462 67.4917C40.6931 67.4917 40.4671 67.5168 40.2691 67.5388L40.2602 67.5398C40.055 67.5626 39.8784 67.5818 39.6848 67.5818H39.1848V67.8118C38.6502 68.0886 38.2877 68.488 38.0568 68.8228C37.9256 69.0131 37.8334 69.1873 37.7733 69.3159C37.7431 69.3804 37.7207 69.4341 37.7053 69.4734C37.6975 69.493 37.6915 69.5092 37.6871 69.5213L37.6817 69.5365L37.6799 69.5418L37.6792 69.5439L37.6789 69.5447L37.6788 69.5451C37.6787 69.5453 37.6787 69.5455 38.153 69.7036L37.6787 69.5455L37.6726 69.5637L37.6679 69.5823C37.4355 70.5121 37.8844 71.5859 38.854 71.9644C38.9679 72.0195 39.0769 72.0577 39.1971 72.0777C39.2847 72.0923 39.3695 72.0951 39.4403 72.0957C39.6069 72.629 40.0346 73.0394 40.5744 73.2299C40.6853 73.2828 40.7918 73.3196 40.909 73.3391C41.0185 73.3574 41.1235 73.3573 41.2024 73.3572C41.2072 73.3572 41.2119 73.3572 41.2165 73.3572C41.568 73.3572 41.9006 73.2413 42.1843 73.062C42.3114 73.1602 42.4634 73.2539 42.6458 73.3196C42.7571 73.3727 42.8638 73.4096 42.9814 73.4292C43.0908 73.4475 43.1958 73.4474 43.2747 73.4473C43.2795 73.4473 43.2842 73.4473 43.2888 73.4473C44.104 73.4473 44.8572 72.9769 45.1147 72.2044L45.1148 72.2044L45.1182 72.1933L44.6404 72.0463C45.1182 72.1933 45.1183 72.1931 45.1183 72.193L45.1185 72.1926L45.1187 72.1919L45.1193 72.19L45.1208 72.1849L45.1252 72.1696C45.1287 72.1572 45.1334 72.1403 45.1388 72.1194C45.1496 72.0776 45.1637 72.0191 45.1783 71.9469C45.2074 71.8029 45.2394 71.601 45.2523 71.3637C45.2775 70.8958 45.2303 70.2515 44.8991 69.6444L44.757 69.3838H44.7042C44.2478 68.6973 43.4661 68.1548 42.5735 67.7977ZM39.4639 66.9599H39.5107L39.6001 66.9242C39.9807 66.7719 40.4563 66.6896 40.9462 66.6896C41.5151 66.6896 42.1286 66.7679 42.8313 67.2364L42.8962 67.2797L42.9713 67.3011C44.1088 67.6261 45.0088 68.3601 45.5823 69.1794L45.6074 69.2153L45.6383 69.2462L45.6451 69.253C45.6521 69.2672 45.6596 69.2807 45.6673 69.2936C45.6689 69.2962 45.6705 69.2988 45.6721 69.3014V69.663H45.9121C46.23 70.3171 46.2977 70.9824 46.2697 71.5249C46.2545 71.8183 46.2115 72.0704 46.1681 72.2565C46.1293 72.4226 46.0949 72.5166 46.0868 72.5388C46.0852 72.5432 46.0846 72.5448 46.0853 72.5435L46.0718 72.5705L46.0616 72.5989C45.6815 73.6632 44.6073 74.4295 43.469 74.4295C43.2082 74.4295 42.9379 74.3703 42.613 74.2901C42.5471 74.246 42.4817 74.216 42.422 74.1961C42.3736 74.18 42.3299 74.1708 42.2938 74.1657C42.2757 74.1631 42.2593 74.1615 42.2449 74.1605C42.2377 74.16 42.231 74.1597 42.2248 74.1595L42.2158 74.1593L42.2116 74.1592L42.2096 74.1592L42.2086 74.1592L42.2081 74.1592C42.2078 74.1592 42.2076 74.1592 42.2076 74.6592L42.2076 74.1592L42.1265 74.1592L42.0495 74.1849C41.8717 74.2442 41.6002 74.2493 41.3066 74.2493C41.0288 74.2493 40.7402 74.1822 40.3863 74.0939C39.8222 73.8473 39.3903 73.5415 39.1097 73.1204L39.0822 73.0792L39.0472 73.0442L39.043 73.04C39.0245 73.0215 38.9989 72.9959 38.9746 72.9741C38.9474 72.9496 38.8973 72.9068 38.8271 72.8717C38.7484 72.8324 38.6749 72.8174 38.6167 72.8116C38.6115 72.8111 38.6063 72.8106 38.6012 72.8102C37.2347 72.3417 36.5569 70.8822 36.9986 69.4339C37.0053 69.4191 37.0129 69.4023 37.0213 69.3836C37.204 68.9767 37.7872 67.6781 39.158 67.101L39.4639 66.9721V66.9599Z" fill="#8A8A8A" stroke="#8A8A8A"></path><path d="M21.3327 59.1584C21.3327 59.1584 18.8218 61.8349 18.556 67.1877" stroke="#8A8A8A" stroke-width="2" stroke-miterlimit="10" stroke-linecap="round"></path><path d="M19.8115 71.6922C19.5732 71.6922 19.335 71.6593 19.1059 71.5934C18.9684 71.5522 18.8401 71.5028 18.7118 71.4452C18.4002 71.5852 18.052 71.6593 17.6946 71.6593C17.4563 71.6593 17.2272 71.6263 16.9981 71.5605C16.43 71.3958 15.9534 71.0417 15.6694 70.5805C15.5227 70.564 15.3853 70.5393 15.2478 70.4981C14.0198 70.1523 13.3325 68.9664 13.7174 67.8629C13.7632 67.7229 14.2398 66.4712 15.6419 65.8865L15.761 65.8371C15.7793 65.8288 15.8435 65.8041 15.8618 65.7959C15.8893 65.7877 15.9168 65.7794 15.9351 65.7712C16.3658 65.6312 16.8607 65.5571 17.383 65.5571C17.9237 65.5571 18.4644 65.6312 19.0051 65.7877C20.0772 66.0924 20.9936 66.6606 21.5343 67.3606C21.5526 67.3853 21.5801 67.41 21.5985 67.4347C21.6168 67.4594 21.6901 67.5829 21.7084 67.6076C22.4874 68.8017 22.0842 70.0699 22.0292 70.2099C21.7359 71.1075 20.8379 71.6922 19.8115 71.6922Z" fill="#E2E2E2"></path><path d="M18.8752 66.1053L18.875 66.1053C18.3626 65.9608 17.8587 65.8971 17.3922 65.8971C16.9271 65.8971 16.4819 65.9586 16.0916 66.0834C16.0467 66.0898 16.01 66.101 15.9837 66.1108C15.9477 66.1241 15.9203 66.1388 15.9123 66.1431L15.912 66.1433C15.9112 66.1438 15.9104 66.1442 15.9096 66.1446C15.8849 66.1561 15.864 66.1668 15.8509 66.1736L15.8488 66.1746C15.8364 66.181 15.8304 66.184 15.8261 66.1861C15.1856 66.4542 14.761 66.8932 14.4998 67.2555C14.368 67.4382 14.2748 67.6054 14.2138 67.7289C14.1831 67.7909 14.1603 67.8425 14.1445 67.8804C14.1366 67.8994 14.1304 67.915 14.1258 67.9268L14.1202 67.9416L14.1183 67.9468L14.1176 67.9489L14.1173 67.9497L14.1171 67.9501C14.1171 67.9503 14.117 67.9505 14.588 68.1182L14.1169 67.9505L14.1145 67.9576C13.781 68.9407 14.3984 69.9219 15.3825 70.204C15.5707 70.26 15.7545 70.2813 15.9299 70.2817C16.1507 70.7479 16.5829 71.1092 17.1227 71.266C17.3156 71.3235 17.5113 71.3441 17.6854 71.3441C18.056 71.3441 18.4116 71.244 18.7151 71.0659C18.8682 71.1654 19.0417 71.2464 19.2369 71.3009C19.4331 71.3559 19.6257 71.377 19.8023 71.377C20.5885 71.377 21.3571 70.9167 21.6299 70.1463L21.6309 70.1434L21.1586 69.9794C21.6309 70.1434 21.631 70.1432 21.6311 70.143L21.6312 70.1426L21.6315 70.1417L21.6322 70.1397L21.634 70.1344L21.6389 70.1193C21.6427 70.1073 21.6476 70.0912 21.6533 70.0716C21.6646 70.0322 21.679 69.9779 21.6936 69.9109C21.7227 69.7776 21.7536 69.5909 21.7624 69.3704C21.7799 68.9354 21.712 68.3425 21.3477 67.7759C21.3348 67.7538 21.3231 67.7354 21.3161 67.7244L21.3148 67.7223C21.3088 67.7129 21.3059 67.7082 21.3042 67.7055C21.3025 67.7019 21.3006 67.6981 21.2986 67.6941C21.2919 67.6808 21.2828 67.6641 21.2706 67.6453L21.2617 67.6292L21.2565 67.6246C21.2517 67.6178 21.2464 67.6109 21.2408 67.6038C20.7636 66.955 19.9101 66.3976 18.8752 66.1053ZM15.619 65.5337C15.6407 65.5247 15.6482 65.5223 15.6482 65.5223L15.6698 65.5168L15.6886 65.51C15.6899 65.5097 15.6969 65.5078 15.7151 65.5033C15.7164 65.503 15.7179 65.5026 15.7195 65.5023C15.7392 65.4974 15.7795 65.4876 15.8223 65.4733C16.2953 65.3326 16.8391 65.2501 17.3922 65.2501C17.9806 65.2501 18.5678 65.3266 19.1458 65.487C20.3041 65.8109 21.2858 66.4286 21.8666 67.1608L21.8927 67.1938L21.9241 67.2219L21.9263 67.2241L21.9267 67.2245C21.9269 67.2246 21.929 67.2272 21.9341 67.2347L21.9456 67.252L21.9585 67.2682C21.9745 67.2883 21.9811 67.299 21.9991 67.3281C22.0083 67.3428 22.0203 67.3623 22.038 67.3901L22.0553 67.4173L22.0723 67.4377L22.0765 67.4447L22.0871 67.4637L22.0942 67.4765L22.1021 67.4889C22.9268 68.7858 22.4972 70.1559 22.4468 70.2984L22.4463 70.2996C22.0947 71.3015 21.0564 72.0158 19.8115 72.0158C19.5146 72.0158 19.2399 71.98 18.9668 71.9028L18.9434 71.8962L18.9215 71.8923C18.9203 71.892 18.9174 71.8912 18.9122 71.8896C18.9006 71.8859 18.8872 71.8812 18.8626 71.8723L18.7118 71.8181L18.5576 71.8617C18.2791 71.9403 17.9857 71.9828 17.6946 71.9828C17.4054 71.9828 17.1232 71.9467 16.8628 71.871L16.8628 71.8709L16.8591 71.8699C16.3147 71.7161 15.8396 71.4009 15.4988 71.0041L15.4128 70.904L15.2887 70.8594C15.2401 70.8419 15.1919 70.8302 15.1696 70.8248C15.168 70.8244 15.1665 70.824 15.1652 70.8237C15.1471 70.8193 15.1401 70.8174 15.1387 70.817L15.1258 70.8124L15.1093 70.8077C13.6287 70.3879 12.888 69.008 13.3186 67.7815L13.3222 67.7714L13.3253 67.7611C13.3253 67.7612 13.3259 67.759 13.3275 67.7544L13.3339 67.7362C13.3394 67.7209 13.3472 67.7004 13.3574 67.6752C13.3778 67.6247 13.4073 67.5572 13.4469 67.477C13.5263 67.3163 13.6448 67.1076 13.8103 66.8836C14.1413 66.4356 14.653 65.9356 15.4104 65.6243L15.4451 65.61L15.4727 65.5935C15.4729 65.5934 15.4731 65.5933 15.4734 65.5932C15.4778 65.5912 15.4862 65.5877 15.4994 65.5829L15.4995 65.5831L15.51 65.579C15.5342 65.5697 15.5565 65.5603 15.5741 65.5528C15.5819 65.5495 15.5883 65.5468 15.5939 65.5444C15.603 65.5405 15.6103 65.5374 15.619 65.5337Z" fill="#8A8A8A" stroke="#8A8A8A"></path></g></svg>
                                    <div class="pull-text">"${param.keyword}" 상품이 존재하지 않습니다.</div>
                                </div>
                            </div>
                        <br>
                        <br>
                    </c:when>
                    <c:otherwise>
                        <div id="list-area" class="font-weight">
                            <c:forEach items="${marketList}" var="market">
                                <div class="thumbnail">
                                    <div>
                                        <a href="/board/${boardCode}/detail/${market.productNo}">
                                            <img src="${market.productImg}">
                                        </a>
                                    </div>
                                    <div class="list-content">
                                        <div class="title">
                                            <a href="/board/${boardCode}/detail/${market.productNo}?cp=${pagination.currentPage}${sp}">
                                                    ${market.productTitle}
                                            </a>
                                        </div>
                                        <div class="price" id="formattedPrice">
                                            <fmt:formatNumber type="number" value="${market.productPrice}" pattern="#,###원" />
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>
                        </div>
                        <br>
                        <br>
                        <!-- 페이지네이션 -->
                        <div class="pagination-area">
                            <ul class="pagination">
                                <li><a href="/board/${boardCode}/list?cp=1${sp}">&lt;&lt;</a></li>
                                <li><a href="/board/${boardCode}/list?cp=${pagination.prevPage}${sp}">&lt;</a></li>
                                <c:forEach var="i" begin="${pagination.startPage}" end="${pagination.endPage}" step="1">
                                    <c:choose>
                                        <c:when test="${ i == pagination.currentPage}">
                                            <li><a class="current">${i}</a></li>
                                        </c:when>
                                        <c:otherwise>
                                            <li><a href="/board/${boardCode}/list?cp=${i}${sp}">${i}</a></li>
                                        </c:otherwise>
                                    </c:choose>
                                </c:forEach>
                                <li><a href="/board/${boardCode}/list?cp=${pagination.nextPage}${sp}">&gt;</a></li>
                                <li><a href="/board/${boardCode}/list?cp=${pagination.maxPage}${sp}">&gt;&gt;</a></li>
                            </ul>
                        </div>
                    </c:otherwise>
                </c:choose>
            </section>


            <jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
            <script src="/resources/js/market/marketList.js"></script>
        </body>

        </html>