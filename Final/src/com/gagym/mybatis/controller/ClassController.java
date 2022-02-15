package com.gagym.mybatis.controller;


import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.gagym.dto.ClassDTO;
import com.gagym.dto.ClassScheduleDTO;
import com.gagym.dto.PagingVO;
import com.gagym.dto.ReportDTO;
import com.gagym.mybatis.inter.IClassDAO;

@Controller
public class ClassController
{
	@Autowired
	private SqlSession sqlSession;
	
	
	//강좌리스트
	@RequestMapping(value = "/classlist.action", method = RequestMethod.GET)
	public String classList(Model model, PagingVO vo, String nowPage, String cntPerPage, String order)
	{	
		//정렬
		if(order.equals(""))
		{
			order = "CLASS_DATE";
		}
		
		IClassDAO dao = sqlSession.getMapper(IClassDAO.class);
		
		//게시글 총 갯수
		int total = dao.count();

		//현재페이지, 페이지당 글 갯수 null 이라면
		//처음 리스트 진입
		if (nowPage == null && cntPerPage == null) 
		{
			nowPage = "1";						
			cntPerPage = "10";
		}
		else if (nowPage == null) 
		{
			nowPage = "1";
		}
		//nowPage = "1" 보낼때 (사용) nowPage는 정해져있고 cntPerPage 없을때 cntPerPage = "10" 하겠다.
		else if (cntPerPage == null) 
		{ 
			cntPerPage = "10";
		}
		
		
		ArrayList<ClassDTO> classList = new ArrayList<ClassDTO>();
		
		//System.out.println(total + "-" + nowPage + "-" + cntPerPage);
		
		vo = new PagingVO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
		
		//order 를 dao에 넘겨서 나온 결과를 classList에 담아서 사용
		classList = dao.classList(order, vo);
		
		model.addAttribute("classList", classList);
		model.addAttribute("order", order);
		model.addAttribute("paging", vo);
		
		return "/WEB-INF/classView/Class.jsp";
		
	}
	
	
	//강좌상세정보   회원아니면 들어오지 못함
	@RequestMapping(value = "/classview.action", method = RequestMethod.GET)
	public String classView(String classNo, Model model, HttpSession session, HttpServletRequest request)
	{
		//sqlSession 의 getMapper() 메소드로 취득
		IClassDAO dao = sqlSession.getMapper(IClassDAO.class);
		
		//try 작성
		try
		{
			//session 에 있는 getAttribute 로 memNo를 받아와서 String memNo 로 다시 넣기
			String memNo = (String)session.getAttribute("memNo");
			
			//로그인후에 강좌상세정보 보기 가능
			if (memNo==null)
			{
				model.addAttribute("msg","로그인 후 이용가능합니다.");
				model.addAttribute("url","login.action");
	            
	            return "/WEB-INF/myPageView/Alert.jsp";
			}
			
			//dto 객체 생성
			ClassDTO cla = new ClassDTO();
			
			//classNo 를 dao에 넘겨서 나온결과를 cla 에 담아서 사용
			cla = dao.classView(classNo);
			
			//model에 cla를 "cla" 이름으로 추가, 뷰에서 "cla"으로 사용
			model.addAttribute("cla",cla);
			
			model.addAttribute("counts", dao.counts(classNo));
			
			JSONArray arr = new JSONArray();
			
			JSONObject obj = new JSONObject();
			obj.put("category", null);
			obj.put("rsvDate", null);
			
			arr.add(obj);
			
			model.addAttribute("json", arr.toJSONString());
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
	
		return "/WEB-INF/classView/ClassView.jsp";
		
	}
	
	//강좌 스케줄 상세보기
	@RequestMapping(value = "/classscheduleajax.action", method = RequestMethod.GET)
	public String ScheduleAjax(Model model, String startTime, String endTime, String insNo, String date)
	{
		IClassDAO dao = sqlSession.getMapper(IClassDAO.class);
		
		ArrayList<ClassScheduleDTO> arr = dao.scheduleTime(insNo, date);
		
		model.addAttribute("startTime", startTime);
		model.addAttribute("endTime", endTime);
		model.addAttribute("rsvTimeList", arr);
		
		//System.out.println(arr.get(0).getRsvTime());
		
		return "/WEB-INF/classView/ClassScheduleAjax.jsp";
				
	}
	
	//신고form
	@RequestMapping(value = "/classreportform.action", method = RequestMethod.GET)
	public ModelAndView classReportForm(ReportDTO report, String classNo)			//jsp 와 함수명 동일하게 작성
	{
		ModelAndView mav = new ModelAndView();
		
		IClassDAO cla = sqlSession.getMapper(IClassDAO.class);
		
		ArrayList<ReportDTO> reasonList = new ArrayList<ReportDTO>();
		
		reasonList = cla.reasonList();
		mav.addObject("reasonList", reasonList);
		mav.addObject("classNo", classNo);
		
		mav.setViewName("/WEB-INF/classView/ClassReportForm.jsp");
		
		return mav;
		
	}
	
	//강좌 신고등록
	@RequestMapping(value = "/classreport.action", method = RequestMethod.POST)
	public String classReportAdd(ReportDTO report, HttpSession session, Model model)			
	{
		//session에 있는 getAttribute로  memNo를 받아와서 String prmemNo로 다시 넣어
		String prmemNo = (String) session.getAttribute("memNo");
		
		//ReportDTO안에 prmemNo넣기
		report.setPrmemNo(prmemNo);
		
		IClassDAO cla = sqlSession.getMapper(IClassDAO.class);
		/*
		 System.out.println(report.getRepNo());
		 System.out.println(report.getRepOther());
		 System.out.println(report.getRepReasonNo());
		 System.out.println(report.getPrmemNo());
		 */
		//dao에 report 추가
		cla.add(report);
		
		model.addAttribute("msg","신고가 완료되었습니다.");
		model.addAttribute("url","classlist.action?order=CLASS_DATE DESC");			//주소 작성시 동일하게 작성하기
		
		return "/WEB-INF/myPageView/Alert.jsp";

	}
	
	
	
	
	
}
