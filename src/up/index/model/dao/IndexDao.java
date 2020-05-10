package up.index.model.dao;

import java.sql.CallableStatement;
import java.sql.Connection;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import common.JDBCTemplate;
import up.index.model.vo.HabitState;
import up.member.model.vo.Member;

/**
  * @FileName : IndexDao.java
  * @Project : semiproject
  * @Date : 2020. 5. 7. 
  * @작성자 : 김성민
  * @변경이력 : 없음
  * @프로그램 설명 : 메인페이지 Dao
  */
public class IndexDao {

	JDBCTemplate jdt = JDBCTemplate.getInstance();
	
	/**
	  * @Method Name : selectHabitList
	  * @작성일 : 2020. 5. 7.
	  * @작성자 : 김성민
	  * @변경이력 :  없음
	  * @Method 설명 : 습관 정보를 TB_HABIT 테이블에서 가져온다.
	  * @return Map<String, Object>
	 * @throws SQLException 
	  */
	public List<HabitState> selectHabitList(Connection con, Member m) throws SQLException{
		
		List<HabitState> hsList = new ArrayList<HabitState>();
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
//		오늘 날짜에 해당하는 습관만 조회
		String sql = "select * " + 
				"FROM tb_current_state cs " + 
				"inner join tb_habit h using (h_no) " + 
				"inner join tb_habit_check hc using (h_no) " + 
				"where " + 
				"h_no in (select h_no " + 
				"from tb_habit " + 
				"where m_id = ? and INSTR(h_selectday, TO_CHAR(sysdate, 'dy')) != 0)"
				+ "and TO_CHAR(H_CHECK_DATE, 'YYYY/MM/DD') = TO_CHAR(sysdate, 'YYYY/MM/DD')";
		
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, m.getUserId());
			rs = pstmt.executeQuery();
			while(rs.next()) {
				HabitState hs = new HabitState();
				
//				HabitState 데이터 모델 생성.
				hs.sethNo(rs.getInt(1));
				hs.setcStateNo(rs.getInt(2));
				hs.setcCount(rs.getInt(3));
				hs.setcCountall(rs.getInt(4));
				hs.setcPercent(rs.getInt(5));
				hs.setmId(rs.getString(6));
				hs.sethSubcategory(rs.getString(7));
				hs.sethStartDate(rs.getDate(8));
				hs.sethEndDate(rs.getDate(9));
				hs.sethSelectday(rs.getString(10));
				hs.sethMoney(rs.getInt(11));
				hs.sethTime(rs.getInt(12));
				hs.setcCode(rs.getInt(13));
				hs.sethCheckNo(rs.getInt(15));
				hs.sethCheckYN(rs.getString(16));
				hs.sethCheckDate(rs.getDate(17));
				System.out.println(hs.toString());
				hsList.add(hs);
			}
		} finally {
			jdt.close(rs, pstmt);
		}
		return hsList;
	}
	
	/**
	  * @Method Name : searchHabitList
	  * @작성일 : 2020. 5. 10.
	  * @작성자 : 김성민
	  * @변경이력 : 
	  * @Method 설명 : 검색어조회용 dao
	  * @param con
	  * @param m
	  * @param select
	  * @param searchContent
	  * @return
	  * @throws SQLException 
	  */
	public List<HabitState> searchHabitList(Connection con, Member m, String select, String searchContent) throws SQLException{
		List<HabitState> hsList = new ArrayList<HabitState>();
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
//		검색어 한 것 조회
		String sql = "select * FROM tb_current_state cs inner join tb_habit h using (h_no) inner join tb_category c using (c_code) where h_no in (select h_no from tb_habit where m_id = ?) and "+ select +" like '%'|| ? ||'%'";
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, m.getUserId());
			pstmt.setString(2, searchContent);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				HabitState hs = new HabitState();
//				HabitState 데이터 모델 생성.
				hs.setcCode(rs.getInt(1));
				hs.sethNo(rs.getInt(2));
				hs.setcStateNo(rs.getInt(3));
				hs.setcCount(rs.getInt(4));
				hs.setcCountall(rs.getInt(5));
				hs.setcPercent(rs.getInt(6));
				hs.setmId(rs.getString(7));
				hs.sethSubcategory(rs.getString(8));
				hs.sethStartDate(rs.getDate(9));
				hs.sethEndDate(rs.getDate(10));
				hs.sethSelectday(rs.getString(11));
				hs.sethMoney(rs.getInt(12));
				hs.sethTime(rs.getInt(13));
				System.out.println(hs.toString());
				hsList.add(hs);
			}
		} finally {
			jdt.close(rs, pstmt);
		}
		return hsList;
	}
	
	
	/**
	  * @Method Name : checkhabit
	  * @작성일 : 2020. 5. 10.
	  * @작성자 : 김성민
	  * @변경이력 : 
	  * @Method 설명 : 안씀
	  * @param con
	  * @param m
	  * @param hNo
	  * @return
	  * @throws SQLException 
	  */
	public int checkhabit(Connection con, Member m, int hNo) throws SQLException{
		int res = 0;
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
//		오늘 날짜로 검색한 습관 중에 튜플이 생성되어있는지 확인
		String sql = "select COUNT(*) from tb_habit_check where m_id = ? and h_no = ? and TO_CHAR(H_CHECK_DATE, 'YYYY/MM/DD') = TO_CHAR(sysdate, 'YYYY/MM/DD')";
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, m.getUserId());
			pstmt.setInt(2, hNo);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				if(rs.getInt(1) >= 1) {
					res = 1;
				}
			}
			
			
		} finally {
			jdt.close(rs, pstmt);
		}
		return res;
	}
	
	/**
	  * @Method Name : addHabitChack
	  * @작성일 : 2020. 5. 10.
	  * @작성자 : 김성민
	  * @변경이력 : 
	  * @Method 설명 : 습관 체크 추가 dao
	  * @param con
	  * @param m
	  * @param hNo
	  * @return
	  * @throws SQLException 
	  */
	public int addHabitChack(Connection con, int cCode) throws SQLException{
		int res = 0;
		CallableStatement cstm = null;
		String sql = "{call P_ADD_HABIT_CHECK(?)}";
		
		try {
			cstm = con.prepareCall(sql);
			cstm.setInt(1, cCode);
			res = cstm.executeUpdate();
		}finally {
			jdt.close(cstm);
		}
		
		return res;
	}
	
	/**
	  * @Method Name : removeHabitChack
	  * @작성일 : 2020. 5. 10.
	  * @작성자 : 김성민
	  * @변경이력 : 
	  * @Method 설명 : 습관 체크 해제 dao
	  * @param con
	  * @param cCode
	  * @return int
	  * @throws SQLException 
	  */
	public int removeHabitChack(Connection con, int cCode) throws SQLException{
		int res = 0;
		CallableStatement cstm = null;
		String sql = "{call P_DELETE_HABIT_CHECK(?)}";
		
		try {
			cstm = con.prepareCall(sql);
			cstm.setInt(1, cCode);
			res = cstm.executeUpdate();
		}finally {
			jdt.close(cstm);
		}
		
		return res;
	}
	
	/**
	  * @Method Name : insertTodayCheck
	  * @작성일 : 2020. 5. 10.
	  * @작성자 : 김성민
	  * @변경이력 : 
	  * @Method 설명 : 습관 체크 테이블에 오늘의 습관을 'n'으로 추가해줌
	  * @param con
	  * @param m
	  * @param hNo
	  * @return
	  * @throws SQLException 
	  */
	public int insertTodayCheck(Connection con, Member m, int hNo) throws SQLException{
		int res = 0;
		
		PreparedStatement pstmt = null;
//		오늘 날짜로 검색한 습관 중에 튜플이 생성되어있는지 확인
		String sql = "insert into tb_habit_check values(S_H_CHECK_NO.nextval, 'n', sysdate, ?, ?)";
	
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, m.getUserId());
			pstmt.setInt(2, hNo);
			res = pstmt.executeUpdate();
			
		} finally {
			jdt.close(pstmt);
		}
		return res;
	}
}
