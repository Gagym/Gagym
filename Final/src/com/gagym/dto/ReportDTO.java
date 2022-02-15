package com.gagym.dto;

public class ReportDTO
{
	//신고된 대상번호, 신고된 게시물 제목, 신고일자, 신고사유번호, 신고사유, 신고사유기타
	private String repNo, repTitle, repDate, repReasonNo, repReason, repOther;	
	
	//신고당한 회원, 신고한 회원
	private String pmemNo, prmemNo;
	
	//관리자아이디
	private String adminId;

	
	public String getRepNo()
	{
		return repNo;
	}

	public void setRepNo(String repNo)
	{
		this.repNo = repNo;
	}

	public String getRepTitle()
	{
		return repTitle;
	}

	public void setRepTitle(String repTitle)
	{
		this.repTitle = repTitle;
	}

	public String getRepDate()
	{
		return repDate;
	}

	public void setRepDate(String repDate)
	{
		this.repDate = repDate;
	}

	public String getRepReasonNo()
	{
		return repReasonNo;
	}

	public void setRepReasonNo(String repReasonNo)
	{
		this.repReasonNo = repReasonNo;
	}

	public String getRepReason()
	{
		return repReason;
	}

	public void setRepReason(String repReason)
	{
		this.repReason = repReason;
	}

	public String getPmemNo()
	{
		return pmemNo;
	}

	public void setPmemNo(String pmemNo)
	{
		this.pmemNo = pmemNo;
	}

	public String getPrmemNo()
	{
		return prmemNo;
	}

	public void setPrmemNo(String prmemNo)
	{
		this.prmemNo = prmemNo;
	}

	public String getAdminId()
	{
		return adminId;
	}

	public void setAdminId(String adminId)
	{
		this.adminId = adminId;
	}

	public String getRepOther()
	{
		return repOther;
	}

	public void setRepOther(String repOther)
	{
		this.repOther = repOther;
	}
	
}