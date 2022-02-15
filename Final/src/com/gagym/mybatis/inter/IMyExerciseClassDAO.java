package com.gagym.mybatis.inter;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import com.gagym.dto.ClassReservationDTO;
import com.gagym.dto.DisputeDTO;
import com.gagym.dto.ReviewDTO;

public interface IMyExerciseClassDAO
{
	public ArrayList<ClassReservationDTO> myExerciseClass(String memNo);
	
	public int autoReject();
	
	
	public String cnlCheck(String classRsvNo);
	
	public int classCancel(ClassReservationDTO dto);

	
	public int classComplete(String classRsvNo);

	
	public int classReviewAdd(ReviewDTO dto);
	
	public ReviewDTO classInfo(String classComNo);
	
	public ReviewDTO classReview(String reviewNo);
	
	
	public ClassReservationDTO classInfo2(String classRsvNo);

	public int classDisputeAdd(DisputeDTO dto);
}
