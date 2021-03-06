package com.gagym.mybatis.inter;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.annotations.Param;

import com.gagym.dto.AreaDTO;
import com.gagym.dto.ClassDTO;
import com.gagym.dto.InstructorDTO;
import com.gagym.dto.InstructorScheduleDTO;
import com.gagym.dto.ReviewDTO;
import com.gagym.dto.ScheduleChangeDTO;

public interface IInstructorDAO
{
	public InstructorDTO profile(String insNo);
	public String searchReq(String insNo);
	public ArrayList<InstructorDTO> areas(String reqNo);
	public ArrayList<InstructorDTO> experiences(String reqNo);
	public ArrayList<InstructorDTO> prizes(String reqNo);
	public ArrayList<InstructorDTO> certificates(String reqNo);
	public int follower(String insNo);
	public double grade(String insNo);
	public ReviewDTO nowClass(String insNo);

	public ArrayList<ReviewDTO> reviews(String insNo);
	public ArrayList<InstructorScheduleDTO> schedules(HashMap<String, String> map);
	public ArrayList<InstructorScheduleDTO> scheduleBars(HashMap<String, String> map);
	public InstructorScheduleDTO schedulePrivacys(String memNo);
	public InstructorScheduleDTO classTime(String classNo);
	public ScheduleChangeDTO scheduleChange(ScheduleChangeDTO dto);
	public ArrayList<InstructorDTO> cerList();
	public ArrayList<AreaDTO> cityList();
	public ArrayList<AreaDTO> areaList(String cityNo);
	public int insCerAdd(HashMap<String, String> map);
	public int insPrzAdd(HashMap<String, String> map);
	public int insExpAdd(HashMap<String, String> map);
	public int insAreaAdd(HashMap<String, String> map);
	
	// 강사의 강좌 내역 조회
	public ArrayList<ClassDTO> insMyClass(String insNo);
	
	// 현재 진행중인 강좌 연장
	public int classExtend(@Param("classNo") String classNo, @Param("endDate")String endDate);
}
