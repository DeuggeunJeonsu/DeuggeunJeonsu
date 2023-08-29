<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <!-- 제이쿼리 -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    
    <!-- 테일윈드 -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/tailwindcss/2.2.19/tailwind.min.css">

    <link rel="stylesheet" href="/resources/js/member/signUp-style.css">
</head>
<body>

<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
    

<div class="bg-gray-50" style="min-height:100vh;">
  <div class="flex justify-center">
    <div class=" my-16 bg-white rounded-lg" style="width:572px; padding:3rem 16px; margin:0 250;">
      <div class="logo mb-14 lg:mb-11">
          </a>
      </div>
      <h2 class="text-xl font-bold">회원가입</h2>
      <form>
        <div class="mt-6 lg:mt-8">
          <div>
            <!--이름-->
            <div>
              <p class="inline-block text-xs lg:text-sm mb-2">이름</p>
            <input type="text" name="name" class="rounded-lg block w-full py-3 px-4 text-xs lg:text-sm placeholder-gray-300" placeholder="이름을 알려주세요" required style="border: solid 1px #ccc;" value>
            </div>
            
            <!--아이디-->
            <div>
            <p class="inline-block text-xs lg:text-sm mt-6 mb-2 lg:mt-8">아이디</p>
            <input type="email" name="email" class="rounded-lg block w-full py-3 px-4 text-xs lg:text-sm placeholder-gray-300" placeholder="likelion@gmail.com" required style="border: solid 1px #ccc;" value>
              <ul class=" invalid mb-4">
            
            <li class="flex space-x-2 invalid items-center text-red-400">
            <span><i class="fas fa-times"></i></span>
            <p class="text-xs lg:text-sm">
             이메일을 다시 확인해주세요
            </p>
          </li>
          </ul>
              <ul class=" valid mb-4">
            
            <li class="flex space-x-2 valid items-center text-green-500">
            <span><i class="fas fa-check"></i></span>
            <p class="text-xs lg:text-sm">
             사용가능한 이메일 입니다. 
            </p>
          </li>
          </ul>
            </div>
            
            <!--휴대폰번호-->
            <div>
            <p class="inline-block text-xs lg:text-sm mt-6 mb-2 lg:mt-8">휴대폰번호</p>
            <div class="flex space-x-2">
             <div class="w-full relative">
                <input type="tel" name="phone" max-length="13" class=" phone rounded-lg border-gray-300 focus:border-gray-600 focus:ring-0 block w-full py-3 px-4 text-xs lg:text-sm placeholder-gray-300" placeholder="-없이 숫자만 입력해주세요." required style="border: solid 1px #ccc;" value>
               <ul style="top:220%" class="invalid mt-2 absolute text-gray-500 text-sm">
                <li class="flex space-x-2 items-center text-red-400">
            <span><i class="fas fa-times"></i></span>
            <p class="text-xs lg:text-sm whitespace-nowrap">
             휴대폰 번호를 다시 확인해주세요.
            </p>
          </li>
              </ul>
              </div>
             <button type="button" class="btn-cert flex-shrink-0 py-3 px-4 border rounded-lg flex items-center justify-center" style="border:1px solid rgba(52, 196, 219, 0.5); color:rgba(52, 196, 219, 0.5);"> 
                <span class="text-sm font-semibold">인증하기</span>
                  </button>
             </div>
            <div class="flex space-x-2 mt-2 mb-6">
              <div class="relative">
                <input type="text" name="pin" autocomplete="one-time-code" class="rounded-lg border-gray-300 focus:border-gray-600 focus:ring-0 block w-full py-3 px-4 text-xs lg:text-sm placeholder-gray-300" readonly style="border: solid 1px #ccc;" value>
              </div>
              <button type="button" class=" btn-cert-2 bg-opacity-50 cursor-not-allowed flex-shrink-0 py-3 px-4 rounded-lg flex items-center justify-center text-white" style="height:46.22; background-color:rgba(52, 196, 219, 0.5);" disabled> 
                <span class="text-sm font-semibold">인증번호 확인</span>
                  </button>
            </div>
            
            <ul class="mt-2 hidden text-gray-500 text-sm">
                <li class="flex space-x-2 items-center text-red-400">
            <span><i class="fas fa-times"></i></span>
            <p class="text-xs lg:text-sm">
             인증 번호를 다시 확인해주세요.
            </p>
          </li>
              </ul>
           </div>
            
            <!--비밀번호-->
            <div>
            <p class="inline-block text-xs lg:text-sm mt-6 mb-2 lg:mt-8">비밀번호</p>
            <input onfocus="$(this).addClass('started');" type="password" name="password" class="rounded-lg block w-full py-3 px-4 text-xs lg:text-sm placeholder-gray-300" placeholder="비밀번호를 입력해주세요" required style="border: solid 1px #ccc;" value>
            <ul class="need-input mt-2 text-gray-500 text-sm space-y-0.5 lg:space-y-0">
                <li class="flex space-x-2 items-center">
                  <span class="inline-block ml-1 bg-gray-500 rounded-full" style="width:6px; height:6px"></span>
                  <p class="text-xs lg:text-sm">10자 이상 입력 </p>
                </li>
                <li class="flex space-x-2 items-center">
                  <span class="inline-block ml-1 bg-gray-500 rounded-full" style="width:6px; height:6px"></span>
                  <p class="text-xs lg:text-sm">영문/숫자/특수문자 중 2개 이상 포함</p>
                </li>
                <li class="flex space-x-2 items-center">
                  <span class="inline-block ml-1 bg-gray-500 rounded-full" style="width:6px; height:6px"></span>
                  <p class="text-xs lg:text-sm">동일한 숫자 3개 이상 연속 사용 불가</p>
                </li>
              </ul>
            </div>
            
            
            <!--비밀번호 확인-->
            <div>
            <p class="inline-block text-xs lg:text-sm mt-6 mb-2 lg:mt-8">비밀번호 확인</p>
            <input type="password" name="password2" class="rounded-lg block w-full py-3 px-4 text-xs lg:text-sm placeholder-gray-300" placeholder="비밀번호를 다시 한 번 입력해주세요" required style="border: solid 1px #ccc;" value></div>
            </div>
          <!--전체동의-->
          <div class="mt-16 flex items-center">
            <input type="checkbox" id="checkall" class="form-1__checkbox-all border-gray-500 rounded border-2 appearance-none" style="width:18px; height:18px; color:rgba(52, 196, 219, 0.5)">
            <span class="inline-block ml-2 text-xl font-bold">전체동의</span>
          </div>
          </div>
        
        <hr class="mt-4 mb-10">
        <div>
          <ul class="space-y-2">
            <li class="flex items-center">
              <input type="checkbox" class=" form-1__checkbox-item border-gray-500 rounded border-2 appearance-none" style="width:18px; height:18px; color:rgba(52, 196, 219, 0.5)">
              <span class="inline-block mx-2 text-base text-gray-700">서비스 이용약관 동의 (필수)</span>
            </li>
            <li class="flex items-center">
              <input type="checkbox" class=" form-1__checkbox-item border-gray-500 rounded border-2 appearance-none" style="width:18px; height:18px; color:rgba(52, 196, 219, 0.5)">
              <span class="inline-block mx-2 text-base text-gray-700">개인 정보 수집 및 이용 동의 (필수)</span>
            </li>
            <li class="flex items-center">
              <input type="checkbox" class="form-1__checkbox-item border-gray-500 rounded border-2 appearance-none" style="width:18px; height:18px; color:rgba(52, 196, 219, 0.5)">
              <span class="inline-block mx-2 text-base text-gray-700">만 14세 이상입니다 (필수)</span>
            </li>
            <li class="flex items-center">
              <input type="checkbox" class="form-1__checkbox-item border-gray-500 rounded border-2 appearance-none" style="width:18px; height:18px; color:rgba(52, 196, 219, 0.5)">
              <span class="inline-block mx-2 text-base text-gray-700">광고성 정보 수신 동의 (선택)</span>
            </li>
          </ul>
          <div class="mt-16">
            <button class="flex justify-center py-3 items-center w-full rounded-lg bg-opacity-50 " style="
background-color:rgba(52, 196, 219, 0.5);" >
  <span class="text-white text-sm font-semibold">확인</span>
</button>
          </div>
        </div>
        </form>
        </div>
    </div>
  </div>


<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
<script src="/resources/js/member/signUp.js"></script>
</body>


</html>