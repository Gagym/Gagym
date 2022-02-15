package com.gagym.dto;

public class TermsDTO
{
	// 약관T → 약관번호, 약관내용, 필수여부, 관리자아이디, 약관작성일자
	private String termsNo, termsContent, necessary, adminId, termsDate;

	//getter / setter 구성
	public String getTermsNo()
	{
		return termsNo;
	}

	public void setTermsNo(String termsNo)
	{
		this.termsNo = termsNo;
	}

	public String getTermsContent()
	{
		return termsContent;
	}

	public void setTermsContent(String termsContent)
	{
		this.termsContent = termsContent;
	}

	public String getNecessary()
	{
		return necessary;
	}

	public void setNecessary(String necessary)
	{
		this.necessary = necessary;
	}

	public String getAdminId()
	{
		return adminId;
	}

	public void setAdminId(String adminId)
	{
		this.adminId = adminId;
	}

	public String getTermsDate()
	{
		return termsDate;
	}

	public void setTermsDate(String termsDate)
	{
		this.termsDate = termsDate;
	}
}
