package com.kh.world.diary.model.vo;

import java.util.Date;

import com.kh.world.member.model.vo.Member;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class DiaryReply {

	private int dreNo;
	
	private int dNo; // 미니홈피의 Primay Key - no
	
	private int writer;
	
	private String content;
	
	private Date createDate;
	
	private Date modifyDate;

	private Date secret;
	
	private String status;
	
	private int group; // 댓글이 속한 댓글 번호 

	private int depth; // 모 댓글이면 0 답글이면 1 // 댓글과 대댓글 들을 구성하기 위한 계층

	private int order; // 같은 그룹 중에 순서 (계층(class))
	
	private Member member;
	
}
