package com.gagym.mvc.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.sql.DataSource;

import com.gagym.dto.PointDTO;
import com.gagym.mvc.inter.IPointDAO;

public class PointDAO implements IPointDAO
{
	private DataSource dataSource;

	public void setDataSource(DataSource dataSource)
	{
		this.dataSource = dataSource;
	}

	
	//결제 추가
	@Override
	public int add(PointDTO pointdto) throws SQLException
	{
		int result = 0;
		
		Connection conn = dataSource.getConnection();
		
		String sql = "INSERT INTO POINTPAY(POINTPAY_NO, MEM_NO, PAYDATE, PAYOK_ID, POINT)"
				   + " VALUES('POINTPAY-' || SEQ_POINTPAY.NEXTVAL, ?"
				   + ", SYSDATE, SEQ_POINT_CODE.NEXTVAL, ?)";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, pointdto.getMemNo());
		pstmt.setInt(2, pointdto.getPoint());
		
		result = pstmt.executeUpdate();
		
		pstmt.close();
		conn.close();
		
		return result;
	}
	
	

}
