
package com.gagym.mvc.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

import com.gagym.mvc.inter.IMypageMainDAO;

// cos.jar - lib 추가
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class InstructorInsertController implements Controller
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
			dao.insReqAdd(memNo);
			
			// 자격증
			for(int c=0; c<cerNo.length; c++)
			{
				if(!cerNo[c].equals("") && !cerDate[c].equals("") && !proofPath.equals(""))
					dao.insCerAdd(memNo, cerNo[c], cerDate[c], "http://localhost:8090/Final/upload/certificateProof/" + proofPath);
			}
			
			// 수상경력
			for(int p=0; p<przName.length; p++)
			{
				if(!przName[p].equals("") && !przMedal[p].equals("") && !przDate[p].equals(""))
					dao.insPrzAdd(memNo, przName[p], przMedal[p], przDate[p]);
			}
			
			// 활동경력
			for(int e=0; e<expContent.length; e++)
			{
				if(!expContent[e].equals("") && !expStartDate[e].equals("") && !expEndDate[e].equals(""))
					dao.insExpAdd(memNo, expContent[e], expStartDate[e], expEndDate[e]);
			}
			
			// 활동지역
			for(int s=0; s<sigunguNo.length; s++)
			{
				if(!sigunguNo[s].equals(""))
					dao.insAreaAdd(memNo, sigunguNo[s]);
				else
					break;
			}
			
			mav.setViewName("redirect:mypagemain.action");	
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
		
		return mav;
	}

}
