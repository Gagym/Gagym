package com.gagym.mvc.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.sql.DataSource;

import com.gagym.dto.TermsDTO;
import com.gagym.mvc.inter.ITermsDAO;

public class TermsDAO implements ITermsDAO
{
	private DataSource dataSource;
	
	//setter 구성
	public void setDataSource(DataSource dataSource)
	{
		this.dataSource = dataSource;
	}
	
	//약관리스트
	public ArrayList<TermsDTO> list() throws SQLException
	{
		ArrayList<TermsDTO> result = new ArrayList<TermsDTO>();
		
		Connection conn = dataSource.getConnection();
		
		String sql = "SELECT TERMS_NO, TERMS_CONTENT, NECESSARY, ADMIN_ID, TERMS_DATE FROM TERMS ORDER BY TERMS_NO";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		
		ResultSet rs = pstmt.executeQuery();
		
		while (rs.next())
		{
			TermsDTO terms = new TermsDTO();
			
			terms.setTermsNo(rs.getString("TERMS_NO"));
			terms.setTermsContent(rs.getString("TERMS_CONTENT"));
			terms.setNecessary(rs.getString("NECESSARY"));
			terms.setAdminId(rs.getString("ADMIN_ID"));
			terms.setTermsDate(rs.getString("TERMS_DATE"));
			
			result.add(terms);
			
		}
		
		rs.close();
		pstmt.close();
		conn.close();
		
		return result;
	}
}
