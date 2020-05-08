package up.index.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import common.JDBCTemplate;
import up.habit.model.vo.CurrentState;
import up.habit.model.vo.Habit;

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
	public List<Habit> selectHabitList(Connection con, String mId) throws SQLException{
		List<Habit> res = new ArrayList<Habit>();
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select H_NO, H_SUBCATEGORY, H_START_DATE, H_END_DATE, H_SELECTDAY, " + 
				"H_MONEY, H_TIME, C_CODE, M_ID " + 
				"from tb_habit h " + 
				"inner join tb_category c using (c_code) " + 
				"where m_id = ? and INSTR(h_selectday, TO_CHAR(sysdate, 'dy')) != 0 ";
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, mId);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				Habit h = new Habit();
				h.sethNo(rs.getInt(1));
				h.sethSubcategory(rs.getString(2));
				h.sethStartDate(rs.getDate(3));
				h.sethEndDate(rs.getDate(4));
				h.sethSelectday(rs.getString(5));
				h.sethMoney(rs.getInt(6));
				h.sethTime(rs.getInt(7));
				h.setcCode(rs.getInt(8));
				h.setmId(rs.getString(9));
				
				res.add(h);
			}
			
		} finally {
			jdt.close(rs, pstmt);
		}
		return res;
	}
	
	public Map<String, Object> selectCurrentState(Connection con, String mId) throws SQLException{
		Map<String, Object> res = new HashMap<String, Object>();
		
		List<Habit> hList = new ArrayList<Habit>();
		List<CurrentState> cList = new ArrayList<CurrentState>(); 
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
//		오늘 날짜에 해당하는 습관만 조회
		String sql = "select * " + 
				"FROM tb_current_state cs " + 
				"inner join tb_habit h using (h_no) " + 
				"where " + 
				"h_no in (select h_no " + 
				"from tb_habit " + 
				"where m_id = ? and INSTR(h_selectday, TO_CHAR(sysdate, 'dy')) != 0)";
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, mId);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				Habit h = new Habit();
				CurrentState c = new CurrentState();
				
//				CurrentState 데이터 모델 생성.
				h.sethNo(rs.getInt(1));
				c.setcStateNo(rs.getInt(2));
				c.setcCount(rs.getInt(3));
				c.setcCountall(rs.getInt(4));
				c.setcPercent(rs.getInt(5));
				c.setmId(rs.getString(6));
				c.sethNo(h.gethNo());
				
//				habit 데이터 모델 생성.
				h.sethSubcategory(rs.getString(2));
				h.sethStartDate(rs.getDate(3));
				h.sethEndDate(rs.getDate(4));
				h.sethSelectday(rs.getString(5));
				h.sethMoney(rs.getInt(6));
				h.sethTime(rs.getInt(7));
				h.setcCode(rs.getInt(8));
				h.setmId(rs.getString(9));
				
				hList.add(h);
			}
			
			
			
			
		} finally {
			jdt.close(rs, pstmt);
		}
		return res;
	}
}
