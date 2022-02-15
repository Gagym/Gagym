package com.gagym.mvc.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

import com.gagym.mvc.inter.IMypageMainDAO;
import com.gagym.dto.PointDTO;

public class PayRefundController implements Controller
{
	private IMypageMainDAO dao;
	
	// setter
	public void setDao(IMypageMainDAO dao)
	{
		this.dao = dao;
	}


	@Override
	public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception
	{
		ModelAndView mav = new ModelAndView();
		
		HttpSession session = request.getSession();
		
		String memNo = (String)session.getAttribute("memNo");
		
		ArrayList<PointDTO> pointList = new ArrayList<PointDTO>();
		int havePoint = 0;
		
		try
		{
				pointList = dao.pointList(memNo);
				havePoint = dao.havePoint(memNo);
				
				mav.addObject("pointList", pointList);
				mav.addObject("havePoint", havePoint);
				
				mav.setViewName("/WEB-INF/myPageView/PayRefund.jsp");
			
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
		
		return mav;
	}

}
