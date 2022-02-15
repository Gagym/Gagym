package com.gagym.mvc.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

import com.gagym.dto.AreaDTO;
import com.gagym.dto.InstructorDTO;
import com.gagym.mvc.inter.IMypageMainDAO;

public class InstructorInsertFormController implements Controller
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
		ArrayList<InstructorDTO> cerList = new ArrayList<InstructorDTO>();
		ArrayList<AreaDTO> cityList = new ArrayList<AreaDTO>();

		try
		{
			int check = dao.insInsertCheck(memNo);
			cerList = dao.cerList();
			cityList = dao.cityList();
			//areaList = dao.areaList();
			
			
			if(check == 1 )
			{
				mav.addObject("cerList", cerList);
				mav.addObject("cityList", cityList);
				mav.setViewName("/WEB-INF/myPageView/InstructorInsertForm.jsp");
			}
			else
			{
				// alert 띄우고 메인 페이지로 가기
				mav.addObject("msg","강사신청 중이거나 이미 강사입니다.");
	            mav.addObject("url","mypagemain.action");
	            
	            mav.setViewName("/WEB-INF/myPageView/Alert.jsp");
			}

		} catch (Exception e)
		{
			System.out.println(e.toString());
		}

		return mav;
	}
}
