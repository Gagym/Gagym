package com.gagym.mvc.dao;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.sql.DataSource;

import com.gagym.dto.MemberDTO;
import com.gagym.mvc.inter.IMemberDAO;

public class MemberDAO implements IMemberDAO
{
	private DataSource dataSource;

	// setter 구성
	public void setDataSource(DataSource dataSource)
	{
		this.dataSource = dataSource;
	}

	//아이디체크
	@Override
	public int idCheck(String memId) throws SQLException
	{
		int result = 0;

		Connection conn = dataSource.getConnection();
		
		String sql = "SELECT COUNT(*) AS COUNT"
				+ " FROM PRIVACY"
				+ " WHERE MEM_ID = ?";

		PreparedStatement pstmt = conn.prepareStatement(sql);
		
		pstmt.setString(1, memId);

		ResultSet rs = pstmt.executeQuery();

		while (rs.next())
		{
			result = rs.getInt(1);
		}

		rs.close();
		pstmt.close();
		conn.close();

		return result;
	}

	
	
	
	// 회원 추가
	@Override
	public int add(MemberDTO member) throws SQLException
	{
		int result = 0;
		
		Connection conn = dataSource.getConnection();
		
		//ZIP_CODE, ADDR, DETAIL_ADDR, MEM_ID, MEM_PW, MEM_NAME, SSN1, SSN2, TEL, HOMETEL, EMAIL
		String sql = "{call PRC_MEMBER_PRIVACY_INSERT(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)}";
		
		
		CallableStatement cstmt = conn.prepareCall(sql);
		
		cstmt.setString(1, member.getZipCode());
		cstmt.setString(2, member.getAddr());
		cstmt.setString(3, member.getDetailAddr());
		cstmt.setString(4, member.getMemId());
		cstmt.setString(5, member.getMemPw());
		cstmt.setString(6, member.getMemName());
		cstmt.setString(7, member.getSsn1());
		cstmt.setString(8, member.getSsn2());
		cstmt.setString(9, member.getTel());
		cstmt.setString(10, member.getHometel());
		cstmt.setString(11, member.getEmail());
		
		result = cstmt.executeUpdate();
		
		cstmt.close();
		conn.close();
		
		return result;

	}
	
	
	

}
