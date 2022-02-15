package com.gagym.mvc.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

import com.gagym.mvc.inter.ILoginDAO;

public class LoginController implements Controller
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
		
		// 데이터 수신(→ LoginForm.jsp 페이지로부터 넘어온 데이터 → id, pw, admin)
		String memId = request.getParameter("memId");
		String memPw = request.getParameter("memPw");
		String admin = request.getParameter("admin");
		
		String memNo = null;
		String insNo = null;
		String adminId = null;
		
		try
		{
			if (admin == null)
			{
				memNo = dao.login(memId, memPw);
				insNo = dao.searchInsNo(memNo);
			}
			else
			{
				adminId = dao.logAdmin(memId, memPw);
			}
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
		
		
		// 로그인 수행에 따른 성공 여부 확인 및 구분/분기
		if (memNo==null && adminId==null)
		{
			// 로그인 실패 → 로그인 폼을 다시 요청할 수 있도록 안내
			mav.setViewName("redirect:loginform.action");
			
		}
		else
		{
			// 로그인 성공 → 세션 구성 → 라스트 페이지를 다시 요청할 수 있도록 안내
			HttpSession session = request.getSession();
			session.setAttribute("memNo", memNo);
			session.setAttribute("insNo", insNo);
			
			// 관리자인지의 여부 확인
			if (admin==null)	//-- 일반 직원으로 로그인을 성공한 상황
			{
				mav.setViewName("main.action");
			} 
			else				//-- 관리자로 로그인을 성공한 상황
			{
				session.setAttribute("admin", adminId);
				mav.setViewName("main.action");
			}

		}
		
		return mav;
	}

}
