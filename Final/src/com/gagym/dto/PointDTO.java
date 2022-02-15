package com.gagym.dto;

public class PointDTO
{
	// 회원번호, 결제번호, 결제날짜, 환불날짜
	private String memNo, pointPayNo, payDate, pointReDate;
	
	// 지급아령, 사용아령, 결제금액, 환불금액
	private int point, usepoint, pointPay, pointRepay;

	public String getMemNo()
	{
		return memNo;
	}

	public void setMemNo(String memNo)
	{
		this.memNo = memNo;
	}

	public String getPointPayNo()
	{
		return pointPayNo;
	}

	public void setPointPayNo(String pointPayNo)
	{
		this.pointPayNo = pointPayNo;
	}

	public String getPayDate()
	{
		return payDate;
	}

	public void setPayDate(String payDate)
	{
		this.payDate = payDate;
	}

	public String getPointReDate()
	{
		return pointReDate;
	}

	public void setPointReDate(String pointReDate)
	{
		this.pointReDate = pointReDate;
	}

	public int getPoint()
	{
		return point;
	}

	public void setPoint(int point)
	{
		this.point = point;
	}

	public int getUsepoint()
	{
		return usepoint;
	}

	public void setUsepoint(int usepoint)
	{
		this.usepoint = usepoint;
	}

	public int getPointPay()
	{
		return pointPay;
	}

	public void setPointPay(int pointPay)
	{
		this.pointPay = pointPay;
	}

	public int getPointRepay()
	{
		return pointRepay;
	}

	public void setPointRepay(int pointRepay)
	{
		this.pointRepay = pointRepay;
	}
	
	
}