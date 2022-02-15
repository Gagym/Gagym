package com.gagym.mvc.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

import com.gagym.dto.PointDTO;
import com.gagym.mvc.inter.IPointDAO;

public class PointPayokController implements Controller
{
	private IPointDAO dao;
	
	public void setDao(IPointDAO dao)
	{
		this.dao = dao;
	}

	@Override
	public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception
	{
		ModelAndView mav = new ModelAndView();
		
		HttpSession session = request.getSession();
		
		String memNo = (String)session.getAttribute("memNo");
		
		int point = Integer.parseInt(request.getParameter("point"));
		
		
		try
		{
			PointDTO pointdto = new PointDTO();
			
			pointdto.setPoint(point);
			pointdto.setMemNo(memNo);
			
			int result = dao.add(pointdto);
			
			if(result != 0)
			{
				mav.setViewName("/WEB-INF/myPageView/PointPay_ok.jsp");
			}
			
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
		
		return mav;
	}

}
