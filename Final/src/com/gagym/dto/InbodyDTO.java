package com.gagym.dto;

public class InbodyDTO
{
	// 인바디 번호, 회원 번호
	private String inbodyNo, memNo;
	
	// 날짜
	private String inbodyDate;
	
	//체중, 키, 골격근량, 체지방량, 체지방률
	private double weight, tall, muscle, bodyfat, bodyfatPer, bmi;

	public String getInbodyNo()
	{
		return inbodyNo;
	}

	public void setInbodyNo(String inbodyNo)
	{
		this.inbodyNo = inbodyNo;
	}

	public String getMemNo()
	{
		return memNo;
	}

	public void setMemNo(String memNo)
	{
		this.memNo = memNo;
	}

	public String getInbodyDate()
	{
		return inbodyDate;
	}

	public void setInbodyDate(String inbodyDate)
	{
		this.inbodyDate = inbodyDate;
	}

	public double getWeight()
	{
		return weight;
	}

	public void setWeight(double weight)
	{
		this.weight = weight;
	}

	public double getTall()
	{
		return tall;
	}

	public void setTall(double tall)
	{
		this.tall = tall;
	}

	public double getMuscle()
	{
		return muscle;
	}

	public void setMuscle(double muscle)
	{
		this.muscle = muscle;
	}

	public double getBodyfat()
	{
		return bodyfat;
	}

	public void setBodyfat(double bodyfat)
	{
		this.bodyfat = bodyfat;
	}

	public double getBodyfatPer()
	{
		return bodyfatPer;
	}

	public void setBodyfatPer(double bodyfatPer)
	{
		this.bodyfatPer = bodyfatPer;
	}

	public double getBmi()
	{
		return bmi;
	}

	public void setBmi(double bmi)
	{
		this.bmi = bmi;
	}
	
	
}
