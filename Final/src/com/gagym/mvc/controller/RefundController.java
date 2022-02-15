package com.gagym.mvc.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

import com.gagym.mvc.inter.IMypageMainDAO;

public class RefundController implements Controller
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
		String pointPayNo = request.getParameter("pointPayNo");
		int pointPay = Integer.parseInt(request.getParameter("pointPay"));
		
		int result = 0;
		
		try
		{
			result = dao.refundAdd(pointPayNo, pointPay);
			
			if(result != 0)
			{
				// alert 띄우고 마이페이지로 가기
				mav.addObject("msg", "환불이 완료되었습니다.");
	            mav.addObject("url","payrefund.action?memNo="+memNo);
	            
	            mav.setViewName("/WEB-INF/myPageView/Alert.jsp");
			}
			
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
		
		return mav;
	}
}
