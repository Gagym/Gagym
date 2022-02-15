
package com.gagym.mvc.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

import com.gagym.mvc.inter.IMypageMainDAO;
import com.gagym.dto.InbodyDTO;

public class InbodyInsertController implements Controller
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
		Double weight = Double.parseDouble(request.getParameter("weight"));
		Double tall = Double.parseDouble(request.getParameter("tall"));
		Double muscle = Double.parseDouble(request.getParameter("muscle"));
		Double bodyfat = Double.parseDouble(request.getParameter("bodyfat"));
		Double bodyfatPer = Double.parseDouble(request.getParameter("bodyfatPer"));
		
		try
		{
			InbodyDTO inbody = new InbodyDTO();
			
			inbody.setMemNo(memNo);
			inbody.setWeight(weight);
			inbody.setTall(tall);
			inbody.setMuscle(muscle);
			inbody.setBodyfat(bodyfat);
			inbody.setBodyfatPer(bodyfatPer);
			
			dao.inbodyAdd(inbody);
			
			mav.setViewName("redirect:mypagemain.action?memNo="+memNo);	
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
		
		return mav;
	}

}
