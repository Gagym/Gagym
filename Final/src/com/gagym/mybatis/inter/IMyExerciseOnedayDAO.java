package com.gagym.mybatis.inter;

import java.util.ArrayList;

import com.gagym.dto.MemberDTO;
import com.gagym.dto.OnedayDTO;
import com.gagym.dto.OnedayReservationDTO;
import com.gagym.dto.ReportDTO;
import com.gagym.dto.SportDTO;
import com.gagym.dto.TimeDTO;

public interface IMyExerciseOnedayDAO
{
	public ArrayList<OnedayDTO> myExerciseOneday(String memNo);
	
	public OnedayDTO onedayContent(String onedayNo);
	
	public MemberDTO onedayPrivacy(String memNo);
	
	
	public ArrayList<OnedayDTO> myOnedayReservation(String onedayNo);
	
	public String fixCheck(String onedayNo);
	
	public int onedayFixAdd(String rsvNo);
	
	
	public ArrayList<SportDTO> sportList();
	
	public ArrayList<TimeDTO> timeList();
	
	public int onedayAdd(OnedayDTO dto);
	
	
	public int onedayRemove(String onedayNo);
	
}
