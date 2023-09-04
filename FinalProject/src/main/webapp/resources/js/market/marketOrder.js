function sample6_execDaumPostcode() {
    new daum.Postcode({
        oncomplete: function (data) {
            var addr = '';

            if (data.userSelectedType === 'R') {
                addr = data.roadAddress;
            } else {
                addr = data.jibunAddress;
            }

            // 원하는 id로 값을 설정
            document.getElementById('delZip').value = data.zonecode;
            document.getElementById('delAddr1').value = addr;

            // 상세주소 필드 초기화
            document.getElementById('delAddr2').value = '';

            // 상세주소 필드로 포커스 이동
            document.getElementById('delAddr2').focus();
        }
    }).open();
}


// const delName = document.getElementById("del_name")
// delName.addEventListener("")
// if(delName.value.trim().length == 0){
//     alert("수령인 이름을 입력해주세요.");
//     delName.value = "";
//     delName.focus();
// }