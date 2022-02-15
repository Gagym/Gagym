package com.gagym.mybatis.inter;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import com.gagym.dto.ClassReservationDTO;
import com.gagym.dto.ExerciseLogDTO;
import com.gagym.dto.MissionDTO;

public interface IMyExerciseMainDAO
{
	public ArrayList<ClassReservationDTO> classSchedule(@Param("memNo") String memNo, @Param("date") String date);
	public ArrayList<MissionDTO> missionSchedule(@Param("memNo") String memNo, @Param("date") String date);
	public ArrayList<ExerciseLogDTO> exelogSchedule(@Param("memNo") String memNo, @Param("date") String date);
	
	public int missionComplete(String missionExeNo);
	
	public ArrayList<ClassReservationDTO> scheduleBar(@Param("memNo") String memNo, @Param("yearMonth") String yearMonth);

}
