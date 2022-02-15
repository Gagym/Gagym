package com.gagym.mvc.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

import com.gagym.dto.ClassDTO;
import com.gagym.dto.InstructorDTO;
import com.gagym.dto.OnedayDTO;
import com.gagym.mvc.inter.IMainDAO;



public class MainListController implements Controller
{
	private IMainDAO dao;

	public void setDao(IMainDAO dao)
	{
		this.dao = dao;
	}

	public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response)
	{
		ModelAndView mav = new ModelAndView();
		
		ArrayList<OnedayDTO> onedayList = new ArrayList<OnedayDTO>();
		ArrayList<ClassDTO> classList = new ArrayList<ClassDTO>();
		ArrayList<InstructorDTO> insList = new ArrayList<InstructorDTO>();
		try
		{
			
			  onedayList = dao.onedayList();
			  classList = dao.classList();
			  insList = dao.insList();
			  
			  mav.addObject("onedayList", onedayList);
			  mav.addObject("classList", classList);
			  mav.addObject("insList", insList);
			  
			  mav.setViewName("/WEB-INF/mainView/Main.jsp");
			 
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
		
		
		return mav;
	}
}
