package com.gagym.dto;

public class InstructorCalcDTO
{
	// 회원번호, 강사번호, 강사이름, 아이디, 이번달 정산 아령, 아령 환전 금액
	private String memNo, insNo, insName, memId;
	private int classPoint, classPointMoney;
	public String getMemNo()
	{
		return memNo;
	}
	public void setMemNo(String memNo)
	{
		this.memNo = memNo;
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
	public String getMemId()
	{
		return memId;
	}
	public void setMemId(String memId)
	{
		this.memId = memId;
	}
	public int getClassPoint()
	{
		return classPoint;
	}
	public void setClassPoint(int classPoint)
	{
		this.classPoint = classPoint;
	}
	public int getClassPointMoney()
	{
		return classPointMoney;
	}
	public void setClassPointMoney(int classPoint)
	{
		this.classPointMoney = classPoint*1000;
	}
	

}
