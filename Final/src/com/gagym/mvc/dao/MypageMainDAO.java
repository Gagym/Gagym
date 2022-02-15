package com.gagym.mvc.dao;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.sql.DataSource;

import com.gagym.dto.AreaDTO;
import com.gagym.dto.EyebodyDTO;
import com.gagym.dto.InbodyDTO;
import com.gagym.dto.InstructorDTO;
import com.gagym.dto.MemberDTO;
import com.gagym.dto.PointDTO;
import com.gagym.mvc.inter.IMypageMainDAO;

public class MypageMainDAO implements IMypageMainDAO
{
	// 인터페이스 자료형을 속성으로 구성
	private DataSource dataSource;

	// setter 구성
	public void setDataSource(DataSource dataSource)
	{
		this.dataSource = dataSource;
	}
	
	
	// 1-1. 개인정보 리스트
	@Override
	public MemberDTO privacyList(String mno) throws SQLException
	{
		MemberDTO mem = new MemberDTO();

		Connection conn = dataSource.getConnection();

		String sql = "SELECT ZIP_CODE, ADDR, DETAIL_ADDR, MEM_NAME, TEL, HOMETEL, EMAIL, FN_GENDER(CRYPTPACK.DECRYPT(SSN2, '1234567')) AS GENDER" + 
					", CASE WHEN SUBSTR(CRYPTPACK.DECRYPT(SSN2, '1234567'), 1, 1) IN ('1','2')" + 
					" THEN EXTRACT(YEAR FROM SYSDATE)-(TO_NUMBER(SUBSTR(SSN1, 1, 2)) + 1899)" + 
					" WHEN SUBSTR(CRYPTPACK.DECRYPT(SSN2, '1234567'), 1, 1) IN ('3','4')" + 
					" THEN EXTRACT(YEAR FROM SYSDATE)-(TO_NUMBER(SUBSTR(SSN1, 1, 2)) + 1999)" + 
					" ELSE -1" + 
					" END AS AGE" + 
					" FROM PRIVACY" + 
					" WHERE MEM_NO=?";

		PreparedStatement pstmt = conn.prepareStatement(sql);
		
		pstmt.setString(1, mno);

		ResultSet rs = pstmt.executeQuery();

		while (rs.next())
		{
			mem.setZipCode(rs.getString(1));
			mem.setAddr(rs.getString(2));
			mem.setDetailAddr(rs.getString(3));
			mem.setMemName(rs.getString(4));
			mem.setTel(rs.getString(5));
			mem.setHometel(rs.getString(6));
			mem.setEmail(rs.getString(7));
			mem.setGender(rs.getString(8));
			mem.setAge(rs.getInt(9));
		}

		rs.close();
		pstmt.close();
		conn.close();

		return mem;

	}
	
	// 1-2. 개인정보 수정
	@Override
	public int privacyUpdate(MemberDTO member) throws SQLException
	{
		int result = 0;
		
		Connection conn = dataSource.getConnection();
		
		String sql = "UPDATE PRIVACY" + 
					 " SET ZIP_CODE=?, ADDR=?, DETAIL_ADDR=?, TEL=?, HOMETEL=?, EMAIL=?" + 
					 " WHERE MEM_NO=?";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, member.getZipCode());
		pstmt.setString(2, member.getAddr());
		pstmt.setString(3, member.getDetailAddr());
		pstmt.setString(4, member.getTel());
		pstmt.setString(5, member.getHometel());
		pstmt.setString(6, member.getEmail());
		pstmt.setString(7, member.getMemNo());
		
		result = pstmt.executeUpdate();
		
		pstmt.close();
		conn.close();
		
		return result;
	}
	
	// 2-1. 인바디 리스트
	@Override
	public ArrayList<InbodyDTO> inbodyList(String mno) throws SQLException
	{
		ArrayList<InbodyDTO> result = new ArrayList<InbodyDTO>();

		Connection conn = dataSource.getConnection();

		String sql = "SELECT INBODY_NO, TO_CHAR(INBODY_DATE, 'YYYY-MM-DD'), WEIGHT, TALL, MUSCLE, BODYFAT, BODYFAT_PER, ROUND(WEIGHT/((TALL/100)*(TALL/100)), 2)"
					+ " AS BMI FROM INBODY WHERE MEM_NO=? ORDER BY INBODY_DATE DESC";

		PreparedStatement pstmt = conn.prepareStatement(sql);
		
		pstmt.setString(1, mno);

		ResultSet rs = pstmt.executeQuery();

		while (rs.next())
		{
			InbodyDTO inbody = new InbodyDTO();
			
			inbody.setInbodyNo(rs.getString(1));
			inbody.setInbodyDate(rs.getString(2));
			inbody.setWeight(rs.getDouble(3));
			inbody.setTall(rs.getDouble(4));
			inbody.setMuscle(rs.getDouble(5));
			inbody.setBodyfat(rs.getDouble(6));
			inbody.setBodyfatPer(rs.getDouble(7));
			inbody.setBmi(rs.getDouble(8));
			
			result.add(inbody);
		}

		rs.close();
		pstmt.close();
		conn.close();

		return result;

	}
	
	// 2-2. 인바디 등록
	@Override
	public int inbodyAdd(InbodyDTO inbody) throws SQLException
	{
		int result = 0;
		
		Connection conn = dataSource.getConnection();
		
		String sql = "INSERT INTO INBODY(INBODY_NO, MEM_NO, INBODY_DATE"
					+ ", WEIGHT, TALL, MUSCLE, BODYFAT, BODYFAT_PER)"
					+ " VALUES('INBODY-'|| SEQ_INBODY.NEXTVAL"
					+ ", ?, SYSDATE, ?, ?, ?, ?, ?)";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, inbody.getMemNo());
		pstmt.setDouble(2, inbody.getWeight());
		pstmt.setDouble(3, inbody.getTall());
		pstmt.setDouble(4, inbody.getMuscle());
		pstmt.setDouble(5, inbody.getBodyfat());
		pstmt.setDouble(6, inbody.getBodyfatPer());
		
		result = pstmt.executeUpdate();
		
		pstmt.close();
		conn.close();
		
		return result;
		
	}
	
	// 2-3. 인바디 삭제
	@Override
	public int inbodyRemove(String inbodyNo) throws SQLException
	{
		int result = 0;
		
		Connection conn = dataSource.getConnection();
		
		String sql = "DELETE FROM INBODY WHERE INBODY_NO=?";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, inbodyNo);
		
		result = pstmt.executeUpdate();
		
		pstmt.close();
		conn.close();
		
		return result;
		
	}
	
	// 3-1. 눈바디 리스트
	@Override
	public ArrayList<EyebodyDTO> eyebodyList(String mno) throws SQLException
	{
		ArrayList<EyebodyDTO> result = new ArrayList<EyebodyDTO>();
		
		Connection conn = dataSource.getConnection();
		
		String sql = "SELECT EYEBODY_NO, MEM_NO, TO_CHAR(EYEBODY_DATE, 'YYYY-MM-DD'), PHOTO_PATH FROM EYEBODY WHERE MEM_NO=? ORDER BY EYEBODY_DATE DESC";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		
		pstmt.setString(1, mno);
		
		ResultSet rs = pstmt.executeQuery();
		
		while (rs.next())
		{
			EyebodyDTO eyebody = new EyebodyDTO();
			
			eyebody.setEyebodyNo(rs.getString(1));
			eyebody.setMemNo(rs.getString(2));
			eyebody.setEyebodyDate(rs.getString(3));
			eyebody.setPhotoPath(rs.getString(4));
			
			result.add(eyebody);
		}
		
		rs.close();
		pstmt.close();
		conn.close();
		
		return result;
		
	}
	
	// 3-2. 눈바디 등록
	@Override
	public int eyebodyAdd(EyebodyDTO eyebody) throws SQLException
	{
		int result = 0;
		
		Connection conn = dataSource.getConnection();
		
		String sql = "INSERT INTO EYEBODY(EYEBODY_NO, MEM_NO, EYEBODY_DATE, PHOTO_PATH)" 
					+ " VALUES('EYEBODY-'|| SEQ_EYEBODY.NEXTVAL, ?, SYSDATE, ?)";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, eyebody.getMemNo());
		pstmt.setString(2, eyebody.getPhotoPath());
		
		result = pstmt.executeUpdate();
		
		pstmt.close();
		conn.close();
		
		return result;
		
	}
	
	// 3-3. 눈바디 삭제
		@Override
		public int eyebodyRemove(String eyebodyNo) throws SQLException
		{
			int result = 0;
			
			Connection conn = dataSource.getConnection();
			
			String sql = "DELETE FROM EYEBODY WHERE EYEBODY_NO=?";
			
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, eyebodyNo);
			
			result = pstmt.executeUpdate();
			
			pstmt.close();
			conn.close();
			
			return result;
			
		}
		
	
	// 4-1. 회원 이름, 아이디
	@Override
	public MemberDTO getNameId(String mno) throws SQLException
	{
		MemberDTO dto = new MemberDTO();
		
		Connection conn = dataSource.getConnection();
		
		String sql="SELECT MEM_NAME, MEM_ID FROM PRIVACY WHERE MEM_NO=?";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		
		pstmt.setString(1, mno);
		
		ResultSet rs = pstmt.executeQuery();
		
		while (rs.next())
		{		
			dto.setMemNo(mno);
			dto.setMemName(rs.getString(1));
			dto.setMemId(rs.getString(2));
			
		}
		
		rs.close();
		pstmt.close();
		conn.close();
		
		return dto;
	}
	
	
	// 4-2. 비밀번호 일치 여부 (일치하면 1)
	@Override
	public int checkPw(String mno, String pw1) throws SQLException
	{
		int result = 0;		
		
		String pw2 = null;
		
		Connection conn = dataSource.getConnection();
		
		String sql="SELECT MEM_PW FROM PRIVACY WHERE MEM_NO=?";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		
		pstmt.setString(1, mno);
		
		ResultSet rs = pstmt.executeQuery();
		
		while (rs.next())
		{		
			pw2 = rs.getString(1);
		}
		
		if(pw1.equals(pw2))
		{
			result = 1;
		}
		else
		{
			result = 0;
		}
		
		rs.close();
		pstmt.close();
		conn.close();
		
		return result;
	}
	
	
	// 4-3. 탈퇴 체크 1. 강좌 예약 존재 여부 (존재하면 1 - 탈퇴불가)
	@Override
	public int withdrawCheckClass(String mno) throws SQLException
	{
		int result = 0;		
		
		Connection conn = dataSource.getConnection();
		
		String sql="SELECT PRC_CODE, CNL_DATE, CLASS_COM_DATE FROM WITHDRAWALCHECK1VIEW WHERE MEM_NO =  ?";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		
		pstmt.setString(1, mno);
		
		ResultSet rs = pstmt.executeQuery();
		
		int prcCode = 0;
		String cnlDate = null;
		String comDate = null;
		
		while (rs.next())
		{		
			prcCode = rs.getInt(1);
			cnlDate = rs.getString(2);
			comDate = rs.getString(3);
		}
		
		if(prcCode == 1)	// 예약 승인된 강좌 중
		{
			if(cnlDate == null && comDate == null)	// 취소도 완료도 아닌 상태 => 예약 존재
			{
				result = 1; 
			}
		}
		
		rs.close();
		pstmt.close();
		conn.close();
		
		return result;
	}
	
	// 4-4. 탈퇴 체크 2. 원데이 예약 존재 여부 (존재하면 1 - 탈퇴불가)
	@Override
	public int withdrawCheckOneday(String mno) throws SQLException
	{
		int result = 0;		
		
		Connection conn = dataSource.getConnection();
		
		String sql="SELECT ONEDAY_FIX_NO, ONEDAY_CNL_DATE, ONEDAY_COM_DATE FROM WITHDRAWALCHECK2VIEW WHERE MEM_NO = ?";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		
		pstmt.setString(1, mno);
		
		ResultSet rs = pstmt.executeQuery();
		
		String fix = null;
		String cnlDate = null;
		String comDate = null;
		
		while (rs.next())
		{		
			fix = rs.getString(1);
			cnlDate = rs.getString(2);
			comDate = rs.getString(3);
		}
		
		if(fix != null)	// 원데이 예약 확정 중
		{
			if(cnlDate == null && comDate ==null)	// 취소도 완료도 아닌 상태 => 예약 존재
			{
				result = 1; 
			}
		}
		
		rs.close();
		pstmt.close();
		conn.close();
		
		return result;
	}

	// 4-5. 회원 탈퇴
	@Override
	public int withdraw(String mno, String reason, String oth) throws SQLException
	{
		int result = 0;		
		
		Connection conn = dataSource.getConnection();
		
		String sql="{call PRC_MEMBER_OUT(?, ?, ?)}";
		
		CallableStatement cstmt = conn.prepareCall(sql);
		
		cstmt.setString(1, mno);
		cstmt.setString(2, reason);
		cstmt.setString(3, oth);
		
		result = cstmt.executeUpdate();
		
		cstmt.close();
		conn.close();
		
		return result;
	}
	
	// 5-1. 아령 결제 환불내역
	@Override
	public ArrayList<PointDTO> pointList(String mno) throws SQLException
	{
		ArrayList<PointDTO> result = new ArrayList<PointDTO>();

		Connection conn = dataSource.getConnection();

		String sql = "SELECT MEM_NO, PAYDATE" + 
				", CASE POINT WHEN 50 THEN 60000" + 
				"             WHEN 100 THEN 110000" + 
				"             WHEN 300 THEN 320000" + 
				"             WHEN 500 THEN 530000" + 
				"  ELSE -1" + 
				"  END AS POINTPAY" + 
				", POINT, POINTRE_DATE, NVL(POINTREPAY, 0), POINTPAY_NO" + 
				", CASE WHEN FN_POINTCHECK(MEM_NO, POINTPAY_NO) > POINT" + 
				"       THEN 0 " + 
				"       WHEN FN_POINTCHECK(MEM_NO, POINTPAY_NO) >= 0" + 
				"       THEN POINT - (FN_POINTSUM(MEM_NO, POINTPAY_NO)-FN_POINTPAY(MEM_NO))" + 
				"       WHEN FN_POINTCHECK(MEM_NO, POINTPAY_NO) < 0" + 
				"       THEN POINT" + 
				"  ELSE -1 END AS USEPOINT" +
				" FROM POINTVIEW" + 
				" WHERE MEM_NO = ? ORDER BY PAYDATE";

		PreparedStatement pstmt = conn.prepareStatement(sql);
		
		pstmt.setString(1, mno);

		ResultSet rs = pstmt.executeQuery();

		while (rs.next())
		{
			PointDTO point = new PointDTO();
			
			point.setMemNo(rs.getString(1));
			point.setPayDate(rs.getString(2));
			point.setPointPay(rs.getInt(3));
			point.setPoint(rs.getInt(4));
			point.setPointReDate(rs.getString(5));
			point.setPointRepay(rs.getInt(6));
			point.setPointPayNo(rs.getString(7));
			point.setUsepoint(rs.getInt(8));
			
			result.add(point);
		}

		rs.close();
		pstmt.close();
		conn.close();

		return result;

	}
	
	// 5-2. 잔여아령
	@Override
	public int havePoint(String mno) throws SQLException
	{
		int result = 0;

		Connection conn = dataSource.getConnection();

		String sql = "SELECT SUM(POINT)-FN_POINTPAY(?) AS HAVEPOINT" + 
					 " FROM POINTPAY P LEFT JOIN POINTRE PR" + 
					 " ON P.POINTPAY_NO = PR.POINTPAY_NO" + 
					 " WHERE P.MEM_NO = ?" + 
					 " AND PR.POINTRE_NO IS NULL";

		PreparedStatement pstmt = conn.prepareStatement(sql);
		
		pstmt.setString(1, mno);
		pstmt.setString(2, mno);

		ResultSet rs = pstmt.executeQuery();

		while (rs.next())
		{
			result = rs.getInt(1);
		}

		rs.close();
		pstmt.close();
		conn.close();

		return result;

	}
	
	// 5-3. 환불 100%여부(결제당일 여부) (존재하면 1 - 100% 가능)
	@Override
	public int refundCheck(String pno) throws SQLException
	{
		int result = 0;		
		
		Connection conn = dataSource.getConnection();
		
		String sql="SELECT CASE WHEN TO_CHAR(PAYDATE, 'DD') = TO_CHAR(SYSDATE, 'DD') THEN 1 ELSE 0 END AS CK" + 
					" FROM POINTPAY P LEFT JOIN MEMBER M" + 
					" ON M.MEM_NO = P.MEM_NO" + 
					" WHERE POINTPAY_NO = ?";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		
		pstmt.setString(1, pno);
		
		ResultSet rs = pstmt.executeQuery();
		
		while (rs.next())
		{		
			result = rs.getInt(1);
		}

		rs.close();
		pstmt.close();
		conn.close();
		
		return result;
	}
	
	// 5-4. 환불
	@Override
	public int refundAdd(String pno, int pointPay) throws SQLException
	{
		int result = 0;
		
		Connection conn = dataSource.getConnection();
		
		String sql = "INSERT INTO POINTRE(POINTRE_NO, POINTPAY_NO, POINTRE_DATE, POINTREPAY)" + 
				"VALUES('POINTRE-'||SEQ_POINTRE.NEXTVAL, ?, SYSDATE, ?)";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, pno);
		pstmt.setInt(2, pointPay);
		
		result = pstmt.executeUpdate();
		
		pstmt.close();
		conn.close();
		
		return result;
		
	}
	
	// 6-1. 강사 신청 중인지 체크(1이면 신청가능)
	@Override
	public int insInsertCheck(String mno) throws SQLException
	{
		int result = 0;		
		
		Connection conn = dataSource.getConnection();
		
		String sql="SELECT IR.REQ_NO" + 
				" FROM INSTRUCTOR_REQUEST IR LEFT JOIN INSTRUCTOR_REQUEST_PRC IRP" + 
				" ON IR.REQ_NO = IRP.REQ_NO" + 
				" WHERE IR.MEM_NO = ? AND (PRC_CODE=1 OR PRC_CODE IS NULL)";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		
		pstmt.setString(1, mno);
		
		ResultSet rs = pstmt.executeQuery();
		
		String check = null;
		
		while (rs.next())
		{		
			check = rs.getString(1);
		}
		
		if(check == null)	// 신청X, 반려
		{
			result = 1; 
		}
		
		rs.close();
		pstmt.close();
		conn.close();
		
		return result;
	}
	
	// 6-2. 자격증 리스트
	@Override
	public ArrayList<InstructorDTO> cerList() throws SQLException
	{
		ArrayList<InstructorDTO> result = new ArrayList<InstructorDTO>();

		Connection conn = dataSource.getConnection();

		String sql = "SELECT CER_NO, CER_NAME FROM CERTIFICATE";

		PreparedStatement pstmt = conn.prepareStatement(sql);

		ResultSet rs = pstmt.executeQuery();

		while (rs.next())
		{
			InstructorDTO ins = new InstructorDTO();
			
			ins.setCerNo(rs.getString(1));
			ins.setCerName(rs.getString(2));
			
			result.add(ins);
		}

		rs.close();
		pstmt.close();
		conn.close();

		return result;

	}
	
	// 6-3. 도시 리스트(1차 select)
	@Override
	public ArrayList<AreaDTO> cityList() throws SQLException
	{
		ArrayList<AreaDTO> result = new ArrayList<AreaDTO>();

		Connection conn = dataSource.getConnection();

		String sql = "SELECT CITY_NO, CITY_NAME FROM CITY";

		PreparedStatement pstmt = conn.prepareStatement(sql);

		ResultSet rs = pstmt.executeQuery();

		while (rs.next())
		{
			AreaDTO area = new AreaDTO();
			
			area.setCityNo(rs.getString(1));
			area.setCityName(rs.getString(2));
			
			result.add(area);
		}

		rs.close();
		pstmt.close();
		conn.close();

		return result;

	}
	
	// 6-4. 시군구 리스트(2차 select)
	@Override
	public ArrayList<AreaDTO> areaList(String cno) throws SQLException
	{
		ArrayList<AreaDTO> result = new ArrayList<AreaDTO>();

		Connection conn = dataSource.getConnection();

		String sql = "SELECT SIGUNGU_NO, SIGUNGU_NAME FROM SIGUNGU WHERE CITY_NO = ?";

		PreparedStatement pstmt = conn.prepareStatement(sql);
		
		pstmt.setString(1, cno);

		ResultSet rs = pstmt.executeQuery();

		while (rs.next())
		{
			AreaDTO area = new AreaDTO();
			
			area.setSigunguNo(rs.getString(1));
			area.setSigunguName(rs.getString(2));
			
			result.add(area);
		}

		rs.close();
		pstmt.close();
		conn.close();

		return result;

	}
	
	// 6-5-1. 강사 신청 INSERT
	@Override
	public int insReqAdd(String memNo) throws SQLException
	{
		int result = 0;
		
		Connection conn = dataSource.getConnection();
		
		String sql = "INSERT INTO INSTRUCTOR_REQUEST(REQ_NO, MEM_NO, REQ_DATE)" + 
					" VALUES('IR-' || SEQ_IR.NEXTVAL, ?, SYSDATE)";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, memNo);
		
		result = pstmt.executeUpdate();
		
		pstmt.close();
		conn.close();
		
		return result;
		
	}
	
	// 6-5-2. 자격증증명 INSERT
	@Override
	public int insCerAdd(String memNo, String cerNo, String cerDate, String proofPath) throws SQLException
	{
		int result = 0;
		
		Connection conn = dataSource.getConnection();
		
		String sql = "INSERT INTO CERTIFICATE_PROOF(PROOF_NO, REQ_NO, CER_NO, CER_DATE, PROOF_PATH, ADD_DATE)" + 
					" VALUES('CP-' || SEQ_CP.NEXTVAL, FN_RECENTREQ(?), ?, TO_DATE(?, 'YYYY-MM-DD'), ?, SYSDATE)";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, memNo);
		pstmt.setString(2, cerNo);
		pstmt.setString(3, cerDate);
		pstmt.setString(4, proofPath);
		
		result = pstmt.executeUpdate();
		
		pstmt.close();
		conn.close();
		
		return result;
		
	}
	
	// 6-5-3. 수상경력 INSERT
	@Override
	public int insPrzAdd(String memNo, String przName, String przMedal, String przDate) throws SQLException
	{
		int result = 0;
		
		Connection conn = dataSource.getConnection();
		
		String sql = "INSERT INTO PRIZE(PRZ_NO, REQ_NO, PRZ_NAME, PRZ_MEDAL, PRZ_DATE, ADD_DATE)" + 
					" VALUES('PRIZE-'|| SEQ_PRIZE.NEXTVAL, FN_RECENTREQ(?), ?, ?, TO_DATE(?, 'YYYY-MM-DD'), SYSDATE)";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, memNo);
		pstmt.setString(2, przName);
		pstmt.setString(3, przMedal);
		pstmt.setString(4, przDate);
		
		result = pstmt.executeUpdate();
		
		pstmt.close();
		conn.close();
		
		return result;
		
	}
	
	// 6-5-4. 활동경력 INSERT
	@Override
	public int insExpAdd(String memNo, String expContent, String expStartDate, String expEndDate) throws SQLException
	{
		int result = 0;
		
		Connection conn = dataSource.getConnection();
		
		String sql = "INSERT INTO EXPERIENCE(EXP_NO, REQ_NO, EXP_CONTENT, EXP_STARTDATE, EXP_ENDDATE, ADD_DATE)" + 
					" VALUES('EXPERIENCE-'|| SEQ_EXPERIENCE.NEXTVAL, FN_RECENTREQ(?), ?, TO_DATE(?, 'YYYY-MM-DD')" + 
					", TO_DATE(?, 'YYYY-MM-DD'), SYSDATE)";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, memNo);
		pstmt.setString(2, expContent);
		pstmt.setString(3, expStartDate);
		pstmt.setString(4, expEndDate);
		
		result = pstmt.executeUpdate();
		
		pstmt.close();
		conn.close();
		
		return result;
		
	}
	
	// 6-5-5. 활동지역 INSERT
	@Override
	public int insAreaAdd(String memNo, String sigunguNo) throws SQLException
	{
		int result = 0;
		
		Connection conn = dataSource.getConnection();
		
		String sql = "INSERT INTO INSTRUCTOR_AREA(AREA_NO, REQ_NO, SIGUNGU_NO, ADD_DATE)" + 
					" VALUES('IA-' || SEQ_IA.NEXTVAL, FN_RECENTREQ(?), ?, SYSDATE)";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, memNo);
		pstmt.setString(2, sigunguNo);
		
		result = pstmt.executeUpdate();
		
		pstmt.close();
		conn.close();
		
		return result;
		
	}
	
}
