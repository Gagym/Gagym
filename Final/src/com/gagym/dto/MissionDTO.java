package com.gagym.dto;

public class MissionDTO
{
	// 강사이름, 강사아이디, 회원번호
	private String insName, insId, memNo;
	
	// 미션운동번호, 미션날짜, 미션완료여부
	private String missionExeNo, missionDate, missionComCk;
	
	// 운동종류명, 운동기구명, 난이도, 운동부위명
	private String exeName, exeEqName, difName, exePart;
	
	// 미션세트, 미션횟수, 미션중량
	private int misSet, misCount, misWeight;

	public String getInsName()
	{
		return insName;
	}

	public void setInsName(String insName)
	{
		this.insName = insName;
	}

	public String getInsId()
	{
		return insId;
	}

	public void setInsId(String insId)
	{
		this.insId = insId;
	}

	public String getMemNo()
	{
		return memNo;
	}

	public void setMemNo(String memNo)
	{
		this.memNo = memNo;
	}

	public String getMissionExeNo()
	{
		return missionExeNo;
	}

	public void setMissionExeNo(String missionExeNo)
	{
		this.missionExeNo = missionExeNo;
	}

	public String getMissionDate()
	{
		return missionDate;
	}

	public void setMissionDate(String missionDate)
	{
		this.missionDate = missionDate;
	}

	public String getMissionComCk()
	{
		return missionComCk;
	}

	public void setMissionComCk(String missionComCk)
	{
		this.missionComCk = missionComCk;
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

	public int getMisSet()
	{
		return misSet;
	}

	public void setMisSet(int misSet)
	{
		this.misSet = misSet;
	}

	public int getMisCount()
	{
		return misCount;
	}

	public void setMisCount(int misCount)
	{
		this.misCount = misCount;
	}

	public int getMisWeight()
	{
		return misWeight;
	}

	public void setMisWeight(int misWeight)
	{
		this.misWeight = misWeight;
	}
	
}