// 첨부한 이미지 미리보기
$(document).ready(function () {
    var fileTarget = $('.fileBox .inputHidden');

    fileTarget.on('change', function () {
        if (window.FileReader) {
            // 파일명 추출
            var filename = $(this)[0].files[0].name;
        }

        else {
            // Old IE 파일명 추출
            var filename = $(this).val().split('/').pop().split('\\').pop();
        };

        $(this).siblings('.uploadFileName').val(filename);
    });

    //preview image 
    var imgTarget = $('.previewImage .inputHidden');

    imgTarget.on('change', function () {
        var parent = $(this).parent();
        parent.children('.uploadDisplay').remove();

        if (window.FileReader) {
            //image 파일만
            if (!$(this)[0].files[0].type.match(/image\//)) return;

            var reader = new FileReader();
            reader.onload = function (e) {
                var src = e.target.result;
                parent.prepend('<div class="uploadDisplay"><div class="upload-thumb-wrap"><img src="' + src + '" class="upload-thumb"></div></div>');
            }
            reader.readAsDataURL($(this)[0].files[0]);
        }

        else {
            $(this)[0].select();
            $(this)[0].blur();
            var imgSrc = document.selection.createRange().text;
            parent.prepend('<div class="uploadDisplay"><div class="upload-thumb-wrap"><img class="upload-thumb"></div></div>');

            var img = $(this).siblings('.uploadDisplay').find('img');
            img[0].style.filter = "progid:DXImageTransform.Microsoft.AlphaImageLoader(enable='true',sizingMethod='scale',src=\"" + imgSrc + "\")";
        }
    });
});