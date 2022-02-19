package com.gagym.mybatis.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;

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

import com.gagym.dto.AreaDTO;
import com.gagym.dto.ClassDTO;
import com.gagym.dto.InstructorDTO;
import com.gagym.dto.InstructorScheduleDTO;
import com.gagym.dto.ScheduleChangeDTO;
import com.gagym.dto.SportDTO;
import com.gagym.dto.TimeDTO;
import com.gagym.mybatis.inter.IClassInsertDAO;
import com.gagym.mybatis.inter.IInstructorDAO;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;


@Controller
public class InstructorProfileController
{
	@Autowired
	private SqlSession sqlSession;
	
	// 강사홈 진입
	@RequestMapping(value = "/instructormain.action", method = RequestMethod.GET)
	public String InstructorProfile(Model model, HttpSession session, HttpServletRequest request)
	{		
		IInstructorDAO dao = sqlSession.getMapper(IInstructorDAO.class);
		
		try
		{
			String insNo = (String)session.getAttribute("insNo");
			System.out.println(insNo);
			
			if (insNo==null)
			{
				model.addAttribute("msg","회원님은 강사권한이 없습니다.");
				model.addAttribute("url","main.action");
	            
	            return "/WEB-INF/myPageView/Alert.jsp";
			}
			
			model.addAttribute("profile", dao.profile(insNo));
			
			String reqNo = dao.searchReq(insNo);
			model.addAttribute("areas", dao.areas(reqNo));
			model.addAttribute("experiences", dao.experiences(reqNo));
			model.addAttribute("prizes", dao.prizes(reqNo));
			model.addAttribute("certificates", dao.certificates(reqNo));
			model.addAttribute("follower", dao.follower(insNo));
			model.addAttribute("grade", dao.grade(insNo));
			
			//model.addAttribute("nowClass", dao.nowClass(insNo));
			model.addAttribute("insMyClass", dao.insMyClass(insNo));
			
			model.addAttribute("reviews", dao.reviews(insNo));
			
			String yearStr = request.getParameter("year");
			String monthStr = request.getParameter("month");
		
			int year = 0;
			int month = 0;
			
			Calendar today = Calendar.getInstance();
			
			if (yearStr == null && monthStr == null)
			{
				year = today.get(Calendar.YEAR);
				month = today.get(Calendar.MONTH) + 1;
			}
			else
			{
				year = Integer.parseInt(yearStr);
				month = Integer.parseInt(monthStr);
			}
			
			if (month > 12)
			{
				year++;
				month = 1;
			}
			
			if (month < 1)
			{
				year--;
				month = 12;
			}
			
			String yearMonth = year + "-" + month;
			
			HashMap<String, String> map = new HashMap<String, String>();
			map.put("insNo", insNo);
			map.put("yearMonth", yearMonth);
			
			ArrayList<InstructorScheduleDTO> schedule = dao.scheduleBars(map);
			
			JSONArray arr = new JSONArray();
			
			for (InstructorScheduleDTO dto : schedule)
			{
				JSONObject obj = new JSONObject();
				obj.put("category", dto.getCategory());
				obj.put("rsvDate", dto.getRsvDate());
				
				arr.add(obj);
			}
			
			model.addAttribute("json", arr.toJSONString());
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
		
		return "/WEB-INF/insPageView/InstructorPageMain.jsp";
		
	}
	
	// 강사 상세 스케줄
	@RequestMapping(value = "/scheduleajax.action", method = RequestMethod.GET)
	public String ScheduleAjax(Model model, HttpServletRequest request)
	{
		IInstructorDAO dao = sqlSession.getMapper(IInstructorDAO.class);
		
		String insNo = request.getParameter("insNo");
		String date = request.getParameter("date");
		
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("insNo", insNo);
		map.put("date", date);
		
		ArrayList<InstructorScheduleDTO> arr = dao.schedules(map);
		
		for (InstructorScheduleDTO dto : arr)
		{
			dto.setTel(dao.schedulePrivacys(dto.getMemNo()).getTel());
			dto.setHomeTel(dao.schedulePrivacys(dto.getMemNo()).getHomeTel());
			dto.setAddr(dao.schedulePrivacys(dto.getMemNo()).getAddr());
			dto.setDetailAddr(dao.schedulePrivacys(dto.getMemNo()).getDetailAddr());
		}
		
		model.addAttribute("schedules", arr);
		
		return "/WEB-INF/insPageView/ScheduleAjax.jsp";
				
	}

	//운동종목 번호, 이름, 타임 받아오기
	@RequestMapping(value = "/classinsertform.action", method = RequestMethod.GET)
	public ModelAndView sportList(SportDTO sport)
	{
		ModelAndView mav = new ModelAndView();
		
		IClassInsertDAO cla = sqlSession.getMapper(IClassInsertDAO.class);
		
		ArrayList<SportDTO> sportList = new ArrayList<SportDTO>();
		
		sportList = cla.sportList();
		
		mav.addObject("sportList", sportList);
		mav.addObject("timeList", cla.timeList());				
		  
		mav.setViewName("/WEB-INF/classView/ClassInsertForm.jsp");
		
		return mav;
		
	}
	
	//강좌등록
	@RequestMapping(value = "/classinsert.action", method = RequestMethod.POST)
	public ModelAndView classInsert(ClassDTO cla, HttpSession session, Model model, HttpServletRequest request) throws IOException
	{
		ModelAndView mav = new ModelAndView();
		
		String insNo = (String)session.getAttribute("insNo");
		
		cla.setInsNo(insNo);
		
		// 파일 업로드 위치
		String savePath = "C:\\FinalPrj\\Final\\WebContent\\upload\\class\\";
		int maxSize = 1024 * 1024 * 1024; 	// 최대 1GB
		String encodingType = "UTF-8";
		MultipartRequest multi = new MultipartRequest(request, savePath, maxSize, encodingType, new DefaultFileRenamePolicy());
		String classPath = multi.getFilesystemName("classPath");
		
		
		//폼에 multi type로 설정을해서 여기서도 multi로 해줘야 받아올 수 있다.
		String sportNo = multi.getParameter("sportNo");
		String className = multi.getParameter("className");
		String content = multi.getParameter("content");
		String startDate = multi.getParameter("startDate");
		String endDate = multi.getParameter("endDate");
		int point = Integer.parseInt(multi.getParameter("point"));
		String bank = multi.getParameter("bank");
		String account = multi.getParameter("account");
		String startTimeNo = multi.getParameter("startTimeNo");
		String endTimeNo = multi.getParameter("endTimeNo");
		
		
		cla.setClassPath("http://localhost:8090/Final/upload/class/" + classPath);
		
		cla.setSportNo(sportNo);
		cla.setClassName(className);
		cla.setContent(content);
		cla.setStartDate(startDate);
		cla.setEndDate(endDate);
		cla.setPoint(point);
		cla.setBank(bank);
		cla.setAccount(account);
		cla.setStartTimeNo(startTimeNo);
		cla.setEndTimeNo(endTimeNo);
		
		IClassInsertDAO dao = sqlSession.getMapper(IClassInsertDAO.class);
		
		dao.add(cla);
		
		mav.setViewName("redirect:instructormain.action");
		
		return mav;
	
	}
	
	// 스케줄변경 폼
	@RequestMapping(value = "/scheduleChangeform.action", method = RequestMethod.GET)
	public String ScheduleChangeForm(Model model, HttpServletRequest request)
	{
		IInstructorDAO insDao = sqlSession.getMapper(IInstructorDAO.class);
		IClassInsertDAO classInsertDao = sqlSession.getMapper(IClassInsertDAO.class);
		
		String classNo = request.getParameter("classNo");
		
		ArrayList<TimeDTO> timeList = classInsertDao.timeList();
		InstructorScheduleDTO dto = insDao.classTime(classNo);
		
		model.addAttribute("classNo", classNo);
		model.addAttribute("timeList", timeList);
		model.addAttribute("classTime", dto);
		
		return "/WEB-INF/insPageView/ScheduleChangeForm.jsp";
	}
	
	// 스케줄변경 실행
	@RequestMapping(value = "/scheduleChange.action", method = RequestMethod.POST)
	public String scheduleChange(HttpSession session, HttpServletRequest request)
	{
		IInstructorDAO dao = sqlSession.getMapper(IInstructorDAO.class);
		
		String classNo = request.getParameter("classNo");
		
		String cerDate = request.getParameter("cerDate");
		String startTimeNo = request.getParameter("startTimeNo");
		String endTimeNo = request.getParameter("endTimeNo");
		
		ScheduleChangeDTO dto = new ScheduleChangeDTO();
		
		dto.setClassNo(classNo);
		dto.setStartTimeNo(startTimeNo);
		dto.setEndTimeNo(endTimeNo);
		dto.setCerDate(cerDate);
		
		dao.scheduleChange(dto);
		
		return "";
		
	}
	
	// 강사 수정요청 폼
	@RequestMapping(value = "/instructorChangeForm.action", method = RequestMethod.GET)
	public String instructorChangeForm(Model model, HttpSession session, HttpServletRequest request)
	{
		IInstructorDAO dao = sqlSession.getMapper(IInstructorDAO.class);
		
		ArrayList<InstructorDTO> cerList = new ArrayList<InstructorDTO>();
		ArrayList<AreaDTO> cityList = new ArrayList<AreaDTO>();
		
		try
		{
			cerList = dao.cerList();
			cityList = dao.cityList();
			
			model.addAttribute("cerList", cerList);
			model.addAttribute("cityList", cityList);
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}

		return "/WEB-INF/insPageView/InstructorChangeForm.jsp";
		
		
	}
	
	// 강사 수정요청
	@RequestMapping(value = "/instructorChange.action", method = RequestMethod.POST)
	public ModelAndView instructorChange(HttpSession session, HttpServletRequest request) throws IOException
	{
		ModelAndView mav = new ModelAndView();
		
		IInstructorDAO dao = sqlSession.getMapper(IInstructorDAO.class);
		
		String memNo = (String)session.getAttribute("memNo");
		
		//-- 파일 업로드 위치
		String savePath = "C:\\FinalPrj\\Final\\WebContent\\upload\\certificateProof\\";
		
		int maxSize = 1024 * 1024 * 1024; 	// 최대 1GB
		String encodingType = "UTF-8";
		MultipartRequest multi = new MultipartRequest(request, savePath, maxSize, encodingType, new DefaultFileRenamePolicy());
		String proofPath = multi.getFilesystemName("proofPath");
		// 자격증
		String[] cerNo = multi.getParameterValues("cerName");
		String[] cerDate = multi.getParameterValues("cerDate");
				
		// 수상경력
		String[] przName = multi.getParameterValues("przName");
		String[] przMedal = multi.getParameterValues("przMedal");
		String[] przDate = multi.getParameterValues("przDate");
		
		// 활동경력
		String[] expContent = multi.getParameterValues("expContent");
		String[] expStartDate = multi.getParameterValues("expStartDate");
		String[] expEndDate = multi.getParameterValues("expEndDate");
		
		// 활동지역
		String[] sigunguNo = multi.getParameterValues("sigunguName");
		
		try
		{
			// 자격증
			for(int c=0; c<cerNo.length; c++)
			{
				HashMap<String, String> map = new HashMap<String, String>();
				map.put("memNo", memNo);
				map.put("cerNo", cerNo[c]);
				map.put("cerDate", cerDate[c]);
				map.put("proofPath", "http://localhost:8090/Final/upload/certificateProof/" + proofPath);
				
				if(!cerNo[c].equals("") && !cerDate[c].equals("") && !proofPath.equals(""))
					dao.insCerAdd(map);
			}
			
			// 수상경력
			for(int p=0; p<przName.length; p++)
			{
				HashMap<String, String> map = new HashMap<String, String>();
				map.put("memNo", memNo);
				map.put("przName", przName[p]);
				map.put("przMedal", przMedal[p]);
				map.put("przDate", przDate[p]);
				
				if(!przName[p].equals("") && !przMedal[p].equals("") && !przDate[p].equals(""))
					dao.insPrzAdd(map);
			}
			
			// 활동경력
			for(int e=0; e<expContent.length; e++)
			{
				HashMap<String, String> map = new HashMap<String, String>();
				map.put("memNo", memNo);
				map.put("expContent", expContent[e]);
				map.put("expStartDate", expStartDate[e]);
				map.put("expEndDate", expEndDate[e]);
				
				if(!expContent[e].equals("") && !expStartDate[e].equals("") && !expEndDate[e].equals(""))
					dao.insExpAdd(map);
			}
			
			// 활동지역
			for(int s=0; s<sigunguNo.length; s++)
			{
				HashMap<String, String> map = new HashMap<String, String>();
				map.put("memNo", memNo);
				map.put("sigunguNo", sigunguNo[s]);
				
				if(!sigunguNo[s].equals(""))
					dao.insAreaAdd(map);
				else
					break;
			}
			
			mav.setViewName("redirect:instructormain.action");	
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
		
		return mav;
	}
	
	// 원데이 구직현황
	@RequestMapping(value = "/onedayrsvlist.action", method = RequestMethod.GET)
	public String OnedayRsvList(Model model)
	{
		return "/WEB-INF/insPageView/OnedayRsvList.jsp";
	}
}
