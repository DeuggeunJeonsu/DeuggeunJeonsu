<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE html>
<html lang="ko">


<head>

  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.6.3/css/font-awesome.css" type="text/css">
  

  <title>hc17</title>

  <link rel="stylesheet" href="/resources/css/member/signUp-style.css">

</head>


<body>

<jsp:include page="/WEB-INF/views/common/header.jsp"/>

  <form action ="/member/signUp" method = "POST" name = "signUpFrm" id = "signUpFrm">

    <div class="membership">

      <div>
        <label class="imp" for="memberEmail">아이디(이메일)</label>
        <div>
          <input type="text" name = "memberEmail" id = "memberEmail" placeholder="예 : email@gmail.com"  required>
          <button id="sendAuthKeyBtn" type="button">인증 받기</button>
        </div>
      <p class="signUp-message" id="emailMessage">메일을 받을 이메일을 작성해주세요.</p>
      <div>
        <div>
          <input type="text" name = "authKey" id = "authKey" placeholder="인증번호 입력" maxlength="6" autocomplete="off">
          <button type="button" id="checkAuthKeyBtn">인증하기</button>
        </div>
          <p class="signUp-message" id="authKeyMessage"></p>
      </div>
      </div>

      

      <br>

      <div>
        <label class="imp">비밀번호</label>
        <input type="password" placeholder="비밀번호를 입력해주세요." name = "memberPw" id = "memberPw" required>
      </div>

      <div>
        <label class="imp">비밀번호 확인</label>
        <input type="password" placeholder="비밀번호를 한번 더 입력해주세요." name = "memberPwConfirm" id = "memberPwConfirm" required>
        <p class="signUp-message" id="pwMessage">영어,숫자,특수문자 8~16자 사이로 입력해주세요.</p>
      </div>

      <div>
        <label class="imp">닉네임</label>
        
        <input type="text" placeholder="닉네임을 입력해주세요" name = "memberNickname" id = "memberNickname" required>
        <p class="signUp-message" id="nickMessage">한글,영어,숫자로만 2~10글자</p>
      </div>

      <div>
        <label class="imp">휴대폰</label>
        <div>
          <input type="tel" placeholder="숫자만 입력해주세요" name = "memberTel" id = "idAuthenticationKey" required>
          <button type="button" class="findInfo-btn" id="sendSmsBtn">인증번호받기</button>
        </div>
      </div>

      <div>
        <div>
          <input type="tel" placeholder="인증번호 입력" required id="tel3">
          <button type="button" id="idAuthenticationKey">인증번호확인</button>
        </div>
      </div>


      <div>
        <label class="imp">주소</label>
        <div>
          <input type="text" placeholder="우편번호" name="memberAddress" maxlength="6" id="sample6_postcode">
          <button type="button" onclick="sample6_execDaumPostcode()">주소 찾기</button>
        </div>
          <div>
          <input type="text" placeholder="도로명, 지번, 건물명" name="memberAddress" id="sample6_address">
          </div>
          <div>
          <input type="text" placeholder="상세주소" name="memberAddress" id="sample6_detailAddress">
          </div>
        <p>배송지에 따라 상품 정보가 달라질 수 있습니다.</p>
      </div>

      <div>
        <label>생년월일</label>
        <div>
          <input type="date" name="memberBirth" id="memberBirth" fontid="birth_year" pattern="[0-9]*" value label="생년월일" size="4" maxlength="4"
            placeholder="YYYY" >
        </div>
      </div>


      <div>
      </div>
    </div>
    <main class="main-container">

      <div class="container">

        <div class="agree-container">

          <div class="agree-column">
            <div class="checkbox-container">
              <input type="checkbox" id="chkAll" onchange="toggleAllAgree()" name="chkAll">
              <label for="Allagreement">이용약관, 개인정보 수집 및 이용에 모두 동의합니다.</label>
            </div>

            <div class="agree-terms">
              <h2>득근전수 서비스 이용약관</h2>
              <h3>제1조 (목적)</h3>
              <p>
                본 약관은 득근전수 서비스(이하 "서비스")에 가입한 회원이 위드기어 (이하 "회사")가 제공하는 서비스를
                이용함에 있어 회원 및 회사 간의 제반 권리 의무와 관련 절차 등을 규정하는데 그 목적이 있습니다.
              </p>

              <h3>제2조 (용어의 정의)</h3>
              <p>
                이 약관에서 사용하는 용어의 정의는 다음과 같으며, 정의되지 않은 용어에 대한 해석은 관계법령 및 별도 안내에서
                정하는 바에 따릅니다.
              </p>
              <ol>
                <li>
                  <strong>득근전수 서비스</strong>: 단말기(모바일, 태블릿 PC 등의 장치를 포함)를 이용하는 "회원"이 광고물의
                  제작 또는 SNS를 활용한 공유를 통하여 포인트를 획득할 수 있는 서비스로 광고주가 광고를 게시하면 회원은
                  광고주가 원하는 광고물 제작 또는 SNS에 공유를 수행하고 그에 대한 포인트를 적립한 후 해당 포인트를
                  현금 또는 기타 상품 등으로 교환할 수 있는 광고 서비스입니다.
                </li>
                <li>
                  <strong>득근전수 회원</strong>(이하, "회원"): 본 약관에 동의 후 이용계약을 체결하고, 서비스에 정상적으로
                  가입되어 "서비스"를 이용하는 고객을 의미합니다.
                </li>
                <li>
                  <strong>득근전수 계정(ID)</strong>: 회원의 식별과 서비스 이용을 위하여 회원이 가입시 입력한 정보(이메일
                  등)를 기반으로 생성된 고유 ID를 의미합니다.
                </li>
                <li>
                  <strong>포인트</strong>: 회원이 회사가 정한 규정에 따라 득근전수에서 현금 환급 등이 가능한 포인트를
                  말하며 재화로서의 가치는 없습니다.
                </li>
              </ol>
              <h3>제 3 조 (약관의 효력 및 변경)</h3>
              <ol>
                <li>
                  본 약관은 "득근전수" 최초 회원 가입 시에 공지되며 이에 대하여 "회원"이 동의함으로써 효력이 발생합니다.
                  만약, 동 약관에 동의하지 않으시면 회원 가입을 중단하시면 됩니다. 이 경우 "득근전수"의 서비스를 더 이상
                  사용하실 수 없습니다. "회사"는 이 약관의 내용을 "회원"이 쉽게 알 수 있도록 득근전수 서비스 내 초기화면
                  하단에 상시 게시합니다.
                </li>
                <li>
                  "회사"는 합리적인 사유가 발생할 경우 "약관의 규제에 관한 법률", "정보통신망이용촉진 및 정보보호등에 관한
                  법률(이하 "정보통신망법")" 등 관련법을 위배하지 않는 범위에서 이 약관을 개정할 수 있습니다.
                </li>
                <li>
                  "회사"가 약관을 개정할 경우에는 적용일자 및 개정사유를 명시하여 현행약관과 함께 적용일자 7일 전부터
                  "득근전수" 공지사항에 게시하거나, 이메일 또는 문자 서비스를 통하여 "회원"에게 개별적으로 통지합니다.
                  다만, "회원"에게 불리한 약관의 개정의 경우에는 그 적용일자 30일 전부터 위와 같은 방법으로 개별 통지합니다.
                  ("회원"의 연락처 변경 등으로 인하여 개별통지가 어려운 경우에 한하여 본 약관에 의한 공지를 함으로써 개별
                  통지한 것으로 간주합니다.)
                </li>
                <li>
                  "회사"가 전항에 따라 개정약관을 공지 또는 통지하면서 "회원"이 약관 개정 적용 일까지 "회원"이 명시적으로
                  거부의사를 표시하지 아니하거나 본 "득근전수"를 계속 사용할 경우, "회원"이 개정약관에 동의한 것으로 봅니다.
                </li>
                <li>
                  "회원"이 개정약관의 적용에 동의하지 않는 경우 "회사"는 개정 약관의 내용을 적용할 수 없으며, 이 경우
                  "회원"은 이용계약을 해지할 수 있습니다.
                </li>
                <li>
                  "회원"이 변경된 약관을 알지 못하여 발생한 손해에 대하여 "회사"는 책임을 지지 아니합니다.
                </li>
              </ol>
              <h3>제4조 (약관 외 준칙)</h3>
              <p>
                본 약관에 명시되지 않은 사항에 대해서는 전기통신기본법, 전기통신사업법 등 관계법령, 상관례 및 "회사"가 정한
                "득근전수"의 운영 정책 등의 규정에 의합니다.
              </p>

              <h3>제5조 (이용계약 성립 및 승낙)</h3>
              <ol>
                <li>
                  이용계약은 만 14세 이상인 "회원"이 본 "득근전수" 가입 과정 상의 본 약관이 명시된 창에서 '동의' 버튼을 누르면
                  본 약관에 동의하는 것으로 간주됩니다. "서비스"를 이용하고자 하는 만 14세 미만의 이용고객은
                  qhdvlfrbs125@daum.net 으로 문의하여 법정대리인의 확인 등 별도 프로세스에 따라 이용계약을 체결하시기 바랍니다.
                </li>
                <li>
                  "회사"는 "가입신청자"의 신청에 대하여 "득근전수" 이용을 승낙함을 원칙으로 하며, 이용계약은 "회원"의
                  "득근전수" 신청에 대하여 "회사"가 승낙함으로써 성립됩니다.
                </li>
              </ol>
              <h3>제 6 조 (이용 신청에 대한 승낙의 제한)</h3>
              <ol>
                <li>
                  "회사"는 다음 각 호에 해당하는 신청에 대하여는 승낙을 하지 않거나 사후에 이용계약을 해지할 수 있습니다.
                  <ol type="a">
                    <li>
                      "회원"이 소지한 단말기가 본 "득근전수"를 지원하지 않는 등 기술상 "득근전수" 제공이 불가능 한 경우 또는
                      "득근전수" 관련 설비의 여유가 없거나 업무 상 문제가 있는 경우
                    </li>
                    <li>
                      가입신청자가 이 약관에 의하여 이전에 "회원"자격을 상실한 적이 있는 경우, 단 "회사"의 "회원" 재가입
                      승낙을 얻은 경우에는 예외로 함.
                    </li>
                    <li>타인의 명의를 이용한 경우</li>
                    <li>허위의 정보를 기재하거나, "회사"가 제시하는 내용을 기재하지 않은 경우</li>
                    <li>14세 미만 아동이 법정대리인(부모 등)의 동의를 얻지 아니한 경우</li>
                    <li>"회원"의 귀책사유로 인하여 승인이 불가능하거나 기타 규정한 제반 사항을 위반하며 신청하는 경우</li>
                  </ol>
                </li>
                <li>
                  제1항 나. 호 내지 다. 호에 따른 신청에 있어 "회사"는 "회원"의 종류에 따라 전문기관을 통한 실명확인 및 본인인증을
                  요청할 수 있습니다.
                </li>
                <li>
                  제1항에 따라 "회원" 가입신청의 승낙을 하지 아니하거나 유보한 경우, "회사"는 원칙적으로 이를 가입신청자에게 알리도록
                  합니다.
                </li>
                <li>
                  "회사"는 "회원"에 대해 "회사"정책에 따라 등급별로 구분하여 이용시간, 이용횟수, "득근전수" 메뉴 등을 세분하여 이용에
                  차등을 둘 수 있습니다.
                </li>
                <li>
                  "회사"는 "회원"에 대하여 "영화 및 비디오물의 진흥에 관한 법률" 및 "청소년보호법"등에 따른 등급 및 연령 준수를 위해
                  이용제한이나 등급별 제한을 할 수 있습니다.
                </li>
              </ol>
              <h3>제7조 (“회원”정보의 변경)</h3>
              <ol>
                <li>
                  "회원"은 "득근전수"내 "정보수정" 화면을 통하여 언제든지 본인의 개인정보를 열람하고 수정할 수 있습니다. 다만,
                  "득근전수" 관리를 위해 필요한 ID, 닉네임 등은 수정이 불가능합니다.
                </li>
                <li>
                  "회원"은 "회원" 가입신청 시 기재한 사항이 변경되었을 경우 온라인으로 수정을 하거나 전자우편 기타 방법으로 "회사"에
                  대하여 그 변경사항을 알려야 합니다. 변경사항을 "회사"에 알리지 않아 발생한 불이익에 대하여 "회사"는 책임지지 않습니다.
                </li>
                <li>
                  회원은 본인의 개인정보를 허위로 설정하여 부당한 방법으로 이익을 취할 경우, 당사자의 포인트는 소멸되며 서비스 이용이
                  제한될 수 있습니다.
                </li>
              </ol>

              <h3>제8조 (계약해지 및 이용제한)</h3>
              <ol>
                <li>
                  "회원"은 언제든지 "득근전수" 내 "회원 탈퇴" 메뉴를 통하여 이용계약 해지 신청을 할 수 있으며, "회사"는 관련법 등이
                  정하는 바에 따라 이를 즉시 처리하여야 합니다.
                </li>
                <li>
                  "회원"이 계약을 해지할 경우, 관련법 및 개인정보취급방침에 따라 "회사"가 "회원"정보를 보유하는 경우를 제외하고는 해지
                  즉시 "회원"이 보유하고 있는 포인트를 포함한 "회원"의 관련 데이터는 소멸되며, 재 가입 후에도 재 생성되지 아니합니다.
                </li>
                <li>
                  "회사"는 "회원"이 약관의 의무를 위반하거나 "득근전수"의 정상적인 운영을 방해한 경우, 경고, 일시정지, 영구이용정지 등으로
                  "득근전수" 이용을 단계적으로 제한할 수 있습니다.
                </li>
                <li>
                  "회사"는 전항에도 불구하고, 단말기의 초기화 또는 VM(가상머신)등을 활용한 반복적 적립, "주민등록법"을 위반한 명의도용 및
                  결제도용, 전화번호 도용, "저작권법" 및 "컴퓨터프로그램보호법"을 위반한 불법프로그램의 제공 및 운영방해,
                  "정보통신망법"을 위반한 불법통신 및 해킹, 악성프로그램의 배포, 접속권한 초과행위 등과 같이 관련법을 위반한 경우에는 즉시
                  영구이용정지를 할 수 있습니다. 본 항에 따른 영구이용정지시 "득근전수" 이용을 통해 획득한 혜택 등도 모두 소멸되며,
                  "회사"는 이에 대해 별도로 보상하지 않습니다.
                </li>
                <li>
                  "회사"는 "회원"이 계속해서 60일 이상 사용하지 않는 경우, "회원"정보의 보호 및 운영의 효율성을 위해 이용을 제한할 수
                  있습니다.
                </li>
                <li>
                  "회원"탈퇴로 인해 발생한 불이익에 대한 책임은 "회원" 본인에게 있으며, 이용계약이 종료되면 "회사"는 "회원"에게 부가적으로
                  제공한 각종 혜택을 회수할 수 있습니다.
                </li>
                <li>
                  본 조의 이용제한 범위 내에서 제한의 조건 및 세부내용은 "회사"의 운영 정책에서 정하는 바에 의합니다.
                </li>
                <li>
                  본 조에 따라 "득근전수" 이용을 제한하거나 계약을 해지하는 경우에는 "회사"는 회원의 이메일로 그 사실을 통지합니다. 단,
                  4)항의 경우 "회사"는 별도의 통지 없이 계약 해지 및 영구이용정지를 할 수 있습니다
                </li>
                <li>
                  "회원"은 본 조에 따른 이용제한 등에 대해 서비스 내에 이용문의 메뉴를 이용하여 이의신청을 할 수 있습니다. 이 때 이의가
                  정당하다고 "회사"가 인정하는 경우 "회사"는 즉시 "득근전수"의 이용을 재개합니다.
                </li>
              </ol>

              <h3>제9조 (득근전수 서비스)</h3>
              <p>회사가 본 약관에 정해진 바에 따라 회원에게 제공하는 서비스는 다음 각 호와 같으며 서비스를 이용하고자 하는 고객은 본 약관에
                정해진 제반 절차를 거쳐 회원으로 가입하여야 합니다. 단, 본 서비스는 SNS 공유 기능을 활용한 광고 서비스로써 그 특성상 광고주의
                요구에 따라 회원들은 일부 서비스의 이용조건, 이용범위 등이 제한되거나 회원에게 일정한 자격요건이 요구될 수 있으며, 이 경우
                회사는 그 제한사항 및 자격요건을 회원에게 고지해드립니다.</p>

              <h3>제10조 (콘텐츠의 관리)</h3>
              <ol>
                <li>
                  "회사"는 "회원"이 등록한 콘텐츠를 회사 운영사이트에 노출하거나 기타 마케팅활동 자료로 활용할 수 있다.
                </li>
                <li>
                  "회사"는 "회원"에게 콘텐츠 제작에 사용한 영상 및 이미지 원본을 요청할 수 있으며, 콘텐츠 내용을 수정 편집하고 초상권을 사용하는 것에
                  대해 "회원"이 동의한 것으로 간주한다.
                </li>
                <li>
                  "회사"는 회원탈퇴 후에도 해당 "회원"이 등록한 콘텐츠를 노출하거나 활용할 수 있다.
                </li>
                <li>
                  "회사"는 "회원"이 등록한 콘텐츠가 아래 각 호에 해당하는 경우에 별도의 통보 없이 숨김 및 삭제 등의 조치를 할 수 있다.
                  <ol type="a">
                    <li>정보통신망법 및 저작권법 등 관련법 위반 또는 그에 준하여 의심되는 경우</li>
                    <li>타인의 명예 훼손 및 권리침해 또는 그에 준하여 의심되는 경우</li>
                    <li>공공질서 또는 미풍양속에 위배 또는 그에 준하여 의심되는 경우</li>
                    <li>일방적 영리 및 광고 목적 또는 그에 준하여 의심되는 경우</li>
                    <li>기타 서비스 운영 정책에 반하는 경우</li>
                  </ol>
                </li>
                <li>
                  등록 콘텐츠는 천재지변, 불가항력, 시스템 오류 등으로 손실 및 삭제될 수 있다.
                </li>
                <li>
                  모든 콘텐츠(게시글, 댓글 등 포함)의 손실 및 삭제로 인한 피해에 관하여 회사는 별도의 보상을 하지 않는다.
                </li>
              </ol>

              <h3>제11조 (서비스의 내용 및 변경)</h3>
              <ol>
                <li>
                  회사는 서비스 사이트를 통하여 회원에 대한 득근전수 관련 제반 서비스 및 정보의 제공, 기타 회사가 정하는 업무를 수행합니다.
                </li>
                <li>
                  회사는 운영상, 기술상의 필요에 따라 제공하는 서비스의 전부 또는 일부를 변경할 수 있으며, 이에 대하여 약관에 다른 규정이 없는 한
                  회원에게 별도의 보상을 하지는 않습니다. 회사는 중요한 서비스의 내용을 변경하고자 할 경우에는 변경될 서비스의 내용 및 제공일자를
                  공지합니다. 단, 변동내용을 구체적으로 공지하기가 불가능한 경우에는 7일 전에 그 취지 및 공지가 불가능한 변동사유를 공지합니다.
                </li>
              </ol>

              <h3>제12조 (서비스의 일시 중단)</h3>
              <ol>
                <li>
                  회사는 컴퓨터 등 정보통신설비의 점검, 보수, 교체 및 고장, 통신의 두절 등의 사유가 발생한 경우에는 서비스의 제공을 일시적으로
                  중단할 수 있습니다.
                </li>
                <li>
                  본 조 제1항의 사유로 서비스를 중단하고자 할 경우 회사는 득근전수 서비스 내 공지사항을 통하여 회원에게 서비스 중단사실을 알려드립니다.
                </li>
                <li>
                  회사의 고의 또는 과실에 기인한 서비스의 부당한 중단 및 시스템 장애로 회원이 손해를 입은 경우, 회사는 통상적으로 예상 가능한 범위
                  내에서 동 손해를 배상합니다.
                </li>
              </ol>

              <h3>제13조 (포인트 적립)</h3>
              <ol>
                <li>
                  득근전수 서비스에서 요구하는 광고물의 제작 또는 광고 게시 및 요청 액션이 완료되면 포인트를 부여받게 됩니다. 포인트 적립을 위하여
                  특정 "회원"의 자격요건이 요구될 수 있습니다.
                </li>
                <li>
                  서비스 내 적립 포인트로 명시된 포인트만큼의 포인트가 적립되며 이는 "적립금 리포트 " 메뉴에서 확인할 수 있습니다.
                </li>
                <li>
                  포인트의 적립 및 사용과 관련하여 발생하는 제세공과금 및 원천징수대상 사업소득 (3.3%) 은 회원이 부담하는 것을 원칙으로 합니다.
                </li>
              </ol>

              <h3>제14조 (포인트 현금환급 및 제휴컨텐츠 이용)</h3>
              <ol>
                <li>
                  가용포인트는 득근전수 서비스에 등록된 회사가 제공하는 제휴한 컨텐츠(상품) 구매 시 또는 현금 환급 시 사용할 수 있으며 해당 바코드
                  또는 약정된 상품 쿠폰 또는 현금이 전송되거나 이체됨으로써 적법하게 지급한 것으로 봅니다.
                </li>
                <li>
                  회원은 포인트를 타인에게 대여 또는 담보의 목적으로 이용할 수 없습니다. 다만, 회사가 인정하는 적법한 절차를 따른 경우는 예외로
                  합니다.
                </li>
              </ol>

              <h3>제15조 (포인트 정정, 취소 및 소멸)</h3>
              <ol>
                <li>
                  포인트 적립에 오류가 있을 경우 회원은 오류발생 시점부터 30일 이내에 회사에 정정 신청을 하여야 하며, 회사는 회원의 정정 신청일로부터
                  30일 이내에 조정할 수 있습니다.
                </li>
                <li>
                  회원이 본 서비스를 통해 12개월이 경과하는 동안 포인트 적립을 하지 않는 경우 회원에게 기 적립된 포인트는 자동적으로 소멸됩니다.
                </li>
              </ol>

              <h3>제16조 (회사의 의무)</h3>
              <ol>
                <li>
                  회사는 관련법과 이 약관이 금지하거나 미풍양속에 반하는 행위를 하지 않으며, 계속적이고 안정적으로 "서비스"를 제공하기 위하여 최선을
                  다하여 노력합니다.
                </li>
                <li>
                  회사는 회원이 안전하게 서비스를 이용할 수 있도록 개인정보(신용정보 포함)보호를 위해 보안시스템을 갖추어야 하며 개인정보취급방침을
                  공시하고 준수합니다.
                </li>
                <li>
                  회사는 서비스이용과 관련하여 회원으로부터 제기된 의견이나 불만이 정당하다고 인정할 경우에는 이를 처리하여야 합니다. 회원이 제기한
                  의견이나 불만사항에 대해서는 득근전수 서비스 내 공지사항을 활용하거나 이메일 등 개별적으로 "회원"에게 처리과정 및 결과를 전달합니다.
                </li>
              </ol>
              <h3>제 17 조 (회원의 의무)</h3>
              <p>회원은 서비스 이용과 관련하여 다음 각 호의 행위를 하여서는 안됩니다.</p>
              <ol>
                <li>서비스 이용 관련 신청 또는 변경 시 허위내용 등록 행위</li>
                <li>서비스 내 게시된 각종 정보의 무단 변경, 삭제 등 훼손 행위</li>
                <li>다른 회원의 명예를 손상시키거나 개인정보를 수집하는 행위</li>
                <li>회사가 허용한 정보 이외의 다른 정보(컴퓨터 프로그램 및 광고 등)를 송신하거나 게시하는 행위</li>
                <li>일체의 가공행위를 통해 서비스를 분해, 모방 또는 변형하는 행위</li>
                <li>회사 및 제3자의 저작권 등 지적재산권에 대한 침해 행위</li>
                <li>외설 또는 폭력적인 정보(메시지, 화상, 음성 등), 기타 공서양속에 반하는 정보를 서비스에 공개하거나 게시하는 행위</li>
              </ol>
              <h3>제 18 조 (저작권의 귀속 및 이용제한)</h3>
              <ol>
                <li>회사가 작성한 저작물에 대한 저작권 기타 지적재산권은 회사에 귀속합니다.</li>
                <li>회원은 서비스를 이용함으로써 얻은 정보를 회사의 사전 승낙 없이 복제, 송신, 출판, 배포, 방송 기타 방법에 의하여 영리목적으로 이용하거나 제3자에게 이용하게 하여서는 안됩니다.</li>
                <li>회사의 서비스에서 제공되는 모든 콘텐츠(사진, 동영상, 게시글 등)는 저작권법에 의하여 보호받는 저작물로 별도의 저작권 표시 또는 다른 출처를 표시한 경우를 제외하고는 원칙적으로 회사에 저작권이 있습니다.</li>
                <li>회사는 저작권법 및 기타 법령을 준수하고 저작권법의 보호를 받는 저작물에 관한 판단은 법과 판례를 따릅니다.</li>
                <li>회사는 서비스 내 게시물이 저작권 및 타인의 권리를 침해하거나 회사의 정책 또는 관련 법령에 위배되는 경우 해당 게시물을 삭제할 수 있습니다.</li>
                <li>회원이 회사가 제공하는 서비스를 이용하면서 작성한 각종 게시물의 저작권은 이를 작성한 회원 본인에게 있으며, 해당 게시물의 저작권 침해를 비롯한 민·형사상 모든 책임은 회원 본인이 부담합니다.</li>
                <li>회원이 수집을 허가한 콘텐츠에 대한 저작권은 게시한 회원에게 있으며, 회사는 해당 콘텐츠를 위한 연결 정보의 생성 및 검색을 위하여 서버에 콘텐츠에 대한 일정 크기의 사본을 저장합니다.</li>
                <li>회사가 제공하는 서비스를 통해 제작된 회원의 콘텐츠는 회사가 보상을 지급했거나, 지급하기로 약속한 경우, 콘텐츠의 국내외 사용권을 갖습니다. 사용권에는 해당 콘텐츠의 복제권, 전시권, 배포권 및 2차적 저작물 작성권 및 해당 콘텐츠에 포함된 회원의 초상권이 포함됩니다. 이를 원하지 않으실 경우 캠페인 신청을 취소하거나 이미 캠페인을 진행한 경우 본 조 제 4항에 규정된 절차에 따라 사용권 중단 요청을 할 수 있습니다.</li>
                <li>만일 회원이 캠페인이 진행된 후 전항에 따라 회사에게 부여된 사용권의 중단을 원한다면, 정상적으로 콘텐츠 등록을 완료한 날로부터 1년이 경과한 후 회사에 사용권 중단 요청을 할 수 있으며, 그 기간 중 탈퇴한 회원은 전문과 동일한 기간이 경과한 후 회사에 사용권 중단 요청을 할 수 있습니다. 이미 회원의 동의를 거쳐 광고주에게 제공된 콘텐츠에 대한 사용권 중단에 관하여는, 전문과 동일한 기간이 경과한 후 해당 광고주에게 사용권 중단 요청을 할 수 있습니다.</li>
                <li>회사는 제2항에 따라 허락된 사용기간 동안 회원이 등록한 콘텐츠, 링크 또는 콘텐츠 내에 포함된 멀티미디어를 각각 또는 결합하여 클라이언트에게 제공하거나, 국내외 마케팅에 활용할 수 있습니다.</li>
                <li>전항의 경우, 회사는 등록된 콘텐츠를 출처를 포함하여 광고주에게 제공할 수 있으며, 이때 회사는 콘텐츠의 취지를 벗어나지 않는 범위 내에서 해당 콘텐츠에 편집, 수정, 가공 등을 할 수 있습니다.</li>
              </ol>

              <h3>제 19 조 (서비스 관련 분쟁해결)</h3>
              <p>1. 회사는 서비스 이용과 관련하여 회원으로부터 제출되는 불만사항 및 의견을 최대한 신속하게 처리합니다. 다만, 신속한 처리가 곤란한 경우에는 회원에게 그 사유와 처리일정을 조속히 통보해 드립니다.</p>
              <p>2. 회사와 회원간에 발생한 분쟁은 전자거래기본법에 의하여 설치된 전자거래분쟁 조정위원회의 조정에 따라 처리합니다.</p>
              <h3>제 20 조 (서비스 종료)</h3>
              <ol>
                <li>서비스를 종료하고자 할 경우, 회사는 서비스를 종료하고자 하는 날로부터 3개월 이전에 본 약관 제3조 제3항에 규정된 통지방법을 준용하여 회원에게 알려드립니다.</li>
                <li>본 조 제1항에 따른 서비스 종료 통지가 있은 날("통지일") 현재 기 적립된 포인트는 회사가 별도 지정하는 날("서비스 종료일")까지 본 약관이 정하는 바에 따라 현금환급을 받거나 제휴 컨텐츠를 이용해 소진하여야 합니다. 서비스 종료일까지 사용하지 않은 포인트는 자동으로 소멸됩니다.</li>
                <li>종료 통지일로부터 서비스 종료일까지 서비스의 일부가 제한될 수 있으며, 서비스 종료일 이후에는 회사로부터 서비스를 제공받지 못합니다.</li>
              </ol>

              <h3>제 21 조 (책임제한)</h3>
              <ol>
                <li>“회사”는 천재지변 또는 이에 준하는 불가항력으로 인하여 “득근전수” 서비스를 제공할 수 없는 경우에는 “득근전수” 서비스 제공에 관한 책임이 면제됩니다.</li>
                <li>“회사”는 “회원”의 귀책사유로 인한 “득근전수” 이용의 장애에 대하여는 책임을 지지 않습니다.</li>
                <li>“회사”는 “회원”이 “득근전수”와 관련하여 게재한 정보, 자료, 사실의 신뢰도, 정확성 등의 내용에 관하여는 책임을 지지 않습니다.</li>
                <li>“회사”는 “회원” 간 또는 “회원”과 제3자 상호간에 “득근전수”을 매개로 하여 거래 등을 한 경우에는 책임이 면제됩니다.</li>
                <li>“회사”는 무료로 제공되는 “득근전수” 이용과 관련하여 관련법에 특별한 규정이 없는 한 책임을 지지 않습니다.</li>
                <li>“회사”는 제3자가 “득근전수”내 화면 또는 링크된 웹사이트를 통하여 광고한 제품의 내용과 품질에 대하여 감시할 의무 등 기타 어떠한 책임도 지지 아니합니다.</li>
                <li>“회사”및 “회사”의 임직원 그리고 대리인은 다음과 같은 사항으로부터 발생하는 손해에 대해 책임을 지지 아니합니다.
                  <ol type="1">
                    <li>“회원” 상태정보의 허위 또는 부정확성에 기인하는 손해</li>
                    <li>그 성질과 경위를 불문하고 “득근전수”에 대한 접속 및 “득근전수”의 이용과정에서 발생하는 개인적인 손해</li>
                    <li>서버에 대한 제3자의 모든 불법적인 접속 또는 서버의 불법적인 이용으로부터 발생하는 손해</li>
                    <li>서버에 대한 전송 또는 서버로부터의 전송에 대한 제3자의 모든 불법적인 방해 또는 중단행위로부터 발생하는 손해</li>
                    <li>제3자가 “득근전수”를 이용하여 불법적으로 전송, 유포하거나 또는 전송, 유포 되도록 한 모든 바이러스, 스파이웨어 및 기타 악성 프로그램으로 인한 손해</li>
                    <li>전송된 데이터의 오류 및 생략, 누락, 파괴 등으로 발생되는 손해</li>
                    <li>“회원”간의 “득근전수” 이용 과정에서 발생하는 명예훼손 기타 불법행위로 인한 각종 민형사상 책임</li>
                  </ol>
                </li>
              </ol>
              <h3>제 22 조 (준거법 및 재판관할)</h3>
              <ol>
                <li>"회사”와 “회원”간 제기된 소송은 대한민국법을 준거법으로 합니다.</li>
                <li>”회사”와 “회원”간 발생한 분쟁에 관한 소송은 민사소송법 상의 법원을 관할법원으로 합니다.</li>
              </ol>

              <h3>제 23 조 (개인정보보호 의무)</h3>
              <p>회사는 관련법령이 정하는 바에 따라서 회원 등록정보를 포함한 회원의 개인정보를 보호하기 위하여 노력합니다. 회원의 개인정보보호에 관해서는 관련법령 및 회사가 정하는 "개인정보 취급방침"에 정한 바에 의하며, 회원이 상시 확인할 수 있도록 득근전수 서비스 내에서 공지하고 있습니다.</p>
            </div>

            <div class="checkbox-container">
              <input type="checkbox" id="Serviceagreement" onchange="checkIndividualAgreements()" name="chk">
              <label for="Serviceagreement">위의 약관에 동의합니다. (필수)</label>
            </div>

            <div class="agree-terms">
              <h2>개인정보처리방침</h2>
              <p>
                (1) 개인정보 수집목적 및 이용목적
              <ul>
                <li>홈페이지 회원 가입 및 관리: 회원 가입 의사 확인, 회원제 서비스 제공에 따른 본인 식별․인증, 회원자격 유지․관리, 제한적 본인확인제 시행에 따른 본인확인, 서비스 부정 이용 방지, 만 14세 미만 아동의 개인정보 처리시 법정대리인의 동의 여부 확인, 각종 고지․통지, 고충 처리 등의 목적</li>
                <li>재화 또는 서비스 제공: 물품 배송, 서비스 제공, 계약서․청구서 발송, 콘텐츠 제공, 맞춤 서비스 제공, 본인인증, 연령인증, 요금 결제 및 정산, 채권추심 등의 목적</li>
                <li>고충 처리: 민원인의 신원 확인, 민원사항 확인, 사실조사를 위한 연락․통지, 처리 결과 통보 등</li>
              </ul>
              </p>
              <p>
                (2) 수집하는 개인정보 항목
              <ul>
                <li>ID</li>
                <li>성명</li>
                <li>비밀번호</li>
                <li>주소</li>
                <li>휴대폰 번호</li>
                <li>이메일</li>
                <li>14세 미만 가입자의 경우 법정대리인 정보</li>
              </ul>
              </p>
              <p>
                (3) 개인정보 보유 및 이용기간
                <br>
                회원탈퇴 시까지 (단, 관계 법령에 보존 근거가 있는 경우 해당 기간 시까지 보유, 개인정보처리방침에서 확인 가능)
              </p>
            </div>
            <div class="checkbox-container">
              <input type="checkbox" id="Privacyagreement" onchange="checkIndividualAgreements()" name="chk">
              <label for="Privacyagreement">위의 약관에 동의합니다. (필수)</label>
            </div>
          </div>

        </div>

      </div>

    </main>

    <article>
      <decorator:body />
    </article>
    
   

    <button >가입하기</button>

  </form> 

  <jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>


    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>

     <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
     <script>
           function sample6_execDaumPostcode() {
               new daum.Postcode({
                    oncomplete: function(data) {
                        // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                        // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                        // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                        var addr = ''; // 주소 변수

                        //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                        if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                           addr = data.roadAddress;
                        } else { // 사용자가 지번 주소를 선택했을 경우(J)
                           addr = data.jibunAddress;
                        }


                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample6_postcode').value = data.zonecode;
                document.getElementById("sample6_address").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("sample6_detailAddress").focus();
            }
        }).open();
    }
</script>


    
    <script src="/resources/js/member/signUp.js"></script>
  
</body>


</html>