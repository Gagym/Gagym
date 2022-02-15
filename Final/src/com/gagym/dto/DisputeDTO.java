package com.gagym.dto;

// 클래스, 원데이클래스 분쟁조정
public class DisputeDTO
{
	// 분쟁조정번호, 분쟁회원번호, 분쟁회원이름, 분쟁회원아이디, 강좌/원데이클래스 번호, 강좌예약번호/구직신청번호
	private String classDisNo, memNo, memName, memId, classNo, classRsvNo;
	
	// 분쟁제목, 분쟁내용, 분쟁조정날짜, 첨부파일
	private String classDisTitle, classDisContent, classDisDate, classDisPath;
	
	// 분쟁답변번호, 답변관리자, 분쟁답변날짜, 분쟁답변내용
	private String classDisANo, adminId, classDisADate, classDisA;

	public String getClassDisNo()
	{
		return classDisNo;
	}

	public void setClassDisNo(String classDisNo)
	{
		this.classDisNo = classDisNo;
	}

	public String getMemNo()
	{
		return memNo;
	}

	public void setMemNo(String memNo)
	{
		this.memNo = memNo;
	}

	public String getMemName()
	{
		return memName;
	}

	public void setMemName(String memName)
	{
		this.memName = memName;
	}

	public String getMemId()
	{
		return memId;
	}

	public void setMemId(String memId)
	{
		this.memId = memId;
	}

	public String getClassNo()
	{
		return classNo;
	}

	public void setClassNo(String classNo)
	{
		this.classNo = classNo;
	}

	public String getClassRsvNo()
	{
		return classRsvNo;
	}

	public void setClassRsvNo(String classRsvNo)
	{
		this.classRsvNo = classRsvNo;
	}

	public String getClassDisTitle()
	{
		return classDisTitle;
	}

	public void setClassDisTitle(String classDisTitle)
	{
		this.classDisTitle = classDisTitle;
	}

	public String getClassDisContent()
	{
		return classDisContent;
	}

	public void setClassDisContent(String classDisContent)
	{
		this.classDisContent = classDisContent;
	}

	public String getClassDisDate()
	{
		return classDisDate;
	}

	public void setClassDisDate(String classDisDate)
	{
		this.classDisDate = classDisDate;
	}

	public String getClassDisPath()
	{
		return classDisPath;
	}

	public void setClassDisPath(String classDisPath)
	{
		this.classDisPath = classDisPath;
	}

	public String getClassDisANo()
	{
		return classDisANo;
	}

	public void setClassDisANo(String classDisANo)
	{
		this.classDisANo = classDisANo;
	}

	public String getAdminId()
	{
		return adminId;
	}

	public void setAdminId(String adminId)
	{
		this.adminId = adminId;
	}

	public String getClassDisADate()
	{
		return classDisADate;
	}

	public void setClassDisADate(String classDisADate)
	{
		this.classDisADate = classDisADate;
	}

	public String getClassDisA()
	{
		return classDisA;
	}

	public void setClassDisA(String classDisA)
	{
		this.classDisA = classDisA;
	}
	
	
}