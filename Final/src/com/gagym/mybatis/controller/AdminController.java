package com.gagym.mybatis.controller;

import java.util.ArrayList;
import java.util.Calendar;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.gagym.dto.ClassReservationDTO;
import com.gagym.dto.InstructorCalcDTO;
import com.gagym.dto.InstructorDTO;
import com.gagym.dto.MemberDTO;
import com.gagym.mybatis.inter.IAdminDAO;
import com.gagym.mybatis.inter.IMyExerciseClassDAO;

import sun.security.jca.GetInstance;

@Controller
public class AdminController
{
	@Autowired
	private SqlSession sqlSession;
	
	// 관리자 홈 진입
	@RequestMapping(value = "/adminhome.action", method = RequestMethod.GET)
	public String admin()
	{
		return "/WEB-INF/adminView/AdminHome.jsp";
	}
	
	// 1. 회원리스트
	@RequestMapping(value = "/memlist.action", method = RequestMethod.GET)
	public String memlist(Model model)
	{
		IAdminDAO dao = sqlSession.getMapper(IAdminDAO.class);
		
		ArrayList<MemberDTO> arr = dao.memberList();
		
		for (MemberDTO dto : arr)
		{
			dto.setCountReport(dao.countReport(dto.getMemNo()));
			dto.setBlackCheck(dao.blackCheck(dto.getMemNo()));
		}
		
		model.addAttribute("memberList", arr);
		
		return "/WEB-INF/adminView/MemberList.jsp";
	}
	
	// 1-1. 블랙
	@RequestMapping(value = "/black.action", method = RequestMethod.GET)
	public String black(Model model, HttpSession session, String memNo)
	{
		String adminId = (String)session.getAttribute("admin");
		
		IAdminDAO dao = sqlSession.getMapper(IAdminDAO.class);
		
		dao.black(memNo, adminId);
		
		model.addAttribute("msg","블랙회원으로 선정하였습니다.");
		model.addAttribute("url","memlist.action");
		
		return "/WEB-INF/myPageView/Alert.jsp";
	}
	
	// 1-2. 블랙 해제
	@RequestMapping(value = "/blackcancel.action", method = RequestMethod.GET)
	public String blackCancel(Model model, String memNo)
	{
		IAdminDAO dao = sqlSession.getMapper(IAdminDAO.class);
		
		dao.blackCancel(memNo);
		
		model.addAttribute("msg","블랙회원에서 해제하였습니다.");
		model.addAttribute("url","memlist.action");
		
		return "/WEB-INF/myPageView/Alert.jsp";
	}
	
	
	// 2. 강사리스트
	@RequestMapping(value = "/inslist.action", method = RequestMethod.GET)
	public String inslist(Model model)
	{
		IAdminDAO dao = sqlSession.getMapper(IAdminDAO.class);
		
		ArrayList<InstructorDTO> arr = dao.insList();
		
		for (InstructorDTO dto : arr)
		{
			dto.setClassName(dao.nowClass(dto.getInsNo()));
		}
		
		model.addAttribute("insList", arr);
		
		model.addAttribute("insReqList", dao.insReqList());
		
		return "/WEB-INF/adminView/InstructorList.jsp";
	}
	
	// 2-1-1. 권한박탈 폼
	@RequestMapping(value = "/insdropform.action", method = RequestMethod.GET)
	public String insDropForm(Model model, String insNo)
	{		
		model.addAttribute("insNo", insNo);
		
		return "/WEB-INF/adminView/InsDropForm.jsp";
		
	}
	// 2-1-2. 권한박탈
	@RequestMapping(value = "/insdrop.action", method = RequestMethod.POST)
	public String insDrop(InstructorDTO dto, HttpSession session)
	{	
		String adminId = (String)session.getAttribute("admin");
		dto.setAdminId(adminId);
		
		IAdminDAO dao = sqlSession.getMapper(IAdminDAO.class);
		
		dao.insDrop(dto);
		
		return "redirect:inslist.action";
	}
	
	// 2-2-1. 강사 신청 상세정보 폼
	@RequestMapping(value = "/insreqcontent.action", method = RequestMethod.GET)
	public String insReqContent(Model model, String reqNo)
	{		
		IAdminDAO dao = sqlSession.getMapper(IAdminDAO.class);
		
		model.addAttribute("reqNo", reqNo);
		
		model.addAttribute("areas", dao.areas(reqNo));
		model.addAttribute("experiences", dao.experiences(reqNo));
		model.addAttribute("prizes", dao.prizes(reqNo));
		model.addAttribute("certificates", dao.certificates(reqNo));
		
		return "/WEB-INF/adminView/InsReqContent.jsp";
		
	}
	// 2-2-2. 강사 신청 수락(미완)
	@RequestMapping(value = "/insreqok.action", method = RequestMethod.GET)
	public String insReqOk(InstructorDTO dto, HttpSession session)
	{	
		String adminId = (String)session.getAttribute("admin");
		dto.setAdminId(adminId);
		
		IAdminDAO dao = sqlSession.getMapper(IAdminDAO.class);
		
		dao.insReqOk(dto);
		
		return "redirect:inslist.action";
	}
	// 2-2-3. 강사 신청 거절(미완)
	@RequestMapping(value = "/insreqno.action", method = RequestMethod.GET)
	public String insReqNo(InstructorDTO dto, HttpSession session)
	{	
		String adminId = (String)session.getAttribute("admin");
		dto.setAdminId(adminId);
		
		IAdminDAO dao = sqlSession.getMapper(IAdminDAO.class);
		
		dao.insReqNo(dto);
		
		return "redirect:inslist.action";
	}
	
	// 3. 정산
	@RequestMapping(value = "/callist.action", method = RequestMethod.GET)
	public String calList(Model model)
	{
		IAdminDAO dao = sqlSession.getMapper(IAdminDAO.class);
		
		Calendar now = Calendar.getInstance();

		int year = now.get(Calendar.YEAR); 
		int month = now.get(Calendar.MONTH) +1; 
		int day = now.get(Calendar.DAY_OF_MONTH);
		
		int input_year = year;
		int input_month = month;
		
		String s_date = "";
		String e_date = "";
		
		System.out.println(year + ":" + month + ":" + day);

		// 강사... 정지당하거나 그런 사람 안 나오게 쿼리 수정
		
		// -- 14일까지는 이전달부터 이달 10일까지를 나타내는 쿼리
		/*if (day < 10)
		{
			input_year = year - 2000;
			input_month = month - 1;
			e_date = "SYSDATE";
			s_date = input_year + "/" + input_month + "/" + 10;
			if(month == 1) // 1월이면 년도-1, 월 12월
			{
				s_date = input_year-1 + "/" + 12 + "/" + 10;
			}
		}
		else if (day >= 10 && day <= 14)
		{
			input_year = year - 2000;
			input_month = month - 1;
			e_date = input_year + "/" + month + "/" + 11;
			s_date = input_year + "/" + input_month + "/" + 10;
			if(month == 1) // 1월이면 년도-1, 월 12월
			{
				s_date = input_year-1 + "/" + 12 + "/" + 10;
			}
		}*/
		if (day <= 14)
		{
			input_year = year - 2000;
			input_month = month - 1;
			e_date = input_year + "/" + month + "/" + 11;
			s_date = input_year + "/" + input_month + "/" + 10;
			if(month == 1) // 1월이면 년도-1, 월 12월
			{
				s_date = input_year-1 + "/" + 12 + "/" + 10;
			}
		}
		// -- 15일부터 월 말까지는 당월 11일부터 SYSDATE까지 아령 정산한 것 나오게
		else
		{
			e_date = "SYSDATE";
			s_date = year - 2000 + "/" + month + "/" + 10;
		}

		System.out.println(s_date + ":" + e_date);	
		//ArrayList<InstructorCalcDTO> insCalcList = dao.insCalcList();
		ArrayList<InstructorCalcDTO> insCalcList = dao.insCalcList_p(s_date, e_date);
		
		model.addAttribute("insCalcList", insCalcList);

		return "/WEB-INF/adminView/CalculateInstructor.jsp";
	}
}
