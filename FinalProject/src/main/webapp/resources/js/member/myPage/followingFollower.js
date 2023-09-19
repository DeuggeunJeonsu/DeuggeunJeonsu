// 팔로잉, 언팔로우 버튼 토글
const customBtns = document.querySelectorAll('.customBtn');

customBtns.forEach((button) => {

    button.addEventListener('click', () => {

        if (button.classList.contains('unfollowBtn')) {
            button.classList.remove('unfollowBtn');
            button.classList.add('followingBtn');
            button.querySelector('div').textContent = 'following';
        } else {
            button.classList.remove('followingBtn');
            button.classList.add('unfollowBtn');
            button.querySelector('div').textContent = 'follow';
        }

    });

});

// 팔로잉, 팔로워 목록 버튼 토글
const followListBtns = document.querySelectorAll(".followListBtn");

followListBtns.forEach((btn)=>{

    btn.addEventListener("click", () => {

        followListBtns.forEach((otherBtn) => {
            otherBtn.classList.remove("listBtnClick");
        });
        
        btn.classList.add("listBtnClick");
    })
})

// 팔로우 목록 조회 영역
const followListArea = document.getElementById("follow-list-area");

// 팔로우 목록 버튼
const followingListBtn = document.getElementsByClassName("followingListBtn")[0];
const followerListBtn = document.getElementsByClassName("followerListBtn")[0];

// 팔로잉 목록 버튼 클릭 + 팔로잉 목록 조회
followingListBtn.addEventListener("click", ()=>{

    location.href = "/myPage/followingFollower";

})

// 언팔로우 함수
function unfollowBtnClick(followingMemberNo){

    const data = {
        "loginMemberNo" : memberNo,
        "boardMemberNo" : followingMemberNo
    }

        fetch("/myPage/followingFollower/unfollow", {
            method : "POST",
            headers : {"Content-Type" : "application/json"},
            body : JSON.stringify(data)
        })
        .then(resp => resp.json())
        .then(result => {
            alert("언팔로우 되었습니다. 🙏")
            location.reload();
        })
        .catch(err => console.log(err))
}

// 팔로워 목록 조회
function selectFollowerList(){
    
    fetch("/myPage/followingFollower/follower", {
        method : "POST",
        headers : {"Content-Type" : "application/json"},
        body : ""
    })
    .then(resp => resp.json())
    .then(map => {

        // 팔로워 리스트
        const followerList = map.followerList;

        // 팔로잉 리스트
        const followingList = map.followingList;
        
        // 팔로워 목록 조회 영역
        const followListArea = document.getElementById("follow-list-area");

        // 팔로워 목록 조회 영역 비운 뒤 div 추가
        followListArea.innerHTML = "";

        // 팔로워 리스트에서 팔로워 하나씩 꺼내오기
        for (const follower of followerList) {
            
            // 팔로워 정보
            const memberNo = follower.memberNo;
            const profileImage = follower.profileImage;
            const memberNickname = follower.memberNickname;

            // 맞팔로우 여부 저장 변수
            let flag = 0;

            // 팔로잉 목록에서 팔로워가 있는지 조회
            for(const follow of followingList){
                // 맞팔 상태라면
                if(follow.memberNo == memberNo) flag = 1;
            }

            // 팔로워 리스트 목록 생성
            
            // jsp 내 58 ~ 59번째 줄 생성(follow-list 클래스 있는 div)
            const div = document.createElement("div");
            const a = document.createElement("a");
            
            div.classList.add("follow-list");
            a.setAttribute("href", "/myPage/memberFeed/" + memberNo);
            div.append(a);
            
            // 60 ~ 69번째 줄 생성(프로필 이미지 있는 div)
            const div2 = document.createElement("div");
            const img2 = document.createElement("img");
            
            div2.classList.add("followProfileImg");
            if (profileImage == null) {
                img2.setAttribute("src", "/resources/images/user.png");
            } else {
                img2.setAttribute("src", profileImage);
            }
            div2.appendChild(img2);
            
            // 71 ~ 75번째 줄 생성(닉네임 있는 div)
            const a2 = document.createElement("a");
            const div3 = document.createElement("div");

            a2.setAttribute("href", "/myPage/memberFeed/" + memberNo);
            div3.classList.add("followNickname");
            div3.innerHTML = memberNickname;
            a2.appendChild(div3);

            // 76 ~ 78번째 줄 생성(팔로우 버튼 있는 div)
            const div4 = document.createElement("div");
            const div5 = document.createElement("div");
            const btn = document.createElement("button");
            

            // 맞팔 여부에 따라 버튼 종류 바꾸기
            if(flag == 1){
                div4.classList.add("followStateBtn");
                btn.classList.add("customBtn", "followingBtn");
                btn.setAttribute("onclick", 'unfollowBtnClick(' + memberNo + ')');
                div5.innerText = "following";
                div4.appendChild(btn).appendChild(div5);

            } else{
                div4.classList.add("followStateBtn");
                btn.classList.add("customBtn", "unfollowBtn");
                btn.setAttribute("onclick", 'followBtnClick(' + memberNo + ')');
                div5.innerText = "follow";
                div4.appendChild(btn).appendChild(div5);
            }

            // 전체 요소 합치기
            div.appendChild(div2);
            div.appendChild(a2);
            div.appendChild(div4);
            followListArea.appendChild(div);
        }
    })
    .catch(err => {console.log(err)})
}


// 팔로우 함수
function followBtnClick(followMemberNo){
    const data = {
        "loginMemberNo" : memberNo,
        "boardMemberNo" : followMemberNo
    }

        fetch("/myPage/followingFollower/follow", {
            method : "POST",
            headers : {"Content-Type" : "application/json"},
            body : JSON.stringify(data)
        })
        .then(resp => resp.json())
        .then(result => {
            alert("팔로우 되었습니다. 🤩")
            selectFollowerList();
        })
        .catch(err => console.log(err))
}