const sendSmsBtn = document.getElementById("sendSmsBtn");
const memberPhones = document.getElementsByName("memberPhone");
let memberPhone ="";


sendSmsBtn.addEventListener("click", e=>{
    for( let i of memberPhones){
        memberPhone += i.value;
    }
    const data = {"memberPhone" : memberPhone};

    // ajax 코드 작성
    fetch("/member/findId", {
        method : "POST",
        headers : {"Content-Type" : "application/json"},
        body : JSON.stringify(data)
    })
    .then(response => response.text() ) // 응답 객체를 필요한 형태로 파싱하여 리턴
    .then(idAuthenticationKey => {

        // 세션스코프에 인증번호 세팅
        console.log("idAuthenticationKey : "+idAuthenticationKey);

        // 1회이상 전송시 버튼 문구 변경
        e.target.innerText = "인증번호 재전송";

        // 스팬태그 타이머 세팅
        
    }) // 파싱된 데이터를 받아서 처리하는 코드 작성 
    .catch(err =>{
        console.log("예외 발생");
        console.log(err);
    }) // 예외 발생 시 처리하는 부분
})