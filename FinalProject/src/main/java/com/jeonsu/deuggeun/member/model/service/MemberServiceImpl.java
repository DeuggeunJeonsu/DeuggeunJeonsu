package com.jeonsu.deuggeun.member.model.service;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.jeonsu.deuggeun.board.model.dto.Board;
import com.jeonsu.deuggeun.member.model.dao.MemberDAO;
import com.jeonsu.deuggeun.member.model.dto.Member;
import com.jeonsu.deuggeun.member.model.dto.MemberBMI;
import com.jeonsu.deuggeun.todolist.model.dto.TodoList;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class MemberServiceImpl implements MemberService {
	
	@Autowired
	private MemberDAO dao;
	
	@Autowired 
	private BCryptPasswordEncoder bcrypt;
	
	// 로그인 서비스
	@Override
	public Member login(Member inputMember) {
		
		log.debug("암호화 확인 : " + bcrypt.encode(inputMember.getMemberPw()));
		
		Member loginMember = dao.login(inputMember);
		
		if(loginMember != null) { // 아이디가 일치하고
			// 입력한 pw와 DB의 암호화된 pw가 같으면
			if(bcrypt.matches(inputMember.getMemberPw(), loginMember.getMemberPw())) {
				// 로그인 정보에서 비밀번호 제외시켜준 후 로그인
				loginMember.setMemberPw(null);
			}
			// 비밀번호 불일치 시 로그인 실패
			else loginMember = null;
		}
		return loginMember;
	}
	
	// 카카오 로그인 토근 가져오기
	@Override
	public String getAccessToken(String authorize_code) throws MalformedURLException, IOException {
		String access_Token = "";
		String refresh_Token = "";
		String reqURL = "https://kauth.kakao.com/oauth/token";

		URL url = new URL(reqURL);

		HttpURLConnection conn = (HttpURLConnection) url.openConnection();
		// POST 요청을 위해 기본값이 false인 setDoOutput을 true로

		conn.setRequestMethod("POST");
		conn.setDoOutput(true);
		// POST 요청에 필요로 요구하는 파라미터 스트림을 통해 전송

		BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()));
		StringBuilder sb = new StringBuilder();
		sb.append("grant_type=authorization_code");

		sb.append("&client_id=e5e770e3268b121e1528e7468c66b3b6"); // REST_API키 본인이 발급받은 key
		sb.append("&redirect_uri=http://localhost:8080/oauth"); // REDIRECT_URI 본인이 설정한 주소

		sb.append("&code=" + authorize_code);
		bw.write(sb.toString());
		bw.flush();

		// 결과 코드가 200이라면 성공
		int responseCode = conn.getResponseCode();
		log.debug("kakao login responseCode : {}", responseCode);

		// 요청을 통해 얻은 JSON타입의 Response 메세지 읽어오기
		BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
		String line = "";
		String result = "";

		while ((line = br.readLine()) != null) {
			result += line;
		}
		log.debug("response body : {}", result);

		// jackson objectmapper 객체 생성
		ObjectMapper objectMapper = new ObjectMapper();
		// JSON String -> Map
		Map<String, Object> jsonMap = objectMapper.readValue(result, new TypeReference<Map<String, Object>>() {});

		access_Token = jsonMap.get("access_token").toString();
		refresh_Token = jsonMap.get("refresh_token").toString();

		// log.debug("access_token : {}", access_Token);
		// log.debug("refresh_token : {}", refresh_Token);

		br.close();
		bw.close();
		
		return access_Token;
	}
	
	// 카카오 로그인 회원정보 가져오기
	@SuppressWarnings("unchecked")
	@Override
	public HashMap<String, Object> getUserInfo(String access_Token) throws Throwable, NullPointerException {
		// 요청하는 클라이언트마다 가진 정보가 다를 수 있기에 HashMap타입으로 선언
		HashMap<String, Object> userInfo = new HashMap<String, Object>();
		String reqURL = "https://kapi.kakao.com/v2/user/me";

		try {
			URL url = new URL(reqURL);
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			conn.setRequestMethod("GET");

			// 요청에 필요한 Header에 포함될 내용
			conn.setRequestProperty("Authorization", "Bearer " + access_Token);

			int responseCode = conn.getResponseCode();
			log.debug("kakao userInfo responseCode : {}", responseCode);

			BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));

			String line = "";
			String result = "";

			while ((line = br.readLine()) != null) {
				result += line;
			}
			log.debug("response body : {}", result);
			log.debug("result type : {}", result.getClass().getName()); // java.lang.String

			try {
				// jackson objectmapper 객체 생성
				ObjectMapper objectMapper = new ObjectMapper();
				// JSON String -> Map
				Map<String, Object> jsonMap = objectMapper.readValue(result, new TypeReference<Map<String, Object>>() {});

				Map<String, Object> properties = (Map<String, Object>) jsonMap.get("properties");
				Map<String, Object> kakao_account = (Map<String, Object>) jsonMap.get("kakao_account");

				String nickname = properties.get("nickname").toString();
				String profileImage = properties.get("profile_image").toString();
				String email = kakao_account.get("email").toString();

				userInfo.put("email", email);
				userInfo.put("nickname", nickname);
				userInfo.put("profileImage", profileImage);

			} catch (Exception e) {
				e.printStackTrace();
			}

		} catch (IOException e) {
			e.printStackTrace();
		}
		return userInfo;
	}
	
	// 전화번호로 아이디 찾기
	@Override
	public Member selectMemberByTel(String memberTel) {
		return dao.selectMemberByTel(memberTel);
	}
	
	// 아이디(이메일)로 회원 찾기
	@Override
	public Member selectMemberByEmail(String memberEmail) {
		return dao.selectMemberByEmail(memberEmail);
	}
	
	// email인증 후 비밀번호 변경
	@Override
	public int changePw(Map<String, Object> paramMap) {
		paramMap.put("newMemberPw", bcrypt.encode(String.valueOf(paramMap.get("newMemberPw"))));
		return dao.changePw(paramMap);
	}
	
	// 회원 가입 서비스
	@Transactional(rollbackFor = {Exception.class})
	@Override
	public int signUp(Member inputMember) {
		
		// 입력된 비밀번호 암호화 후 다시 세팅
		inputMember.setMemberPw(bcrypt.encode(inputMember.getMemberPw()));
		
		// 회원가입 
		return dao.signUp(inputMember);
		
	}

	// 회원 BMI 히스토리 불러오기
	@Override
	public List<MemberBMI> loadBMI(Map<String, Object> paramMap) {
		return dao.loadBMI(paramMap);
	}
	
	// 회원 정보에 BMI 히스토리 추가/업데이트하기
	@Transactional(rollbackFor = {Exception.class})
	@Override
	public int addBMI(Map<String, Object> paramMap) {
		return dao.addBMI(paramMap);
	}

	// 안읽은 채팅 카운트
	@Override
	public int chattingCount(int memberNo) {
		return dao.chattingCount(memberNo);
	}
	
	// 장바구니 상품 카운트
	@Override
	public int shoppingCount(int memberNo) {
		return dao.shoppingCount(memberNo);
	}
	
	// 회원가입 이메일 인증
	@Override
	public Member selectEmail(String memberEmail) {
		return dao.selectEmail(memberEmail);
	}

	// 회원가입 이메일 인증 확인
	@Override
	public int checkKey(String memberEmail) {
		return dao.checkKey(memberEmail);
	}

	// 메인페이지 전체 게시글 인기글 조회
	@Override
	public Board trendingAll() {
		return dao.trendingAll();
	}

	// 메인페이지 정보 공유 게시판 인기글 조회
	@Override
	public Board trendingInfo() {
		return dao.trendingInfo();
	}

	// trendingRoutine
	@Override
	public Board trendingRoutine() {
		return dao.trendingRoutine();
	}

	// 메인페이지 자유 게시판 인기글 조회
	@Override
	public Board trendingFree() {
		return dao.trendingFree();
	}

	// 추천 루틴 투두리스트에 추가하기
	@Override
	public int surveyTodo(TodoList todoList) {
		return dao.surveyTodo(todoList);
	}

	// 출석 랭킹
	@Override
	public List<Member> setAttendenceRanking() {
		return dao.setAttendenceRanking();
	}

	// 투두리스트 실천 랭킹
	@Override
	public List<Member> setTodoListRanking() {
		return dao.setTodoListRanking();
	}

	// 커뮤니티 활동 랭킹
	@Override
	public List<Member> setCommunityRanking() {
		return dao.setCommunityRanking();
	}

	// 출석일 증가
	@Override
	public int attendencePlus(int memberNo) {
		return dao.attendencePlus(memberNo);
	}

}

