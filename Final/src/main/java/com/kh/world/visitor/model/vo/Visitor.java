package com.kh.world.visitor.model.vo;

import java.util.Date;
import java.util.List;

import com.kh.world.member.model.vo.Member;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Visitor {
	private int visitorNo;
	
	private int rowNum; // 정렬해줄거라 필드 생성함
	
	private int minihomeNo; // 해당하는 미니홈피의 no // 얘는 나중에 미니홈No에 해당하는 멤버 정보 따로 가져오는 메소드 만들기
	
	private String reportCode;
	
	private Member writer; // 작성자의 정보 전체 다 불러오기
	
	private Date createDate;
	
	private Date modifyDate;
	
	private String content;
	
	private String secret;
	
	private String report;
	
	private String access;
	
	private String status; // 게시글 삭제 여부
	
	private List<VisitorReply> replies;
	
}
