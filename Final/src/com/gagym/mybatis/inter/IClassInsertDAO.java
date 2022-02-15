package com.gagym.mybatis.inter;

import java.util.ArrayList;

import com.gagym.dto.ClassDTO;
import com.gagym.dto.InstructorDTO;
import com.gagym.dto.SportDTO;
import com.gagym.dto.TimeDTO;

public interface IClassInsertDAO
{
	//운동종목
	public ArrayList<SportDTO> sportList(); 
	
	//강좌개설시간
	public ArrayList<TimeDTO> timeList();
	
	//강좌등록
	public int add(ClassDTO cla);							
	
}
