package com.gagym.mvc.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

import com.gagym.dto.MemberDTO;
import com.gagym.mvc.inter.IMemberDAO;

public class MemberInsertController implements Controller
{
	private IMemberDAO dao;
	
	public void setDao(IMemberDAO dao)
	{
		this.dao = dao;
	}


	@Override
	public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception
	{
		ModelAndView mav = new ModelAndView();
		
		//데이터 수신
		String zipCode = request.getParameter("zipCode");
		String addr = request.getParameter("addr");
		String detailAddr = request.getParameter("detailAddr");
		String memId = request.getParameter("memId");
		String memPw = request.getParameter("memPw");
		String memName = request.getParameter("memName");
		String ssn1 = request.getParameter("ssn1");
		String ssn2 = request.getParameter("ssn2");
		String tel = request.getParameter("tel");
		String hometel = request.getParameter("hometel");
		String email = request.getParameter("email");
		
		try
		{
			MemberDTO member = new MemberDTO();
			
			member.setZipCode(zipCode);
			member.setAddr(addr);
			member.setDetailAddr(detailAddr);
			member.setMemId(memId);
			member.setMemPw(memPw);
			member.setMemName(memName);
			member.setSsn1(ssn1);
			member.setSsn2(ssn2);
			member.setTel(tel);
			member.setHometel(hometel);
			member.setEmail(email);
			
			int result = dao.add(member);
			
			if(result != 0)
			{
				mav.setViewName("/WEB-INF/mainView/Signup_ok.jsp");
			}
			
			
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
		
		
		
		return mav;
	}

}
