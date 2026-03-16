package com.kh.world.join.model.service;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.kh.world.join.model.mapper.JoinMapper;
import com.kh.world.member.model.mapper.MemberMapper;
import com.kh.world.member.model.vo.Member;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class ApiServiceImpl implements ApiService {
	@Autowired
	private JoinMapper joinMapper;
	
	@Autowired
	private MemberMapper memberMapper;
	
	
	// 토큰 가져오는 경로 설정
	@Override
    public String getReturnAccessToken(String code) {
        String access_token = "";
        String refresh_token = "";
        String reqURL = "https://kauth.kakao.com/oauth/token";

       try {
           URL url = new URL(reqURL);
           HttpURLConnection conn = (HttpURLConnection) url.openConnection();

            //HttpURLConnection 설정 값 셋팅
            conn.setRequestMethod("POST");
            conn.setDoOutput(true);


            // buffer 스트림 객체 값 셋팅 후 요청
            BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()));
            StringBuilder sb = new StringBuilder();
            sb.append("grant_type=authorization_code");
            sb.append("&client_id=39be0ccce234d1e59c07fed79f06230f");  // REST API 키
            sb.append("&redirect_uri=http://localhost:8088/final/api/kakaoLogin"); // 앱 CALLBACK 경로
            sb.append("&code=" + code);
            bw.write(sb.toString());
            bw.flush();

            //  RETURN 값 result 변수에 저장
            BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
            String br_line = "";
            String result = "";

            while ((br_line = br.readLine()) != null) {
                result += br_line;
            }

            JsonParser parser = new JsonParser();
            JsonElement element = parser.parse(result);


            // 토큰 값 저장 및 리턴
            access_token = element.getAsJsonObject().get("access_token").getAsString();
            refresh_token = element.getAsJsonObject().get("refresh_token").getAsString();

            br.close();
            bw.close();
        } catch (IOException e) {
            e.printStackTrace();
        }

        return access_token;
    }
	
	// 토큰 받아서 정보 확인
	@Override
    public Map<String,Object> getUserInfo(String access_token) {
        Map<String,Object> resultMap = new HashMap<>();
        String email = null;
        String reqURL = "https://kapi.kakao.com/v2/user/me";
        
         try {
             URL url = new URL(reqURL);
             HttpURLConnection conn = (HttpURLConnection) url.openConnection();
             conn.setRequestMethod("GET");

            //요청에 필요한 Header에 포함될 내용
             conn.setRequestProperty("Authorization", "Bearer " + access_token);

             int responseCode = conn.getResponseCode();
             System.out.println("responseCode : " + responseCode);

             BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));

             String br_line = "";
             String result = "";

             while ((br_line = br.readLine()) != null) {
                 result += br_line;
             }
            System.out.println("response:" + result);


             JsonParser parser = new JsonParser();
             JsonElement element = parser.parse(result);
             log.warn("element:: " + element);
             JsonObject properties = element.getAsJsonObject().get("properties").getAsJsonObject();
             JsonObject kakao_account = element.getAsJsonObject().get("kakao_account").getAsJsonObject();
             log.warn("id:: "+element.getAsJsonObject().get("id").getAsString());
             String id = element.getAsJsonObject().get("id").getAsString();
             String nickname = properties.getAsJsonObject().get("nickname").getAsString();
//             String email = kakao_account.getAsJsonObject().get("email").getAsString();
            
             // 이메일이 선택사항이라 이메일이 없으면 null로 바꿔주기
             if(kakao_account.getAsJsonObject().get("email") == null) {
            	 email = null;
             } else {
            	 email = kakao_account.getAsJsonObject().get("email").getAsString();
             }
             
             log.warn("email:: " + email);
             resultMap.put("nickname", nickname); // 이름
             resultMap.put("id", id); // id
             resultMap.put("email", email); // 이메일 

             
         } catch (IOException e) {
             e.printStackTrace();
         }
         return resultMap;
     }


	
	@Override
	public void getLogout(String kakaoCheck) {
		String reqURL = "https://kapi.kakao.com/v1/user/logout";
		
		try {
			URL url = new URL(reqURL);
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			conn.setRequestMethod("POST");
			
			conn.setRequestProperty("Authorization", "Bearer " + kakaoCheck);
			int responseCode = conn.getResponseCode();
			System.out.println("responseCode : " + responseCode);
			
			if(responseCode == 400)
				throw new RuntimeException("카카오 로그아웃 도중 오류 발생");
			
			BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
			
			String br_line = "";
			String result = "";
			while((br_line = br.readLine()) != null) {
				result += br_line;
			}
			
			System.out.println("결과");
			System.out.println(result);
			
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}

	// 연결 끊기 (탈퇴)
	@Override
	public void unlink(String kakaoCheck) {
	    String reqURL = "https://kapi.kakao.com/v1/user/unlink";
	    try {
	        URL url = new URL(reqURL);
	        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
	        conn.setRequestMethod("POST");
	        conn.setRequestProperty("Authorization", "Bearer " + kakaoCheck);
	        
	        int responseCode = conn.getResponseCode();
	        System.out.println("responseCode : " + responseCode);
	        
	        BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
	        
	        String result = "";
	        String line = "";
	        
	        while ((line = br.readLine()) != null) {
	            result += line;
	        }
	        System.out.println(result);
	    } catch (IOException e) {
	        e.printStackTrace();
	    }
	}

	// 카카오 아이디 찾기
	@Override
	public Member findMemberKakaoById(String kakaoId) {
		
		return memberMapper.selectMemberById(kakaoId);
	}

	@Override
	@Transactional
	public int insertKakaoMember(Member member) {
		
		return joinMapper.insertKakaoMember(member);
	}
	
	
	
	

}
