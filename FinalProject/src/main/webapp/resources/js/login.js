const kakaoLogininBtn = document.getElementById("kakao-login-btn");

kakaoLogininBtn.addEventListener("click",()=>{
    window.location.href = 'https://kauth.kakao.com/oauth/authorize?response_type=code&client_id=e5e770e3268b121e1528e7468c66b3b6&redirect_uri=http%3A%2F%2Flocalhost%3A8080%2Foauth';
})