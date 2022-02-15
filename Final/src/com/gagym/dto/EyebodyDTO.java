package com.gagym.dto;

public class EyebodyDTO
{
	//눈바디번호, 회원번호
	private String eyebodyNo, memNo;
	//눈바디날짜
	private String eyebodyDate;
	//사진경로
	private String photoPath;
	
	public String getEyebodyNo()
	{
		return eyebodyNo;
	}
	public void setEyebodyNo(String eyebodyNo)
	{
		this.eyebodyNo = eyebodyNo;
	}
	public String getMemNo()
	{
		return memNo;
	}
	public void setMemNo(String memNo)
	{
		this.memNo = memNo;
	}
	public String getEyebodyDate()
	{
		return eyebodyDate;
	}
	public void setEyebodyDate(String eyebodyDate)
	{
		this.eyebodyDate = eyebodyDate;
	}
	public String getPhotoPath()
	{
		return photoPath;
	}
	public void setPhotoPath(String photoPath)
	{
		this.photoPath = photoPath;
	}
	
	
}
