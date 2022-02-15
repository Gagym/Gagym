package com.gagym.dto;

public class AreaDTO
{
	// 도시번호, 도시이름
	private String cityNo, cityName;
	
	// 시군구번호, 시군구이름
	private String sigunguNo, sigunguName;

	
	// getter / setter
	public String getCityNo()
	{
		return cityNo;
	}

	public void setCityNo(String cityNo)
	{
		this.cityNo = cityNo;
	}

	public String getCityName()
	{
		return cityName;
	}

	public void setCityName(String cityName)
	{
		this.cityName = cityName;
	}

	public String getSigunguNo()
	{
		return sigunguNo;
	}

	public void setSigunguNo(String sigunguNo)
	{
		this.sigunguNo = sigunguNo;
	}

	public String getSigunguName()
	{
		return sigunguName;
	}

	public void setSigunguName(String sigunguName)
	{
		this.sigunguName = sigunguName;
	}
	
}
