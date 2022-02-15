package com.gagym.mvc.inter;

import java.sql.SQLException;

import com.gagym.dto.MemberDTO;

public interface IMemberDAO
{
	public int idCheck(String memId) throws SQLException;
	public int add(MemberDTO member) throws SQLException;
}
