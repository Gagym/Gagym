/*=================
  ReviewDTO.java
  - 평점/리뷰
=================*/

package com.gagym.dto;

public class ReviewDTO
{
	// 강좌 번호, 강좌명, 강사 번호, 강사아이디, 강사이름
	private String classNo, className, insNo, insId, insName;
	
	// 강좌완료번호, 리뷰, 리뷰 날짜
	private String classComNo, reviewContent, reviewDate;
	
	// 회원번호, 회원 id, 회원명
	private String memNo, memId, memName;
	
	// 평점
	private double grade;
	

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

	public String getReviewContent()
	{
		return reviewContent;
	}

	public void setReviewContent(String reviewContent)
	{
		this.reviewContent = reviewContent;
	}

	public String getReviewDate()
	{
		return reviewDate;
	}

	public void setReviewDate(String reviewDate)
	{
		this.reviewDate = reviewDate;
	}

	public String getMemNo()
	{
		return memNo;
	}

	public void setMemNo(String memNo)
	{
		this.memNo = memNo;
	}

	public String getMemId()
	{
		return memId;
	}

	public void setMemId(String memId)
	{
		this.memId = memId;
	}

	public String getMemName()
	{
		return memName;
	}

	public void setMemName(String memName)
	{
		this.memName = memName;
	}

	public double getGrade()
	{
		return grade;
	}

	public void setGrade(double grade)
	{
		this.grade = grade;
	}

	public String getClassComNo()
	{
		return classComNo;
	}

	public void setClassComNo(String classComNo)
	{
		this.classComNo = classComNo;
	}

	public String getInsId()
	{
		return insId;
	}

	public void setInsId(String insId)
	{
		this.insId = insId;
	}

	public String getInsName()
	{
		return insName;
	}

	public void setInsName(String insName)
	{
		this.insName = insName;
	}

	
}
