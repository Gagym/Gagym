/*==========================
 * FindPwAfterController.java
 * - 사용자 정의 컨트롤러
 */


package com.gagym.mvc.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

import com.gagym.mvc.inter.ILoginDAO;

// ※ Spring 의 『Controller』 인터페이스를 구현하는 방법을 통해
//		사용자 정의 컨트롤러 클래스를 구성한다.
public class FindPwChangeController implements Controller
{
	private ILoginDAO dao;
	
	
	public void setDao(ILoginDAO dao)
	{
		this.dao = dao;
	}


	@Override
	public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception
	{
		ModelAndView mav = new ModelAndView();
		
		String memPw = request.getParameter("memPw");
		String memNo = request.getParameter("memNo");
		
		try
		{
			System.out.println(memNo);
			
			dao.modifyPw(memPw, memNo);
			
			mav.addObject("memNo", memNo);
			mav.setViewName("/WEB-INF/mainView/findPwAfter.jsp");
			
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
		
		return mav;
	}

	
	
	
	
}
