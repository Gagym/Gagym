package com.gagym.mvc.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

import com.gagym.dto.MemberDTO;
import com.gagym.mvc.inter.IMypageMainDAO;

public class PrivacyUpdateController implements Controller
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
		String zipCode = request.getParameter("zipCode");
		String addr = request.getParameter("addr");
		String detailAddr = request.getParameter("detailAddr");
		String tel = request.getParameter("tel");
		String hometel = request.getParameter("hometel");
		String email = request.getParameter("email");
		
		MemberDTO member = new MemberDTO();
		
		int result = 0;
		
		try
		{
				member.setMemNo(memNo);
				member.setZipCode(zipCode);
				member.setAddr(addr);
				member.setDetailAddr(detailAddr);
				member.setTel(tel);
				member.setHometel(hometel);
				member.setEmail(email);
				
				result = dao.privacyUpdate(member);
				
				if(result != 0)
				{
					// alert 띄우고 마이페이지로 가기
					mav.addObject("msg", "정보 수정이 완료되었습니다.");
		            mav.addObject("url","mypagemain.action?memNo="+memNo);
		            
		            mav.setViewName("/WEB-INF/myPageView/Alert.jsp");
				}
			
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
		
		return mav;
	}
}
