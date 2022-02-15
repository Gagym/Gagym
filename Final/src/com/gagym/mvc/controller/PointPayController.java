package com.gagym.mvc.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

public class PointPayController implements Controller
{
	@Override
	public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception
	{
		ModelAndView mav = new ModelAndView();
		
		HttpSession session = request.getSession();
		
		String memNo = (String)session.getAttribute("memNo");
		
		int point = Integer.parseInt(request.getParameter("point"));
		int pointPay=0;
		
		
		try
		{

			switch (point)
			{
			case 50:pointPay = 60000;
					break;
			case 100:pointPay = 110000;
				break;
			case 300:pointPay = 320000;
					break;
			case 500:pointPay = 530000;

			default:
				break;
			}
			
				mav.addObject("point", point);
				mav.addObject("pointPay", pointPay);
				mav.addObject("memNo",memNo);
				
				mav.setViewName("/WEB-INF/myPageView/PointPay.jsp");
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
		
		
		
		return mav;
	}

}
