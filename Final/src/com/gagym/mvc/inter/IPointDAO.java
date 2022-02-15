package com.gagym.mvc.inter;

import java.sql.SQLException;

import com.gagym.dto.PointDTO;

public interface IPointDAO
{
	public int add(PointDTO pointdto) throws SQLException;
}
