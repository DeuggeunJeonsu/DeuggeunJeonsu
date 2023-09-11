<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>상품문의 답변 작성</title>

    <link rel="stylesheet" href="/resources/css/admin/adminIqWrite-style.css">
</head>

<body>
    <main>
    <jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>

        <div class="Jbody">
            <div class="Jcenter">

                <div class="iqHead">
                    <h2>상품문의 답변 작성</h2>
                </div>

              

                <div class="iqTitle">
                    <input type="text" placeholder="제목 작성" autocomplete="off">
                </div>

                <div class="ncProfile">

                    <div id="ncProfile2">
                        <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTcmsIcVNgkjQ_BAsCA53PKy_iBXOaetVFJBQ&usqp=CAU" id="adminProfile">
                    </div>

                    <div id="ncName">관리자</div>


                </div>
                <textarea class="ncContent" maxlength="2000" placeholder="내용을 입력해주세요."></textarea>

                

                <div class="ncContent2">
                    <div id="ncContentText"> <span  id="ncTextCount">0</span> / 2000 자</div>
                </div>    

                <div class="ncBtn">
                    <button id="ncCancle">취소</button>
                    <button id="ncInsert">작성</button>
                </div>

            </div>
        </div>
    </main>
    <jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
    <script src="notificationWrite.js"></script>
</body>

</html>