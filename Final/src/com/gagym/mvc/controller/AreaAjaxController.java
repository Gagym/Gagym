package com.gagym.mvc.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

import com.gagym.dto.AreaDTO;
import com.gagym.mvc.inter.IMypageMainDAO;

public class AreaAjaxController implements Controller
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
		
		String cityNo = request.getParameter("cityNo");
		
		ArrayList<AreaDTO> areaList = new ArrayList<AreaDTO>();
		
		try
		{				
			areaList = dao.areaList(cityNo);
			
			mav.addObject("areaList", areaList);
			
			mav.setViewName("/WEB-INF/myPageView/AreaAjax.jsp");
			
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
		
		return mav;
	}

}
