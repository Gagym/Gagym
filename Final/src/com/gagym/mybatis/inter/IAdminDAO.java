package com.gagym.mybatis.inter;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import com.gagym.dto.InstructorCalcDTO;
import com.gagym.dto.InstructorDTO;
import com.gagym.dto.MemberDTO;

public interface IAdminDAO
{
	// 회원관리 - 회원정보
	public ArrayList<MemberDTO> memberList();
	
	public int countReport(String memNo);
	
	public String blackCheck(String memNo);

	public int black(@Param("memNo") String memNo, @Param("adminId") String adminId);
	
	public int blackCancel(String memNo);
	
	// 회원관리 - 강사정보
	public ArrayList<InstructorDTO> insList();
	
	public String nowClass(String insNo);
	
	public int insDrop(InstructorDTO dto);
	
	
	public ArrayList<InstructorDTO> insReqList();
	
	public ArrayList<InstructorDTO> areas(String reqNo);
	
	public ArrayList<InstructorDTO> experiences(String reqNo);
	
	public ArrayList<InstructorDTO> prizes(String reqNo);
	
	public ArrayList<InstructorDTO> certificates(String reqNo);
	
	public int insReqOk(InstructorDTO dto);
	
	public int insReqNo(InstructorDTO dto);
	
	// 정산 - 강사 정산리스트
	public ArrayList<InstructorCalcDTO> insCalcList();
	public ArrayList<InstructorCalcDTO> insCalcList_p(@Param("s_date") String s_date, @Param("e_date") String e_date);
}
