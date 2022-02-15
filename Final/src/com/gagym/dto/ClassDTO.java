package com.gagym.dto;

public class ClassDTO
{
	// 회원번호, 강좌번호, 강좌명, 강사번호, 강사명, 강사아이디, 강좌시작날짜, 강좌종료날짜
	private String memNo, classNo, className, insNo, insName, insId, startDate, endDate;
	
	// 강사활동지역,운동종목번호 ,운동종목명, 강좌내용, 강좌사진, 강사사진경로  
	private String insArea, sportNo, sportName, content, classPath, profilePath;
	
	//정산은행, 정산계좌, 강좌첫타임번호, 강좌마지막타임번호
	private String bank, account, startTimeNo, endTimeNo;
	
	//강좌수강아령, 강좌첫타임, 강좌마지막타임
	private int point, startTime, endTime;
	
	//평점
	private double grade;

	
	public String getMemNo()
	{
		return memNo;
	}

	public void setMemNo(String memNo)
	{
		this.memNo = memNo;
	}

	public String getStartTimeNo()
	{
		return startTimeNo;
	}

	public void setStartTimeNo(String startTimeNo)
	{
		this.startTimeNo = startTimeNo;
	}

	public String getEndTimeNo()
	{
		return endTimeNo;
	}

	public void setEndTimeNo(String endTimeNo)
	{
		this.endTimeNo = endTimeNo;
	}

	public String getClassNo()
	{
		return classNo;
	}

	public void setClassNo(String classNo)
	{
		this.classNo = classNo;
	}

	public String getClassName()
	{
		return className;
	}

	public void setClassName(String className)
	{
		this.className = className;
	}

	public String getInsNo()
	{
		return insNo;
	}

	public void setInsNo(String insNo)
	{
		this.insNo = insNo;
	}

	public String getInsName()
	{
		return insName;
	}

	public void setInsName(String insName)
	{
		this.insName = insName;
	}

	public String getInsId()
	{
		return insId;
	}

	public void setInsId(String insId)
	{
		this.insId = insId;
	}

	public String getStartDate()
	{
		return startDate;
	}

	public void setStartDate(String startDate)
	{
		this.startDate = startDate;
	}

	public String getEndDate()
	{
		return endDate;
	}

	public void setEndDate(String endDate)
	{
		this.endDate = endDate;
	}

	public String getInsArea()
	{
		return insArea;
	}

	public void setInsArea(String insArea)
	{
		this.insArea = insArea;
	}

	public String getSportNo()
	{
		return sportNo;
	}

	public void setSportNo(String sportNo)
	{
		this.sportNo = sportNo;
	}

	public String getSportName()
	{
		return sportName;
	}

	public void setSportName(String sportName)
	{
		this.sportName = sportName;
	}

	public String getContent()
	{
		return content;
	}

	public void setContent(String content)
	{
		this.content = content;
	}

	public String getClassPath()
	{
		return classPath;
	}

	public void setClassPath(String classPath)
	{
		this.classPath = classPath;
	}

	public String getProfilePath()
	{
		return profilePath;
	}

	public void setProfilePath(String profilePath)
	{
		this.profilePath = profilePath;
	}

	public String getBank()
	{
		return bank;
	}

	public void setBank(String bank)
	{
		this.bank = bank;
	}

	public String getAccount()
	{
		return account;
	}

	public void setAccount(String account)
	{
		this.account = account;
	}

	public int getPoint()
	{
		return point;
	}

	public void setPoint(int point)
	{
		this.point = point;
	}

	public int getStartTime()
	{
		return startTime;
	}

	public void setStartTime(int startTime)
	{
		this.startTime = startTime;
	}

	public int getEndTime()
	{
		return endTime;
	}

	public void setEndTime(int endTime)
	{
		this.endTime = endTime;
	}

	public double getGrade()
	{
		return grade;
	}

	public void setGrade(double grade)
	{
		this.grade = grade;
	}
	
	



	

	
	
}