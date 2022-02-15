package com.gagym.mybatis.controller;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.gagym.dto.OnedayDTO;
import com.gagym.dto.OnedayReservationDTO;
import com.gagym.dto.PagingVO;
import com.gagym.dto.ReportDTO;
import com.gagym.mybatis.inter.IMyExerciseOnedayDAO;
import com.gagym.mybatis.inter.IOnedayDAO;

@Controller
public class OnedayBoardController
{
	@Autowired
	private SqlSession sqlSession;
	
	// 1-1. 원데이 리스트
	@RequestMapping(value = "/onedaylist.action", method = RequestMethod.GET)
	public String list(Model model, PagingVO vo, String nowPage, String cntPerPage) {
		
		IOnedayDAO dao = sqlSession.getMapper(IOnedayDAO.class);
		
		int total = dao.count();
		
		if (nowPage == null && cntPerPage == null) {
			nowPage = "1";
			cntPerPage = "10";
		} else if (nowPage == null) {
			nowPage = "1";
		} else if (cntPerPage == null) { 
			cntPerPage = "10";
		}
		
		vo = new PagingVO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
		
		model.addAttribute("paging", vo);
		model.addAttribute("list", dao.list(vo));

		return "/WEB-INF/onedayView/OnedayMain.jsp";
	}
	
	// 1-2. 원데이 게시글 상세 조회
	@RequestMapping(value="/onedaycontent.action", method = RequestMethod.GET)
	public String onedayContent(HttpSession session, Model model, String onedayNo)
	{
		String memNo = (String)session.getAttribute("memNo");
		
		if (memNo==null)
		{
			
			model.addAttribute("msg","로그인 후 이용가능합니다.");
			model.addAttribute("url","login.action");
			
			return "/WEB-INF/mainView/Alert.jsp";
		}
		
		IMyExerciseOnedayDAO dao = sqlSession.getMapper(IMyExerciseOnedayDAO.class);
		
		OnedayDTO oneday = new OnedayDTO();
		
		oneday = dao.onedayContent(onedayNo);
		
		model.addAttribute("onedayNo", onedayNo);
		model.addAttribute("oneday", oneday);
		model.addAttribute("member", dao.onedayPrivacy(oneday.getMemNo()));		// 게시글의 memNo를 이용하여 개인정보 출력
		
		return "/WEB-INF/onedayView/OnedayContent.jsp";
	}
	
	// 2-1. 원데이 구직 신청 폼
	@RequestMapping(value="/onedayrsvinsertform.action", method = RequestMethod.GET)
	public String onedayRsvInsertForm(HttpSession session, Model model, String onedayNo)
	{
		String insNo = (String)session.getAttribute("insNo");
		
		if (insNo==null)
		{
			model.addAttribute("msg","회원님은 강사권한이 없습니다.");
			model.addAttribute("url","onedaycontent.action?onedayNo=" + onedayNo);
            
            return "/WEB-INF/myPageView/Alert.jsp";
		}
		
		IMyExerciseOnedayDAO dao = sqlSession.getMapper(IMyExerciseOnedayDAO.class);
		
		OnedayDTO oneday = new OnedayDTO();
		
		oneday = dao.onedayContent(onedayNo);
		
		model.addAttribute("onedayNo", onedayNo);
		model.addAttribute("oneday", oneday);
		model.addAttribute("member", dao.onedayPrivacy(oneday.getMemNo()));		// 게시글의 memNo를 이용하여 개인정보 출력
		
		// selectBox
		model.addAttribute("timeList", dao.timeList());
		
		return "/WEB-INF/myPageView/OnedayRsvInsertForm.jsp";
	}
	
	// 2-2. 원데이 구직 신청
	@RequestMapping(value="/onedayrsvinsert.action", method = RequestMethod.POST)
	public String onedayRsvInsert(Model model, HttpSession session, OnedayReservationDTO dto)
	{				
		IOnedayDAO dao = sqlSession.getMapper(IOnedayDAO.class);
		
		String insNo = (String)session.getAttribute("insNo");
		
		dto.setInsNo(insNo);
		
		dao.onedayRsvAdd(dto);
		
		model.addAttribute("msg","구직신청이 완료되었습니다.");
		model.addAttribute("url","main.action");
		
		return "/WEB-INF/myPageView/Alert.jsp";
	}
	
	// 3-1. 원데이 신고 폼
	@RequestMapping(value="/onedayreportform.action", method = RequestMethod.GET)
	public String onedayReportForm(Model model, String onedayNo)
	{
		IOnedayDAO dao = sqlSession.getMapper(IOnedayDAO.class);
		
		model.addAttribute("onedayNo", onedayNo);
		
		// selectBox
		model.addAttribute("reasonList", dao.reasonList());
		
		return "/WEB-INF/onedayView/OnedayReportForm.jsp";
	}
	
	// 3-2. 원데이 신고
	@RequestMapping(value="/onedayreport.action", method = RequestMethod.POST)
	public String onedayReportInsert(Model model, HttpSession session, ReportDTO dto)
	{				
		IOnedayDAO dao = sqlSession.getMapper(IOnedayDAO.class);
		
		String memNo = (String)session.getAttribute("memNo");
		
		dto.setPrmemNo(memNo);
		
		dao.onedayReportAdd(dto);
		
		model.addAttribute("msg","신고가 완료되었습니다.");
		model.addAttribute("url","main.action");
		
		return "/WEB-INF/myPageView/Alert.jsp";
	}

}
