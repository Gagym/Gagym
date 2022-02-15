package com.gagym.dto;

public class ClassReservationDTO
{
	// 강좌번호, 강좌제목, 강사명, 강사아이디, 회원번호, 카테고리
	private String classNo, title, insName, insId, memNo, category;
	
	// 예약번호, 예약날짜, 취소일시, 취소사유, 완료일시, 처리날짜
	private String classRsvNo, rsvDate, cnlDate, cnlReason, comDate, prcDate;
	
	// 취소 후 환불가능 여부, 수강확정여부체크, 리뷰번호, 완료번호, 분쟁조정번호
	private String cnlCheck, comCheck, reviewNo, classComNo, classDisNo;
	
	// 예약타임, 처리코드, 아령
	private int rsvTime, prcCode, point;

	public String getClassNo()
	{
		return classNo;
	}

	public void setClassNo(String classNo)
	{
		this.classNo = classNo;
	}

	public String getTitle()
	{
		return title;
	}

	public void setTitle(String title)
	{
		this.title = title;
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

	public String getMemNo()
	{
		return memNo;
	}

	public void setMemNo(String memNo)
	{
		this.memNo = memNo;
	}

	public String getClassRsvNo()
	{
		return classRsvNo;
	}

	public void setClassRsvNo(String classRsvNo)
	{
		this.classRsvNo = classRsvNo;
	}

	public String getRsvDate()
	{
		return rsvDate;
	}

	public void setRsvDate(String rsvDate)
	{
		this.rsvDate = rsvDate;
	}

	public String getCnlDate()
	{
		return cnlDate;
	}

	public void setCnlDate(String cnlDate)
	{
		this.cnlDate = cnlDate;
	}

	public String getCnlReason()
	{
		return cnlReason;
	}

	public void setCnlReason(String cnlReason)
	{
		this.cnlReason = cnlReason;
	}

	public String getComDate()
	{
		return comDate;
	}

	public void setComDate(String comDate)
	{
		this.comDate = comDate;
	}

	public String getPrcDate()
	{
		return prcDate;
	}

	public void setPrcDate(String prcDate)
	{
		this.prcDate = prcDate;
	}

	public int getRsvTime()
	{
		return rsvTime;
	}

	public void setRsvTime(int rsvTime)
	{
		this.rsvTime = rsvTime;
	}

	public int getPrcCode()
	{
		return prcCode;
	}

	public void setPrcCode(int prcCode)
	{
		this.prcCode = prcCode;
	}

	public int getPoint()
	{
		return point;
	}

	public void setPoint(int point)
	{
		this.point = point;
	}

	public String getComCheck()
	{
		return comCheck;
	}

	public void setComCheck(String comCheck)
	{
		this.comCheck = comCheck;
	}

	public String getCnlCheck()
	{
		return cnlCheck;
	}

	public void setCnlCheck(String cnlCheck)
	{
		this.cnlCheck = cnlCheck;
	}

	public String getClassDisNo()
	{
		return classDisNo;
	}

	public void setClassDisNo(String classDisNo)
	{
		this.classDisNo = classDisNo;
	}

	public String getReviewNo()
	{
		return reviewNo;
	}

	public void setReviewNo(String reviewNo)
	{
		this.reviewNo = reviewNo;
	}

	public String getClassComNo()
	{
		return classComNo;
	}

	public void setClassComNo(String classComNo)
	{
		this.classComNo = classComNo;
	}

	public String getCategory()
	{
		return category;
	}

	public void setCategory(String category)
	{
		this.category = category;
	}
	
}
