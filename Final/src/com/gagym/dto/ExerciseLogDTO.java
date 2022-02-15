package com.gagym.dto;

public class ExerciseLogDTO
{
	// 회원번호, 운동일지번호, 운동일지날짜
	private String memNo, exeLogNo, exeLogDate;
	
	// 운동종류명, 운동기구명, 난이도, 운동부위명
	private String exeName, exeEqName, difName, exePart;
	
	// 세트, 횟수, 중량
	private int exeSet, exeCount, weight;

	
	public String getMemNo()
	{
		return memNo;
	}

	public void setMemNo(String memNo)
	{
		this.memNo = memNo;
	}

	public String getExeLogNo()
	{
		return exeLogNo;
	}

	public void setExeLogNo(String exeLogNo)
	{
		this.exeLogNo = exeLogNo;
	}

	public String getExeLogDate()
	{
		return exeLogDate;
	}

	public void setExeLogDate(String exeLogDate)
	{
		this.exeLogDate = exeLogDate;
	}

	public String getExeName()
	{
		return exeName;
	}

	public void setExeName(String exeName)
	{
		this.exeName = exeName;
	}

	public String getExeEqName()
	{
		return exeEqName;
	}

	public void setExeEqName(String exeEqName)
	{
		this.exeEqName = exeEqName;
	}

	public String getDifName()
	{
		return difName;
	}

	public void setDifName(String difName)
	{
		this.difName = difName;
	}

	public String getExePart()
	{
		return exePart;
	}

	public void setExePart(String exePart)
	{
		this.exePart = exePart;
	}

	public int getExeSet()
	{
		return exeSet;
	}

	public void setExeSet(int exeSet)
	{
		this.exeSet = exeSet;
	}

	public int getExeCount()
	{
		return exeCount;
	}

	public void setExeCount(int exeCount)
	{
		this.exeCount = exeCount;
	}

	public int getWeight()
	{
		return weight;
	}

	public void setWeight(int weight)
	{
		this.weight = weight;
	}
	
}