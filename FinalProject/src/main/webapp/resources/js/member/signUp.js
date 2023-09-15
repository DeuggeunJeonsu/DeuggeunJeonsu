function toggleAllAgree() {
    var chkAll = document.getElementById("chkAll");
    var checkboxes = document.querySelectorAll('input[name="chk"]');

    for (var i = 0; i < checkboxes.length; i++) {
        checkboxes[i].checked = chkAll.checked;
    }
}

function checkIndividualAgreements() {
    var chkAll = document.getElementById("chkAll");
    var checkboxes = document.querySelectorAll('input[name="chk"]');
    var allChecked = true;

    for (var i = 0; i < checkboxes.length; i++) {
        if (!checkboxes[i].checked) {
            allChecked = false;
            break;
        }
    }

    chkAll.checked = allChecked;
}


const memberPw = document.getElementById("memberPw");
const memberPwConfirm = document.getElementById("memberPwConfirm");
const pwMessage = document.getElementById("pwMessage");

const regEx = /^[a-zA-Z\d\!\@\#\-\_]{6,20}$/; // 정규 표현식

const checkObj = {
    memberPw: false,
    memberPwConfirm: false
};