// 검색 결과 페이지 로딩 후, 검색어를 설정하고 해당 부분을 업데이트
document.addEventListener("DOMContentLoaded", function () {
    // URL에서 검색어 파라미터를 가져옵니다.
    const searchQuery = getParameterByName("query");
  
    // 검색어를 span 요소에 설정합니다.
    const searchQueryElement = document.getElementById("searchQuery");
    if (searchQueryElement) {
      searchQueryElement.textContent = searchQuery;
    }
  });
  
  // URL에서 파라미터 값을 가져오는 함수
  function getParameterByName(name, url) {
    if (!url) url = window.location.href;
    name = name.replace(/[\[\]]/g, "\\$&");
    const regex = new RegExp("[?&]" + name + "(=([^&#]*)|&|#|$)");
    const results = regex.exec(url);
    if (!results) return null;
    if (!results[2]) return "";
    return decodeURIComponent(results[2].replace(/\+/g, " "));
  }
  