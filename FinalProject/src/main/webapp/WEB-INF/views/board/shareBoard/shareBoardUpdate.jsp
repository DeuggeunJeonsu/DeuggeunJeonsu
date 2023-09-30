<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"  %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>루틴 공유 게시판</title>


<c:forEach items="${board.imageList}" var="img">
    <c:choose>
        <c:when test="${img.imageLevel == 0}">
            <c:set var="img0" value="${img.imagePath}${img.imageReName}"/>
        </c:when>

        <c:when test="${img.imageLevel == 1}">
            <c:set var="img1" value="${img.imagePath}${img.imageReName}"/>
        </c:when>

        <c:when test="${img.imageLevel == 2}">
            <c:set var="img2" value="${img.imagePath}${img.imageReName}"/>
        </c:when>

        <c:when test="${img.imageLevel == 3}">
            <c:set var="img3" value="${img.imagePath}${img.imageReName}"/>
        </c:when>

        <c:when test="${img.imageLevel == 4}">
            <c:set var="img4" value="${img.imagePath}${img.imageReName}"/>
        </c:when>

        <c:when test="${img.imageLevel == 5}">
            <c:set var="img5" value="${img.imagePath}${img.imageReName}"/>
        </c:when>
        
        <c:when test="${img.imageLevel == 6}">
            <c:set var="img6" value="${img.imagePath}${img.imageReName}"/>
        </c:when>
    </c:choose>
</c:forEach>

<%-- boardList-style.css 연결 --%>
<link rel="stylesheet" href="/resources/css/board/shareBoard/shareBoardWrite-style.css">
</head>
<body style="background-color:#F8F9FA">

	<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
	
    <div class="place"></div>
	<section id="main-container">
        <div id="title-area">
            <div class="board-title">루틴 공유 게시판  |  수정하기</div>
              <div>득근전수 회원님들과 공유하고 싶은 운동 루틴을 수정해보세요.</div>
        </div>
        <form action="/board2/2/${board.boardNo}/update" method="POST"
             class="board-write" id="boardUpdateFrm" enctype="multipart/form-data">
            <div class="top-write">
                <div id="writer">
                    <div id="profile-area">
                        <c:if test="${empty loginMember.profileImage}">
                            <img src="/resources/images/user.png">
                        </c:if>
                        <c:if test="${!empty loginMember.profileImage}">
                            <img src="${loginMember.profileImage}">
                        </c:if>
                    </div>
                    <span>${loginMember.memberNickname}</span>
                </div>
                <button type="submit" id="writebtn">작성완료</button>
            </div>
            
            <div class= "middle-write">
                <div class="writeTitle-area">
                    <input type="text" name="boardTitle" placeholder="제목을 입력해주세요" value="${board.boardTitle}">
                </div>
                <div class="thumbnail-routineType-area">
                    <div class="thumbnail-area">
                        <h3>Thumbnail</h3>
                        <div class="thumbnail-box">
                            <div class="boardImg thumbnail">
                                <label for="img0">
                                    <img class="preview" src="${img0}">
                                </label>
                                <input type="file" name="images" class="inputImage" id="img0" accept="image/*">
                                <span class="delete-image">&times;</span>
                            </div>
                        </div>
                    </div>
                    <div class="routineType-area">
                        <div>
                            <h3>Routine Type</h3>
                            <article class="cont-select">
                                <button class="btn-select" type="button">${board.tagList[0].tagContent}</button>
                                <ul class="list-member">
                                    <li><button type="button">하체</button></li>
                                    <li><button type="button">상체</button></li>
                                    <li><button type="button">등</button></li>
                                    <li><button type="button">어깨</button></li>
                                    <li><button type="button">팔</button></li>
                                    <input type="hidden" class="routineType" name="tagContent" value="${board.tagContent}"/>
                                </ul>
                            </article>
                        </div>
                        <textarea placeholder="루틴 설명을 입력해주세요" name="boardContent" >${board.boardContent}</textarea>
                    </div>
                </div>

               

                <c:forEach items="${board.routineList}" var="routine">
                    <c:choose>
                        <c:when test="${routine.rtLevel == 0}">
                            <c:set var="routineTitle0" value="${routine.rtTitle}"/>
                            <c:set var="routineContent0" value="${routine.rtContent}"/>
                            <c:set var="routineNo0" value="${routine.rtNo}"/>
                        </c:when>

                        <c:when test="${routine.rtLevel == 1}">
                            <c:set var="routineTitle1" value="${routine.rtTitle}"/>
                            <c:set var="routineContent1" value="${routine.rtContent}"/>
                            <c:set var="routineNo1" value="${routine.rtNo}"/>
                        </c:when>

                        <c:when test="${routine.rtLevel== 2}">
                            <c:set var="routineTitle2" value="${routine.rtTitle}"/>
                            <c:set var="routineContent2" value="${routine.rtContent}"/>
                            <c:set var="routineNo2" value="${routine.rtNo}"/>
                        </c:when>

                        <c:when test="${routine.rtLevel == 3}">
                            <c:set var="routineTitle3" value="${routine.rtTitle}"/>
                            <c:set var="routineContent3" value="${routine.rtContent}"/>
                            <c:set var="routineNo3" value="${routine.rtNo}"/>
                        </c:when>

                        <c:when test="${routine.rtLevel == 4}">
                            <c:set var="routineTitle4" value="${routine.rtTitle}"/>
                            <c:set var="routineContent4" value="${routine.rtContent}"/>
                            <c:set var="routineNo4" value="${routine.rtNo}"/>
                        </c:when>

                       
                       
                    </c:choose>
                </c:forEach>

                <div class="routine-area">
                    <div>
                        <h3>Routine</h3>
                        <hr>
                    </div>
                    <!-- <%-- 득근 캘린더 말풍선 --%>
                    <div class="ballon floating">
                        드래그를 통해 Routine 순서를 바꿀 수 있어요!👟
                    </div> -->

                        <ul class="routine-add">
                            <c:if test="${!empty img1}">
                                <li class="routine" draggale="true">
                                    <div class="boardImg">
                                        <label for="img1">
                                            <img class="preview" src="${img1}">
                                        </label>
                                        <input type="file" name="images" class="inputImage" id="img1" accept="image/*" value="${img1}">
                                        <span class="delete-image">&times;</span>
                                    </div>
                                    <div class="routine-write-area">
                                        <input type="text" placeholder="예) 스쿼트 20회 30세트" name="routineName" value="${routineTitle0}">
                                        <textarea name="routineContent">${routineContent0}</textarea>
                                    </div>
                                    <div class="routine-cancle">
                                        <button type="button" class="cancle">&times;</button>
                                        <input type="hidden" value="${routineNo0}">
                                    </div>
                                </li>
                            </c:if>
                            <c:if test="${!empty img2}">
                                <li class="routine" draggale="true">
                                    <div class="boardImg">
                                        <label for="img2">
                                            <img class="preview" src="${img2}">
                                        </label>
                                        <input type="file" name="images" class="inputImage" id="img2" accept="image/*">
                                        <span class="delete-image">&times;</span>
                                    </div>
                                    <div class="routine-write-area">
                                        <input type="text" placeholder="예) 스쿼트 20회 30세트" name="routineName" value="${routineTitle1}">
                                        <textarea name="routineContent">${routineContent1}</textarea>
                                    </div>
                                    <div class="routine-cancle">
                                        <button type="button" class="cancle">&times;</button>
                                        <input type="hidden" value="${routineNo1}">
                                    </div>                                
                                </li>
                            </c:if>
                            <c:if test="${!empty img3}">
                                <li class="routine" draggale="true">
                                    <div class="boardImg">
                                        <label for="img3">
                                            <img class="preview" src="${img3}">
                                        </label>
                                        <input type="file" name="images" class="inputImage" id="img3" accept="image/*" >
                                        <span class="delete-image">&times;</span>
                                    </div>
                                    <div class="routine-write-area">
                                        <input type="text" placeholder="예) 스쿼트 20회 30세트" name="routineName" value="${routineTitle2}">
                                        <textarea name="routineContent">${routineContent2}</textarea>
                                    </div>
                                    <div class="routine-cancle">
                                        <button type="button" class="cancle">&times;</button>
                                        <input type="hidden" value="${routineNo2}">
                                    </div>
                                </li>
                            </c:if>
                            <c:if test="${!empty img4}">
                                <li class="routine" draggale="true">
                                    <div class="boardImg">
                                        <label for="img4">
                                            <img class="preview" src="${img4}">
                                        </label>
                                        <input type="file" name="images" class="inputImage" id="img4" accept="image/*">
                                        <span class="delete-image">&times;</span>
                                    </div>
                                    <div class="routine-write-area">
                                        <input type="text" placeholder="예) 스쿼트 20회 30세트" name="routineName"  value="${routineTitle3}">
                                        <textarea name="routineContent">${routineContent3}</textarea>
                                    </div>
                                    <div class="routine-cancle">
                                        <button type="button" class="cancle">&times;</button>
                                        <input type="hidden" value="${routineNo3}">
                                    </div>
                                </li>
                            </c:if>
                            <c:if test="${!empty img5}">
                                <li class="routine" draggale="true">
                                    <div class="boardImg">
                                        <label for="img5">
                                            <img class="preview" src="${img5}">
                                        </label>
                                        <input type="file" name="images" class="inputImage" id="img5" accept="image/*">
                                        <span class="delete-image">&times;</span>
                                    </div>
                                    <div class="routine-write-area">
                                        <input type="text" placeholder="예) 스쿼트 20회 30세트" name="routineName"  value="${routineTitle4}">
                                        <textarea name="routineContent">${routineContent4}</textarea>
                                    </div>
                                    <div class="routine-cancle">
                                        <button type="button" class="cancle">&times;</button>
                                        <input type="hidden" value="${routineNo4}">
                                    </div>
                                </li>
                            </c:if>

                        </ul>
                    </div>
                   
                </div>
                <div class="routine-add-btn-area">
                    <button id="routineBtn" type="button">
                        Routine 
                        <i class="fa-solid fa-circle-plus"></i>
                    </button>
                
                </div>
            </div>
            <input type="hidden" name="deleteList"  value="">
            <input type="hidden" name="cp" value="${param.cp}">
        </form>    

    </section>


    <!-- footer include -->
	<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>

    <script src="/resources/js/board/shareBoard/shareBoardUpdate.js"></script>

</body>
</html>