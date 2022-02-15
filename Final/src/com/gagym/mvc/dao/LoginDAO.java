package com.gagym.mvc.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.sql.DataSource;

import com.gagym.mvc.inter.ILoginDAO;

public class LoginDAO implements ILoginDAO
{
	private DataSource dataSource;

	public void setDataSource(DataSource dataSource)
	{
		this.dataSource = dataSource;
	}

	//관리자 로그인
	@Override
	public String logAdmin(String id, String pw) throws SQLException
	{
		String result = null;
		
		Connection conn = dataSource.getConnection();
		
		String sql = "SELECT ADMIN_ID"
				+ " FROM ADMIN"
				+ " WHERE ADMIN_ID = ?"
				+ " AND ADMIN_PW = ?";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, id);
		pstmt.setString(2, pw);
		
		ResultSet rs = pstmt.executeQuery();
		
		while (rs.next())
			result = rs.getString("ADMIN_ID");
		
		rs.close();
		pstmt.close();
		conn.close();
		
		return result;
	}

	//일반회원 로그인
	@Override
	public String login(String id, String pw) throws SQLException
	{
		String result = null;
		
		Connection conn = dataSource.getConnection();
		
		String sql = "SELECT MEM_NO"
				+ " FROM PRIVACY"
				+ " WHERE MEM_ID = ?"
				+ " AND MEM_PW = ?";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, id);
		pstmt.setString(2, pw);
		
		ResultSet rs = pstmt.executeQuery();
		
		while (rs.next())
			result = rs.getString("MEM_NO");
		
		rs.close();
		pstmt.close();
		conn.close();
		
		return result;
	}
	
	// 회원번호로 강사번호 찾기
	@Override
	public String searchInsNo(String memNo) throws SQLException
	{
		String result = "";
		
		Connection conn = dataSource.getConnection();
		
		String sql = "SELECT FN_INS_NO(?) AS INS_NO"
				+ " FROM PRIVACY"
				+ " WHERE MEM_NO=?";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, memNo);
		pstmt.setString(2, memNo);
		
		ResultSet rs = pstmt.executeQuery();
		
		if (rs.next())
			result = rs.getString("INS_NO");
		
		rs.close();
		pstmt.close();
		conn.close();
		
		return result;
		
	}
	
	
	// 아이디 찾기
	@Override
	public String findId(String name, String ssn1, String ssn2) throws SQLException
	{
		String result = "";
		
		Connection conn = dataSource.getConnection();
		
		String sql = "SELECT MEM_ID"
				+ " FROM PRIVACY"
				+ " WHERE MEM_NAME=?"
				+ " AND SSN1=?"
				+ " AND SSN2= CRYPTPACK.ENCRYPT(?, ?)";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		
		pstmt.setString(1, name);
		pstmt.setString(2, ssn1);
		pstmt.setString(3, ssn2);
		pstmt.setString(4, ssn2);
		
		ResultSet rs = pstmt.executeQuery();
		
		if(rs.next())
			result = rs.getString(1);

		rs.close();
		pstmt.close();
		conn.close();
		
		return result;
	}

	// 비밀번호 찾기
	@Override
	public String findPw(String id, String name, String ssn1, String ssn2) throws SQLException
	{
		String result = null;
		
		Connection conn = dataSource.getConnection();
		
		String sql = "SELECT MEM_NO"
				+ " FROM PRIVACY"
				+ " WHERE MEM_ID=?"
				+ " AND MEM_NAME=?"
				+ " AND SSN1=?"
				+ " AND SSN2= CRYPTPACK.ENCRYPT(?, ?)";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		
		pstmt.setString(1, id);
		pstmt.setString(2, name);
		pstmt.setString(3, ssn1);
		pstmt.setString(4, ssn2);
		pstmt.setString(5, ssn2);
		
		ResultSet rs = pstmt.executeQuery();
		
		if(rs.next())
			result = rs.getString("MEM_NO");

		rs.close();
		pstmt.close();
		conn.close();
		
		return result;
	}

	//비밀번호 수정
   	@Override
   	public int modifyPw(String pw, String no) throws SQLException
   	{
		int result = 0;
      
		Connection conn = dataSource.getConnection();
		String sql = "UPDATE PRIVACY SET MEM_PW=? WHERE MEM_NO=?";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, pw);
		pstmt.setString(2, no);
      
		result = pstmt.executeUpdate();
      
		pstmt.close();
		conn.close();
      
		return result;
   	}
	


}
