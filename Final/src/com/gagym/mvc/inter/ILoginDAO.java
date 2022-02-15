package com.gagym.mvc.inter;

import java.sql.SQLException;

public interface ILoginDAO
{
	public String logAdmin(String id, String pw) throws SQLException;
	public String login(String id, String pw) throws SQLException;
	public String searchInsNo(String memNo) throws SQLException;
	public String findId(String name, String ssn1, String ssn2) throws SQLException;
	public String findPw(String id, String name, String ssn1, String ssn2) throws SQLException;
	public int modifyPw(String pw, String no) throws SQLException;
}
