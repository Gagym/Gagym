package com.gagym.dto;

public class ClassScheduleDTO
{
	// 강좌번호, 강좌명, 강사번호, 회원번호, 회원명, 회원아이디
	private String classNo, className, insNo, memNo, memName, memId;
	
	// 예약날짜, 강좌첫타임, 강좌마지막타임, 강좌시작날짜, 강좌끝날짜 강좌예약번호
	private String rsvDate, startTime, endTime, startDate, endDate, rsvNo;
	
	// 예약타임
	private int rsvTime;
	


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

	public String getRsvNo()
	{
		return rsvNo;
	}

	public void setRsvNo(String rsvNo)
	{
		this.rsvNo = rsvNo;
	}

	public String getStartTime()
	{
		return startTime;
	}

	public void setStartTime(String startTime)
	{
		this.startTime = startTime;
	}

	public String getEndTime()
	{
		return endTime;
	}

	public void setEndTime(String endTime)
	{
		this.endTime = endTime;
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

	public String getRsvDate()
	{
		return rsvDate;
	}

	public void setRsvDate(String rsvDate)
	{
		this.rsvDate = rsvDate;
	}

	public int getRsvTime()
	{
		return rsvTime;
	}

	public void setRsvTime(int rsvTime)
	{
		this.rsvTime = rsvTime;
	}
}
