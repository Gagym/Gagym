package com.gagym.mybatis.inter;

import java.util.ArrayList;

import com.gagym.dto.OnedayDTO;
import com.gagym.dto.OnedayReservationDTO;
import com.gagym.dto.PagingVO;
import com.gagym.dto.ReportDTO;

public interface IOnedayDAO
{
	// 페이징 처리 게시글 조회
	public ArrayList<OnedayDTO> list(PagingVO vo);
	
	// 게시물 총 갯수
	public int count();
	
	
	public int onedayRsvAdd(OnedayReservationDTO dto);
	
	public ArrayList<ReportDTO> reasonList();
	
	public int onedayReportAdd(ReportDTO dto);
}
