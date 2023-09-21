/* 모달창 메인으로 버튼 alert 효과 */
/* $(".iq-update").click(function () {
  Swal.fire({
    title: '답변 하시겠습니까?',
    text: "승인 시 작성 페이지로 이동합니다",
    icon: 'success',
    showCancelButton: true,
    confirmButtonColor: '#3085d6',
    cancelButtonColor: '#d33',
    confirmButtonText: '승인',
    cancelButtonText: '취소',
    reverseButtons: true, // 버튼 순서 거꾸로

  }).then((result) => {
    if (result.isConfirmed) {

      location.href = "/adminIqWrite";

    }
  })
}); */



$(".market-update").click(function () {
  Swal.fire({
    title: '답변 하시겠습니까?',
    text: "승인 시 작성 페이지로 이동합니다",
    icon: 'success',
    showCancelButton: true,
    confirmButtonColor: '#3085d6',
    cancelButtonColor: '#d33',
    confirmButtonText: '승인',
    cancelButtonText: '취소',
    reverseButtons: true, // 버튼 순서 거꾸로

  }).then((result) => {
    if (result.isConfirmed) {

      location.href = "/marketWrite";

    }
  })
});


/* 답변 여부 */
const adminCheckFl = document.getElementsByClassName("adminCheckFl");
const adminCheckFl2 = document.getElementsByClassName("adminCheckFl2");

const inquiryType = document.getElementsByClassName("inquiryType");
const inquiryType2 = document.getElementsByClassName("inquiryType2");


(() => {

  for (let i = 0; i < adminCheckFl.length; i++) {

    if (adminCheckFl2[i].value == 'N') {

      adminCheckFl[i].innerHTML = "미답변";
      adminCheckFl[i].style.color = "black";


    } else {
      adminCheckFl[i].innerHTML = "답변 완료";
    }


    if (inquiryType2[i].value == '1') {
      inquiryType[i].innerHTML = "1:1 문의";

    } else if (inquiryType2[i].value == '3') {
      inquiryType[i].innerHTML = "상품/교환";
    } else {
      inquiryType[i].innerHTML = "상품/취소";
    }
  }

})();

/* 선택한 문의목록 조회 */
const option1 = document.getElementById("option1");
const option2 = document.getElementById("option2");

const inquiryList = document.getElementById("inquiryList");
const tr = document.getElementsByTagName("tr");
const td = document.getElementsByTagName("td");

const inquiryHeader = document.getElementById("inquiryHeader");

option1.addEventListener("click", () => {
  option1.style.color = "#99E1ED";
  option2.style.color = "#797979";
  fetch("/admin/selectInquiry1")
    .then(resp => resp.json())
    .then(data => {



      const inquiryList = document.getElementById("inquiryList");

      inquiryList.innerHTML = ""; // 테이블 내용 초기화

      data.boardList.forEach(item => {
        const row = document.createElement("tr");

        row.innerHTML = `
             <td>${item.boardNo}</td>
             <td>${item.boardTitle}</td>
             <td>${item.inquiryType === 1 ? "1:1문의" : "에러"}</td>
             <td>${item.memberEmail}</td>
             <td style="color: ${item.adminCheckFl === 'N' ? 'black' : '#99E1ED'}">${item.adminCheckFl === 'N' ? '미답변' : '답변'}</td>
               
             
           `;
        inquiryList.appendChild(row);
      });

      inquiryHeader.innerHTML = "회원 1:1문의 목록";




    })
    .catch(error => console.log(error))

})

option2.addEventListener("click", () => {

  option2.style.color = "#99E1ED";
  option1.style.color = "#797979";

  fetch("/admin/selectInquiry2")
    .then(resp => resp.json())
    .then(data => {




      // 배열 내의 각 객체에서 boardNo 속성을 추출하여 문자열로 변환
      /*      const boardNoList = list.boardList.map(item => item.boardNo.toString());
     
     
      // 문자열로 변환된 boardNo를 콘솔에 출력하거나 원하는 곳에 추가할 수 있습니다.
      /*  console.log(boardNoList); */

      const inquiryList = document.getElementById("inquiryList");
      /*  inquiryList.innerHTML = boardNoList.join(", "); */

      inquiryList.innerHTML = ""; // 테이블 내용 초기화

      data.boardList.forEach(item => {
        const row = document.createElement("tr");

        let inquiryTypeText = '';

        if (item.inquiryType === 3) {
          inquiryTypeText = '상품/교환';
        } else if (item.inquiryType === 4) {
          inquiryTypeText = '상품/취소';
        }
        row.innerHTML = `
             <td>${item.boardNo}</td>
             <td>${item.boardTitle}</td>
             <td>${inquiryTypeText}</td>
             <td>${item.memberEmail}</td>
             <td style="color: ${item.adminCheckFl === 'N' ? 'black' : '#99E1ED'}">${item.adminCheckFl === 'N' ? '미답변' : '답변'}</td>
               
             
           `;
        inquiryList.appendChild(row);
      });

      inquiryHeader.innerHTML = "회원 상품문의 목록";




    })
    .catch(error => console.log(error))

})


// 답변 화면으로 이동
const iqUpdate = document.getElementsByClassName("iq-update");

for (let i = 0; i < adminCheckFl.length; i++) {
  iqUpdate[i].addEventListener("click", e => {
    e.preventDefault();

    if(inquiryType2[i].value == '1'){

      Swal.fire({
        title: '답변 하시겠습니까?',
        text: "승인 시 작성 페이지로 이동합니다",
        icon: 'success',
        showCancelButton: true,
        confirmButtonColor: '#3085d6',
        cancelButtonColor: '#d33',
        confirmButtonText: '승인',
        cancelButtonText: '취소',
        reverseButtons: true, // 버튼 순서 거꾸로
    
      }).then((result) => {
        if (result.isConfirmed) {
    
          window.location.href = '/admin/QnAWrite';
    
        }
      })

    }else if(inquiryType2[i].value == '3' || inquiryType2[i].value == '4'){

      Swal.fire({
        title: '답변 하시겠습니까?',
        text: "승인 시 작성 페이지로 이동합니다",
        icon: 'success',
        showCancelButton: true,
        confirmButtonColor: '#3085d6',
        cancelButtonColor: '#d33',
        confirmButtonText: '승인',
        cancelButtonText: '취소',
        reverseButtons: true, // 버튼 순서 거꾸로
    
      }).then((result) => {
        if (result.isConfirmed) {
    
          window.location.href = '/admin/marketWrite';
    
        }
      })
    }
    
  })
}

