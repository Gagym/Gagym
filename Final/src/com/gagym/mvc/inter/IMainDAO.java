package com.gagym.mvc.inter;

import java.sql.SQLException;
import java.util.ArrayList;

import com.gagym.dto.ClassDTO;
import com.gagym.dto.InstructorDTO;
import com.gagym.dto.OnedayDTO;

public interface IMainDAO
{
	public ArrayList<ClassDTO> classList() throws SQLException;
	public ArrayList<InstructorDTO> insList() throws SQLException;
	public ArrayList<OnedayDTO> onedayList() throws SQLException;
}
