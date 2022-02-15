/*============================
  InstructorProfileDTO.java
  - 강사 프로필
============================*/

package com.gagym.dto;

public class InstructorDTO
{
	// 강사 번호, 강사신청번호, 강사명, 강사아이디, 나이, 성별, 한줄 소개, 강사신청날짜, 강사등록날짜, 처리코드
	private String insNo, reqNo, insName, insId, age, gender, email, introduce, reqDate, prcDate, prcCode;
	
	// 개설강좌
	private String className;
	
	// 프로필사진경로명, 활동지역
	private String profilePath, area;
	
	// 활동내역, 활동경력 시작날짜, 활동경력 끝날짜
	private String expContent, expStartDate, expEndDate;
	
	// 수상경력명, 수상경력 메달, 수상경력날짜
	private String przName, przMedal, przDate;
	
	// 자격증명, 자격증 발급날짜, 자격증 증명자료경로, 발급처
	private String cerNo, cerName, cerDate, proofPath, issueName;
	
	// 강사박탈번호, 관리자아이디, 박탈사유, 박탈날짜, 박탈여부
	private String insDropNo, adminId, dropReason, dropDate, dropCheck;

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

	public String getAge()
	{
		return age;
	}

	public void setAge(String age)
	{
		this.age = age;
	}

	public String getGender()
	{
		return gender;
	}

	public void setGender(String gender)
	{
		this.gender = gender;
	}

	public String getEmail()
	{
		return email;
	}

	public void setEmail(String email)
	{
		this.email = email;
	}

	public String getIntroduce()
	{
		return introduce;
	}

	public void setIntroduce(String introduce)
	{
		this.introduce = introduce;
	}

	public String getProfilePath()
	{
		return profilePath;
	}

	public void setProfilePath(String profilePath)
	{
		this.profilePath = profilePath;
	}

	public String getArea()
	{
		return area;
	}

	public void setArea(String area)
	{
		this.area = area;
	}

	public String getExpContent()
	{
		return expContent;
	}

	public void setExpContent(String expContent)
	{
		this.expContent = expContent;
	}

	public String getExpStartDate()
	{
		return expStartDate;
	}

	public void setExpStartDate(String expStartDate)
	{
		this.expStartDate = expStartDate;
	}

	public String getExpEndDate()
	{
		return expEndDate;
	}

	public void setExpEndDate(String expEndDate)
	{
		this.expEndDate = expEndDate;
	}

	public String getPrzName()
	{
		return przName;
	}

	public void setPrzName(String przName)
	{
		this.przName = przName;
	}

	public String getPrzMedal()
	{
		return przMedal;
	}

	public void setPrzMedal(String przMedal)
	{
		this.przMedal = przMedal;
	}

	public String getPrzDate()
	{
		return przDate;
	}

	public void setPrzDate(String przDate)
	{
		this.przDate = przDate;
	}

	public String getCerNo()
	{
		return cerNo;
	}

	public void setCerNo(String cerNo)
	{
		this.cerNo = cerNo;
	}

	public String getCerName()
	{
		return cerName;
	}

	public void setCerName(String cerName)
	{
		this.cerName = cerName;
	}

	public String getCerDate()
	{
		return cerDate;
	}

	public void setCerDate(String cerDate)
	{
		this.cerDate = cerDate;
	}

	public String getProofPath()
	{
		return proofPath;
	}

	public void setProofPath(String proofPath)
	{
		this.proofPath = proofPath;
	}

	public String getIssueName()
	{
		return issueName;
	}

	public void setIssueName(String issueName)
	{
		this.issueName = issueName;
	}

	public String getInsDropNo()
	{
		return insDropNo;
	}

	public void setInsDropNo(String insDropNo)
	{
		this.insDropNo = insDropNo;
	}

	public String getAdminId()
	{
		return adminId;
	}

	public void setAdminId(String adminId)
	{
		this.adminId = adminId;
	}

	public String getDropReason()
	{
		return dropReason;
	}

	public void setDropReason(String dropReason)
	{
		this.dropReason = dropReason;
	}

	public String getDropDate()
	{
		return dropDate;
	}

	public void setDropDate(String dropDate)
	{
		this.dropDate = dropDate;
	}

	public String getReqNo()
	{
		return reqNo;
	}

	public void setReqNo(String reqNo)
	{
		this.reqNo = reqNo;
	}

	public String getInsId()
	{
		return insId;
	}

	public void setInsId(String insId)
	{
		this.insId = insId;
	}

	public String getPrcDate()
	{
		return prcDate;
	}

	public void setPrcDate(String prcDate)
	{
		this.prcDate = prcDate;
	}

	public String getDropCheck()
	{
		return dropCheck;
	}

	public void setDropCheck(String dropCheck)
	{
		this.dropCheck = dropCheck;
	}

	public String getClassName()
	{
		return className;
	}

	public void setClassName(String className)
	{
		this.className = className;
	}

	public String getReqDate()
	{
		return reqDate;
	}

	public void setReqDate(String reqDate)
	{
		this.reqDate = reqDate;
	}

	public String getPrcCode()
	{
		return prcCode;
	}

	public void setPrcCode(String prcCode)
	{
		this.prcCode = prcCode;
	}

}
