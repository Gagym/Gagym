package com.gagym.mvc.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

import com.gagym.mvc.inter.IMypageMainDAO;

public class WithdrawalCheckController implements Controller
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
		String pwdCheck = request.getParameter("pwdCheck");
		
		try
		{
			int result = dao.checkPw(memNo, pwdCheck);
			
			if(result==1) //비밀번호 일치
			{
				// 탈퇴 가능여부 확인(예약 중인 강좌, 원데이클래스 존재여부)
				int check1 = dao.withdrawCheckClass(memNo);
				int check2 = dao.withdrawCheckOneday(memNo);
				
				// 탈퇴 가능
				if(check1 + check2 == 0)	
				{
					mav.addObject("memNo", memNo);
					mav.setViewName("/WEB-INF/myPageView/WithdrawalReason.jsp");
				}
				else
				{
					// 탈퇴 불가
					String msg = "예약 중인 ";
	
					if(check1 == 1)
					{
						msg += "[강좌] ";
					}
					if(check2 == 1)
					{
						msg += "[원데이클래스] ";
					}
					msg += "가 존재합니다.";
					
					// alert 띄우고 마이페이지로 가기
					mav.addObject("msg", msg);
		            mav.addObject("url","mypagemain.action?memNo="+memNo);
		            
		            mav.setViewName("/WEB-INF/myPageView/Alert.jsp");
				}
				
			}
			else if(result==0) //비밀번호 불일치
			{
				// alert 띄우고 원래 페이지로 가기
				mav.addObject("msg","비밀번호가 틀렸습니다.");
	            mav.addObject("url","withdrawalform.action?memNo="+memNo);
	            
	            mav.setViewName("/WEB-INF/myPageView/Alert.jsp");

			}
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
		
		return mav;
	}
	
}
