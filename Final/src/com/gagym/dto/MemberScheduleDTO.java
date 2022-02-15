package com.gagym.dto;

public class MemberScheduleDTO
{
	// 강좌(원데이)번호, 예약날짜
	private String rsvNo, rsvDate;
	
	// 회원번호, 강좌(원데이)명, 강사명, 강사아이디
	private String memNo, className, insName, insId;
	
	// 수락처리일자, 예약취소일자, 수강완료일자
	private String reqDate, cnlDate, comDate;
	
	// 예약타임
	private int rsvTime;
}
