
package com.gagym.mvc.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

import com.gagym.dto.EyebodyDTO;
import com.gagym.mvc.inter.IMypageMainDAO;

// cos.jar - lib 추가
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class EyebodyInsertController implements Controller
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
		
		// 파일 업로드 위치
		String savePath = "C:\\FinalPrj\\Final\\WebContent\\upload\\eyebody\\";
		int maxSize = 1024 * 1024 * 1024; 	// 최대 1GB
		String encodingType = "UTF-8";
		MultipartRequest multi = new MultipartRequest(request, savePath, maxSize, encodingType, new DefaultFileRenamePolicy());
		String photoPath = multi.getFilesystemName("photoPath");
		
		try
		{
			EyebodyDTO eyebody = new EyebodyDTO();
			
			eyebody.setMemNo(memNo);
			eyebody.setPhotoPath("http://localhost:8090/Final/upload/eyebody/" + photoPath);
			
			dao.eyebodyAdd(eyebody);
			
			mav.setViewName("redirect:mypagemain.action");	
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
		
		return mav;
	}

}
