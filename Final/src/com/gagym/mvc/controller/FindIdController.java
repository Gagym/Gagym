/*==========================
 * FindIdController.java
 * 작성자 : 손범석
 */


package com.gagym.mvc.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

import com.gagym.mvc.inter.ILoginDAO;

// ※ Spring 의 『Controller』 인터페이스를 구현하는 방법을 통해
//		사용자 정의 컨트롤러 클래스를 구성한다.
public class FindIdController implements Controller
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
		
		String memName = request.getParameter("memName");
		String ssn1 = request.getParameter("ssn1");
		String ssn2 = request.getParameter("ssn2");
		
		try
		{
			
			String id = null;
			id = dao.findId(memName, ssn1, ssn2);
			
			if(id==null)
			{
				mav.setViewName("redirect:loginform.action");
			}
			else
			{
				mav.addObject("id", id);
				mav.setViewName("/WEB-INF/mainView/findIdAfter.jsp");
			}

			
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
		
		
		return mav;
	}

	
	
	
	
}
