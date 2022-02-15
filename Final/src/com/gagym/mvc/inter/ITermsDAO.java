package com.gagym.mvc.inter;

import java.sql.SQLException;
import java.util.ArrayList;

import com.gagym.dto.TermsDTO;

public interface ITermsDAO
{
	public ArrayList<TermsDTO> list() throws SQLException;
}
