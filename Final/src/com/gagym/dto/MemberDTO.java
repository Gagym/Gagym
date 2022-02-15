package com.gagym.dto;

public class MemberDTO
{
	// 회원번호, 회원아이디, 회원비밀번호, 이름, 이메일
	private String memNo, memId, memPw, memName, email;

	// 우편번호, 주소, 상세주소
	private String zipCode, addr, detailAddr;

	// 주민번호 앞자리 주민번호 뒷자리
	private String ssn1, ssn2;

	// 휴대폰번호, 집전화번호
	private String tel, hometel;

	// 성별
	private String gender;
	
	// 나이
	private int age;
	
	// 추가 - 신고 누적 횟수
	private int countReport;
	
	// 추가 - 블랙여부
	private String blackCheck;

	
	public String getMemNo()
	{
		return memNo;
	}

	public void setMemNo(String memNo)
	{
		this.memNo = memNo;
	}

	public String getMemId()
	{
		return memId;
	}

	public void setMemId(String memId)
	{
		this.memId = memId;
	}

	public String getMemPw()
	{
		return memPw;
	}

	public void setMemPw(String memPw)
	{
		this.memPw = memPw;
	}

	public String getMemName()
	{
		return memName;
	}

	public void setMemName(String memName)
	{
		this.memName = memName;
	}

	public String getEmail()
	{
		return email;
	}

	public void setEmail(String email)
	{
		this.email = email;
	}

	public String getZipCode()
	{
		return zipCode;
	}

	public void setZipCode(String zipCode)
	{
		this.zipCode = zipCode;
	}

	public String getAddr()
	{
		return addr;
	}

	public void setAddr(String addr)
	{
		this.addr = addr;
	}

	public String getDetailAddr()
	{
		return detailAddr;
	}

	public void setDetailAddr(String detailAddr)
	{
		this.detailAddr = detailAddr;
	}

	public String getSsn1()
	{
		return ssn1;
	}

	public void setSsn1(String ssn1)
	{
		this.ssn1 = ssn1;
	}

	public String getSsn2()
	{
		return ssn2;
	}

	public void setSsn2(String ssn2)
	{
		this.ssn2 = ssn2;
	}

	public String getTel()
	{
		return tel;
	}

	public void setTel(String tel)
	{
		this.tel = tel;
	}

	public String getHometel()
	{
		return hometel;
	}

	public void setHometel(String hometel)
	{
		this.hometel = hometel;
	}

	public String getGender()
	{
		return gender;
	}

	public void setGender(String gender)
	{
		this.gender = gender;
	}

	public int getAge()
	{
		return age;
	}

	public void setAge(int age)
	{
		this.age = age;
	}

	public int getCountReport()
	{
		return countReport;
	}

	public void setCountReport(int countReport)
	{
		this.countReport = countReport;
	}

	public String getBlackCheck()
	{
		return blackCheck;
	}

	public void setBlackCheck(String blackCheck)
	{
		this.blackCheck = blackCheck;
	}
	
	
}