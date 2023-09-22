// 현재 URL의 쿼리 파라미터에서 특정 값을 가져오는 함수
function getQueryParam(name) {
    const urlParams = new URLSearchParams(window.location.search);
    return urlParams.get(name);
}

// 페이지 로드 시 sort 값을 사용하여 select box 값을 설정
document.addEventListener('DOMContentLoaded', function() {
    const sortValue = getQueryParam('sort');
    if (sortValue) {
        document.getElementById('type').value = sortValue;
    }
});

// 옵션 변경 시 페이지를 다시 로드하는 코드
document.getElementById('type').addEventListener('change', function() {
    const selectedValue = this.value;
    let boardCode = 5;
    let url = `/board/${boardCode}/list?sort=${selectedValue}`;
    window.location.href = url;
});

document.getElementById('type').addEventListener('change', function() {
    const selectedValue = this.value;

    let boardCode = 5;
    // let searchParam = '${param.keyword}';

    let url = `/board/${boardCode}/list?sort=${selectedValue}`;
    // if(searchParam) {
    //     url += `&keyword=${searchParam}`;
    // }
    window.location.href = url;
});
