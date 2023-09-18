$(document).ready(function () {
    var imgTarget = $('.previewImage .inputHidden');

    imgTarget.on('change', function () {
        var parent = $(this).parent();

        // 입력 값이 변경되면 기존 이미지를 삭제합니다.
        parent.find('.src').remove();

        if (window.FileReader) {
            // 새로 선택된 파일이 이미지인지 확인
            if (!$(this)[0].files[0].type.match(/image\//)) return;

            var reader = new FileReader();
            reader.onload = function (e) {
                var src = e.target.result;
                parent.prepend('<img src="' + src + '" class="src">');
            };
            reader.readAsDataURL($(this)[0].files[0]);
        } else { // IE9 이하에서는 다른 방식을 사용
            $(this)[0].select();
            $(this)[0].blur();
            var imgSrc = document.selection.createRange().text;
            parent.prepend('<img class="src" style="filter:progid:DXImageTransform.Microsoft.AlphaImageLoader(enable=\'true\',sizingMethod=\'scale\',src=\'' + imgSrc + '\')">');
        }
    });

    // 이미지 삭제 버튼 이벤트
    $('#deleteImage').on('click', function() {
        $('.src').remove();
        $('.uploadFileName').val("");
        $('#file1').val("");
        $('#imageDeleted').val("true");
    });

    // 파일 첨부 시 미리보기와 파일명 표시
    var fileTarget = $('.fileBox .inputHidden');
    fileTarget.on('change', function() {
        if (window.FileReader) {
            var filename = $(this)[0].files[0].name;
        } else {
            var filename = $(this).val().split('/').pop().split('\\').pop();
        }

        // 파일명을 input box에 표시
        $(this).siblings('.uploadFileName').val(filename);
    });

    $('form').on('submit', function(e) {
        var uploadFileName = $('.uploadFileName').val();

        if (!uploadFileName) {
            $('.uploadFileName').val('null');
        }
    });
});

// 제출시 유효성 검사
const inquireFrm = document.getElementById("inquireForm"); // 여기서 form의 ID를 'inquireForm'으로 맞춰줍니다.

inquireFrm.addEventListener("submit", e => {

    const title = document.getElementById("inquireTitle"); // 여기서 'title-textArea' 대신 'inquireTitle'을 사용합니다.

    if(title.value.trim().length == 0){
        alert("제목을 입력해주세요");
        title.value = "";
        title.focus();

        e.preventDefault();
        return;
    }

    const content = document.getElementById("inquireContent"); // 여기서 'reviewContent' 대신 'inquireContent'를 사용합니다.

    if(content.value.trim().length == 0){
        alert("내용을 입력해 주세요");
        content.value = "";
        content.focus();

        e.preventDefault();
        return;
    }
});

const cancelBtn = document.getElementById("cancel-btn");
cancelBtn.addEventListener("click", () => {

    let url = "/board/5/inquiry/" + inquiryNo + "/detail";

    location.href = url;
});
