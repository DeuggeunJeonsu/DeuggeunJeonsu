<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
    <title>랭킹</title>
    
    <!-- jquery연결 -->
    <script src="//code.jquery.com/jquery-3.4.1.min.js"></script>

    <!-- <link rel="icon" type="image/png" href="favicon.ico"> -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
    <!--Google Font link-->
	<link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css?family=Raleway:400,600,700" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700" rel="stylesheet">

    <!-- 아이콘 사이트 key -->
    <script src="https://kit.fontawesome.com/9e44afcd4a.js" crossorigin="anonymous"></script>

    <link rel="stylesheet" href="/resources/css/ranking-style.css">

    <link rel="apple-touch-icon" sizes="180x180" href="/resources/images/favicon_io/apple-touch-icon.png">
    <link rel="icon" type="image/png" sizes="32x32" href="/resources/images/favicon_io/favicon-32x32.png">
    <link rel="icon" type="image/png" sizes="16x16" href="/resources/images/favicon_io/favicon-16x16.png">
    <link rel="manifest" href="/resources/images/favicon_io/site.webmanifest">

</head>
<body>

    <section class="ranking-section">
        <div class="ranking-container">

            <div class="ranking-title-area">
                <div>
                    <h1>RANKING</h1>
                </div>
            </div>

            <div class="ranking-content-area"
                data-aos="fade-right"
                data-aos-offset="50"
                data-aos-duration="300"
                data-aos-easing="ease-in-out"
                
                data-aos-once="false"
                data-aos-anchor-placement="top-center"+20
            >
                <!--홈페이지 출석 랭킹 -->
                <div class="ranking-table-area">
                    <div class="ranking-table" id="attendanceRanking">
                        <c:if test="${!empty loginMember}">
                            <div class="my-rank-area">
                                <c:forEach var="member" items="${attendenceRanking}" varStatus="status">
                                    <c:if test="${member.memberNo == loginMember.memberNo}">
                                        <p>${member.attendenceDate}일 출석</p>
                                        <p>rank : ${status.index+1}</p>
                                    </c:if>
                                </c:forEach>
                            </div>
                            <div class="you">You</div>
                        </c:if>
                        <div class="ranking-title">
                            출석 랭킹
                        </div>
                        <div class="top3-area">
                            <div>
                                <a href="/myPage/memberFeed/${attendenceRanking[1].memberNo}">
                                    <c:if test="${attendenceRanking[1].profileImage != null}">
                                        <img class="top3-profile-img top2-border" src="${attendenceRanking[1].profileImage}">
                                    </c:if>
                                    <c:if test="${attendenceRanking[1].profileImage == null}">
                                        <img class="top3-profile-img top2-border" src="/resources/images/user.png">
                                    </c:if>
                                </a>
                                <div class="top3-info-area top2-font">
                                    <div>2ed ${attendenceRanking[1].memberNickname}</div>
                                    <div>${attendenceRanking[1].attendenceDate}일 출석</div>
                                </div>
                            </div>
                            <div>
                                <a href="/myPage/memberFeed/${attendenceRanking[0].memberNo}">
                                    <c:if test="${attendenceRanking[0].profileImage != null}">
                                        <img class="top3-profile-img top1-border" src="${attendenceRanking[0].profileImage}">
                                    </c:if>
                                    <c:if test="${attendenceRanking[0].profileImage == null}">
                                        <img class="top3-profile-img top1-border" src="/resources/images/user.png">
                                    </c:if>
                                </a>
                                <div class="top3-info-area top1-font">
                                    <div>1st ${attendenceRanking[0].memberNickname}</div>
                                    <div>${attendenceRanking[0].attendenceDate}일 출석</div>
                                </div>
                            </div>
                            <div>
                                <a href="/myPage/memberFeed/${attendenceRanking[2].memberNo}">
                                    <c:if test="${attendenceRanking[2].profileImage != null}">
                                        <img class="top3-profile-img top3-border" src="${attendenceRanking[2].profileImage}">
                                    </c:if>
                                    <c:if test="${attendenceRanking[2].profileImage == null}">
                                        <img class="top3-profile-img top3-border" src="/resources/images/user.png">
                                    </c:if>
                                </a>
                                <div class="top3-info-area top3-font">
                                    <div>3rd ${attendenceRanking[2].memberNickname}</div>
                                    <div>${attendenceRanking[2].attendenceDate}일 출석</div>
                                </div>
                            </div>
                        </div>
                        <c:forEach var="member" items="${attendenceRanking}" begin="3" end="7" varStatus="status">
                            <div class="ranking-row">
                                <div>${status.index+1}</div>
                                <a href="/myPage/memberFeed/${member.memberNo}">
                                    <div>
                                        <c:if test="${member.profileImage != null}">
                                            <img class="rank-profile-img" src="${member.profileImage}">
                                        </c:if>
                                        <c:if test="${member.profileImage == null}">
                                            <img class="rank-profile-img" src="/resources/images/user.png">
                                        </c:if>
                                    </div>
                                </a>
                                <div>${member.memberNickname}</div>
                                <div>${member.attendenceDate}일 출석</div>
                            </div>
                        </c:forEach>
                    </div>
                </div>

                <!--투두리스트 실천 랭킹-->
                <div class="ranking-table-area">
                    <div class="ranking-table" id="executionRanking">
                        <c:if test="${!empty loginMember}">
                            <div class="my-rank-area">
                                <c:forEach var="member" items="${todoListRanking}" varStatus="status">
                                    <c:if test="${member.memberNo == loginMember.memberNo}">
                                        <p>${member.todoAllFlagCount}번 완료</p>
                                        <p>rank : ${status.index+1}</p>
                                    </c:if>
                                </c:forEach>
                            </div>
                            <div class="you">You</div>
                        </c:if>
                        <div class="ranking-title">
                            실천 랭킹
                        </div>
                        <div class="top3-area">
                            <div>
                                <a href="/myPage/memberFeed/${todoListRanking[1].memberNo}">
                                    <c:if test="${todoListRanking[1].profileImage != null}">
                                        <img class="top3-profile-img top2-border" src="${todoListRanking[1].profileImage}">
                                    </c:if>
                                    <c:if test="${todoListRanking[1].profileImage == null}">
                                        <img class="top3-profile-img top2-border" src="/resources/images/user.png">
                                    </c:if>
                                </a>
                                <div class="top3-info-area top2-font">
                                    <div>2ed ${todoListRanking[1].memberNickname}</div>
                                    <div>${todoListRanking[1].todoAllFlagCount}번 완료</div>
                                </div>
                            </div>
                            <div>
                                <a href="/myPage/memberFeed/${todoListRanking[0].memberNo}">
                                    <c:if test="${todoListRanking[0].profileImage != null}">
                                        <img class="top3-profile-img top1-border" src="${todoListRanking[0].profileImage}">
                                    </c:if>
                                    <c:if test="${todoListRanking[0].profileImage == null}">
                                        <img class="top3-profile-img top1-border" src="/resources/images/user.png">
                                    </c:if>
                                </a>
                                <div class="top3-info-area top1-font">
                                    <div>1st ${todoListRanking[0].memberNickname}</div>
                                    <div>${todoListRanking[0].todoAllFlagCount}번 완료</div>
                                </div>
                            </div>
                            <div>
                                <a href="/myPage/memberFeed/${todoListRanking[2].memberNo}">
                                    <c:if test="${todoListRanking[2].profileImage != null}">
                                        <img class="top3-profile-img top3-border" src="${todoListRanking[2].profileImage}">
                                    </c:if>
                                    <c:if test="${todoListRanking[2].profileImage == null}">
                                        <img class="top3-profile-img top3-border" src="/resources/images/user.png">
                                    </c:if>
                                </a>
                                <div class="top3-info-area top3-font">
                                    <div>3rd ${todoListRanking[2].memberNickname}</div>
                                    <div>${todoListRanking[2].todoAllFlagCount}번 완료</div>
                                </div>
                            </div>
                        </div>
                        <c:forEach var="member" items="${todoListRanking}" begin="3" end="7" varStatus="status">
                            <div class="ranking-row">
                                <div>${status.index+1}</div>
                                <a href="/myPage/memberFeed/${member.memberNo}">
                                    <div>
                                        <c:if test="${member.profileImage != null}">
                                            <img class="rank-profile-img" src="${member.profileImage}">
                                        </c:if>
                                        <c:if test="${member.profileImage == null}">
                                            <img class="rank-profile-img" src="/resources/images/user.png">
                                        </c:if>
                                    </div>
                                </a>
                                <div>${member.memberNickname}</div>
                                <div>${member.todoAllFlagCount}번 완료</div>
                            </div>
                        </c:forEach>
                    </div>
                </div>

                <!--커뮤니티 활동랭킹-->
                <div class="ranking-table-area">
                    <div class="ranking-table" id="communityRanking">
                        <c:if test="${!empty loginMember}">
                            <div class="my-rank-area">
                                <c:forEach var="member" items="${communityRanking}" varStatus="status">
                                    <c:if test="${member.memberNo == loginMember.memberNo}">
                                        <p>${member.communityScore}점</p>
                                        <p>rank : ${status.index+1}</p>
                                    </c:if>
                                </c:forEach>
                            </div>
                            <div class="you">You</div>
                        </c:if>
                        <div class="ranking-title">
                            실천 랭킹
                        </div>
                        <div class="top3-area">
                            <div>
                                <a href="/myPage/memberFeed/${communityRanking[1].memberNo}">
                                    <c:if test="${communityRanking[1].profileImage != null}">
                                        <img class="top3-profile-img top2-border" src="${communityRanking[1].profileImage}">
                                    </c:if>
                                    <c:if test="${communityRanking[1].profileImage == null}">
                                        <img class="top3-profile-img top2-border" src="/resources/images/user.png">
                                    </c:if>
                                </a>
                                <div class="top3-info-area top2-font">
                                    <div>2ed ${communityRanking[1].memberNickname}</div>
                                    <div>${communityRanking[1].communityScore}점</div>
                                </div>
                            </div>
                            <div>
                                <a href="/myPage/memberFeed/${communityRanking[0].memberNo}">
                                    <c:if test="${communityRanking[0].profileImage != null}">
                                        <img class="top3-profile-img top1-border" src="${communityRanking[0].profileImage}">
                                    </c:if>
                                    <c:if test="${communityRanking[0].profileImage == null}">
                                        <img class="top3-profile-img top1-border" src="/resources/images/user.png">
                                    </c:if>
                                </a>
                                <div class="top3-info-area top1-font">
                                    <div>1st ${communityRanking[0].memberNickname}</div>
                                    <div>${communityRanking[0].communityScore}점</div>
                                </div>
                            </div>
                            <div>
                                <a href="/myPage/memberFeed/${communityRanking[2].memberNo}">
                                    <c:if test="${communityRanking[2].profileImage != null}">
                                        <img class="top3-profile-img top3-border" src="${communityRanking[2].profileImage}">
                                    </c:if>
                                    <c:if test="${communityRanking[2].profileImage == null}">
                                        <img class="top3-profile-img top3-border" src="/resources/images/user.png">
                                    </c:if>
                                </a>
                                <div class="top3-info-area top3-font">
                                    <div>3rd ${communityRanking[2].memberNickname}</div>
                                    <div>${communityRanking[2].communityScore}점</div>
                                </div>
                            </div>
                        </div>
                        <c:forEach var="member" items="${communityRanking}" begin="3" end="7" varStatus="status">
                            <div class="ranking-row">
                                <div>${status.index+1}</div>
                                <a href="/myPage/memberFeed/${member.memberNo}">
                                    <div>
                                        <c:if test="${member.profileImage != null}">
                                            <img class="rank-profile-img" src="${member.profileImage}">
                                        </c:if>
                                        <c:if test="${member.profileImage == null}">
                                            <img class="rank-profile-img" src="/resources/images/user.png">
                                        </c:if>
                                    </div>
                                </a>
                                <div>${member.memberNickname}</div>
                                <div>${member.communityScore}점</div>
                            </div>
                        </c:forEach>
                    </div>
                </div>

            </div>
            
        </div>
    </section>

</body>
<script src="/resources/js/ranking.js"></script>
</html>