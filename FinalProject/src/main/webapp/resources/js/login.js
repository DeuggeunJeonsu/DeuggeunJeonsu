document.getElementById("kakao-login-btn").addEventListener("click",()=>{
    Kakao.Auth.authorize({
        redirectUri: 'https://developers.kakao.com/tool/demo/oauth';
    });
})

  // 발급받은 토큰 확인
displayToken()

function displayToken() {
    var token = getCookie('authorize-access-token');

    if(token) {
        Kakao.Auth.setAccessToken(token);
        Kakao.Auth.getStatusInfo()
        .then(function(res) {
            if (res.status === 'connected') {
            document.getElementById('token-result').innerText = 'login success, token: ' + Kakao.Auth.getAccessToken();
            }
        })
        .catch(function(err) {
            Kakao.Auth.setAccessToken(null);
        });
    }
}

function getCookie(name) {
    var parts = document.cookie.split(name + '=');
    if (parts.length === 2) { return parts[1].split(';')[0]; }
}