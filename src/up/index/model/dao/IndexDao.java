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
				"where " + 
				"h_no in (select h_no " + 
				"from tb_habit " + 
				"where m_id = ? and INSTR(h_selectday, TO_CHAR(sysdate, 'dy')) != 0)";
		
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
				hs.setmId(rs.getString(14));
				
				hsList.add(hs);
			}
		} finally {
			jdt.close(rs, pstmt);
		}
		return hsList;
	}
}
