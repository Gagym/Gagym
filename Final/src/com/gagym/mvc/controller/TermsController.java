package com.gagym.mvc.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

import com.gagym.dto.TermsDTO;
import com.gagym.mvc.inter.ITermsDAO;

public class TermsController implements Controller
{
	private ITermsDAO dao;
	
	public void setDao(ITermsDAO dao)
	{
		this.dao = dao;
	}


	@Override
	public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception
	{
		ModelAndView mav = new ModelAndView();
		
		ArrayList<TermsDTO> termsList = new ArrayList<TermsDTO>();
		
		try
		{
			termsList = dao.list();
			mav.addObject("termsList", termsList);
			mav.setViewName("/WEB-INF/mainView/Terms.jsp");
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
		
		
		return mav;
	}

}