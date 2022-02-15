package com.gagym.mvc.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

import com.gagym.mvc.inter.IMemberDAO;

public class IdcheckController implements Controller
{
	//인터페이스 형태의 속성 구성
	private IMemberDAO dao;
	
	//setter 구성
	public void setDao(IMemberDAO dao)
	{
		this.dao = dao;
	}
	
	@Override
	public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception
	{
		ModelAndView mav = new ModelAndView();
		
		String memId = request.getParameter("memId");
		
		try
		{
			int idCheck = dao.idCheck(memId);
			
			mav.addObject("idCheck", idCheck);
			
			mav.setViewName("/WEB-INF/mainView/IdCheck_ok.jsp");
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
		
		
		return mav;
	}

}
