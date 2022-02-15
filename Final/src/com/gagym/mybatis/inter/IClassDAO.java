package com.gagym.mybatis.inter;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.annotations.Param;

import com.gagym.dto.ClassDTO;
import com.gagym.dto.ClassScheduleDTO;
import com.gagym.dto.InstructorScheduleDTO;
import com.gagym.dto.OnedayDTO;
import com.gagym.dto.PagingVO;
import com.gagym.dto.ReportDTO;

public interface IClassDAO
{
	//강좌 리스트(정렬)
	//public ArrayList<ClassDTO> classList(String order);
	
	// 페이징 처리 게시글 조회
	public ArrayList<ClassDTO> classList(@Param("order") String order, @Param("vo") PagingVO vo);
	
	// 게시물 총 갯수
	public int count();
	
	//강좌 상세보기
	public ClassDTO classView(String classNo);
	
	//강좌 누적 수강인원
	public int counts(String classNo);
	
	//강좌 스케줄 상세보기 (추가)
	public ArrayList<ClassScheduleDTO> schedules(HashMap<String, String> map);
	public ArrayList<ClassScheduleDTO> scheduleBars(HashMap<String, String> map);
	public ArrayList<ClassScheduleDTO> scheduleTime(@Param("insNo") String insNo, @Param("date") String date);
	
	
	//신고사유 리스트
	public ArrayList<ReportDTO> reasonList();
	
	//강좌 신고 등록
	public int add(ReportDTO report);

}
