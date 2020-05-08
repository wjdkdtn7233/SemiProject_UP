package up.habit.model.dao;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.jasper.compiler.JDTCompiler;

import common.JDBCTemplate;
import common.frontController.Controller;
import up.habit.model.vo.Habit;
import up.member.model.vo.Member;
import up.mypage.model.vo.Title;

public class HabitDao {

	JDBCTemplate jdt = JDBCTemplate.getInstance();
	
	public List<Habit> selectHabitList(Connection conn,Member m) throws SQLException {
		List<Habit> hList = new ArrayList<Habit>();
		
		PreparedStatement pstm = null;
		ResultSet rs = null;
		
		try {
			String sql = "select * from tb_habit where m_id=?";
			pstm = conn.prepareStatement(sql);
			pstm.setString(1, m.getUserId());
			rs = pstm.executeQuery();
			
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
				
				hList.add(h);
			}
		}finally {
			jdt.close(rs,pstm);
		}
		
		
		
		return hList;
	}
	
	public int deleteHabit(Connection conn,int hNo) throws SQLException {
		int res = 0;
		
		CallableStatement cstm = null;
		String sql = "{call P_DELETE_HABIT(?)}";
		
		try {
			cstm = conn.prepareCall(sql);
			cstm.setInt(1, hNo);
			res = cstm.executeUpdate();
		}finally {
			jdt.close(cstm);
		}
		
		
		
		
		return res;
		
	}
	
	public Map<String, Object> insertNewHabit(Connection conn,Habit h)throws SQLException {
		Map<String, Object> map = new HashMap<>();
		int res = 0;
		int count = 0;
		int codeCount = 0;
		CallableStatement cstm = null;
		
		String sql = "{call P_INSERT_HABIT(S_H_NO.nextval,?,?,?,?,?,?,?,?)}";
		
		try {
			cstm = conn.prepareCall(sql);
			cstm.setString(1, h.gethSubcategory());
			cstm.setDate(2, h.gethStartDate());
			cstm.setDate(3, h.gethEndDate());
			cstm.setString(4, h.gethSelectday());
			cstm.setInt(5, h.gethMoney());
			cstm.setInt(6, h.gethTime());
			cstm.setInt(7, h.getcCode());
			cstm.setString(8, h.getmId());
			res = cstm.executeUpdate();
			map.put("proRes", res);
			//유저가 가진 습관의 갯수
			count = userHabitCount(conn, h.getmId());
			if(count == 1 && checkUserTitle(conn, h.getmId(), 1) == 0/*습관을 등록했다가 삭제되거나 히스토리 넘어갔을경우 카운트가 다시 1이 될수 있으므로*/) {
				//첫 습관등록이라면 타이틀 인서트
				insertUserTitle(conn, h.getmId(), 1);
				//획득한 타이틀 객체를 보내줌
				map.put("getTitle", selectGetTitle(conn,1));
			}else if(count == 3 && checkUserTitle(conn, h.getmId(), 3) == 0) {
				insertUserTitle(conn, h.getmId(), 3);
				map.put("getTitle", selectGetTitle(conn,3));
			}
			codeCount = userHabitCategoryCount(conn, h.getmId(), h.getcCode());
			if(codeCount == 1) {
				
				if(h.getcCode() == 1 && checkUserTitle(conn, h.getmId(), 13) == 0) {
					//첫 금주 습관등록일 경우 
					//습득한 타이틀 인서트
					insertUserTitle(conn, h.getmId(), 13);
					//획득한 타이틀 객체를 보내줌
					map.put("getTitle", selectGetTitle(conn,13));
				}else if(h.getcCode() == 2 && checkUserTitle(conn, h.getmId(), 21) == 0) {
					insertUserTitle(conn, h.getmId(), 21);
					map.put("getTitle", selectGetTitle(conn,21));
				}else if(h.getcCode() == 3 && checkUserTitle(conn, h.getmId(), 17) == 0) {
					insertUserTitle(conn, h.getmId(), 17);
					map.put("getTitle", selectGetTitle(conn,17));
				}else if(h.getcCode() == 4 && checkUserTitle(conn, h.getmId(), 9) == 0){
					insertUserTitle(conn, h.getmId(), 9);
					map.put("getTitle", selectGetTitle(conn,9));
				}
			}
			
		}finally {
			jdt.close(cstm);
		}
		
		
		return map;
		
	}
	
	/**
	  * @Method Name : userHabitCount
	  * @작성일 : 2020. 5. 8.
	  * @작성자 : 정상훈
	  * @변경이력 : 완료
	  * @Method 설명 :유저가 등록한 습관의 갯수
	  * @param conn
	  * @param id
	  * @return int
	  * @throws SQLException
	  */
	
	private int userHabitCount(Connection conn,String id) throws SQLException {
		int res = 0;
		PreparedStatement pstm = null;
		ResultSet rs = null;		
		
		String sql = "select count(*) from tb_habit where m_id = ? ";	
		try {
			pstm = conn.prepareStatement(sql);
			pstm.setString(1, id);
			
			rs = pstm.executeQuery();
			
			if(rs.next()) {
				res = rs.getInt(1);
			}
			
		}finally {
			jdt.close(rs,pstm);
		}
		return res;
	}
	
	/**
	  * @Method Name : userHabitCategoryCount
	  * @작성일 : 2020. 5. 8.
	  * @작성자 : 정상훈
	  * @변경이력 : 완료
	  * @Method 설명 :유저가 등록한 습관의 카테고리를 가진 습관의 갯수
	  * @param conn
	  * @param id
	  * @param c_code
	  * @return int
	  * @throws SQLException
	  */
	
	private int userHabitCategoryCount(Connection conn,String id,int c_code) throws SQLException {
		int res = 0;
		PreparedStatement pstm = null;
		ResultSet rs = null;		
		
		String sql = "select count(*) from tb_habit where m_id = ? and c_code=?";	
		try {
			pstm = conn.prepareStatement(sql);
			pstm.setString(1, id);
			pstm.setInt(2, c_code);
			rs = pstm.executeQuery();
			
			if(rs.next()) {
				res = rs.getInt(1);
			}
			
		}finally {
			jdt.close(rs,pstm);
		}
		return res;
	}
	
	/**
	  * @Method Name : insertUserTitle
	  * @작성일 : 2020. 5. 8.
	  * @작성자 : 정상훈
	  * @변경이력 : 완료	
	  * @Method 설명 :유저가 획득한 타이틀을 DB에 insert
	  * @param conn
	  * @param id
	  * @param code
	  * @return int
	  * @throws SQLException
	  */
	
	private int insertUserTitle(Connection conn,String id,int code) throws SQLException {
		int res = 0;
		PreparedStatement pstm = null;
				
		
		String sql = "insert into tb_m_title values(?,?) ";	
		try {
			pstm = conn.prepareStatement(sql);
			pstm.setString(1, id);
			pstm.setInt(2, code);
			res = pstm.executeUpdate();
			
			
			
		}finally {
			jdt.close(pstm);
		}
		return res;
	}
	
	/**
	  * @Method Name : selectGetTitle
	  * @작성일 : 2020. 5. 8.
	  * @작성자 : 정상훈
	  * @변경이력 : 완료
	  * @Method 설명 : 유저가 획득한 타이틀 객체를 가져온다
	  * @param conn
	  * @param code
	  * @return Title
	  * @throws SQLException
	  */
	
	private Title selectGetTitle(Connection conn,int code) throws SQLException {
		Title t = new Title();
		PreparedStatement pstm = null;
		ResultSet rs = null;		
		
		String sql = "select T_NAME,T_COMMENT,T_CONDITION,T_COLOR from tb_title where t_code=?";	
		try {
			pstm = conn.prepareStatement(sql);
			pstm.setInt(1, code);
			
			rs = pstm.executeQuery();
			
			if(rs.next()) {
				t.setTName(rs.getString(1));
				t.setTComment(rs.getString(2));
				t.setTCondition(rs.getString(3));
				t.setTColor(rs.getString(4));
			}
		
		}finally {
			jdt.close(rs,pstm);
		}
		
		return t;
		
	}
	private int checkUserTitle(Connection conn,String id,int code) throws SQLException {
		int res = 0;
		PreparedStatement pstm = null;
		ResultSet rs = null;		
		
		String sql = "select count(*) from tb_m_title where m_id=? and t_code=?";	
		try {
			pstm = conn.prepareStatement(sql);
			pstm.setString(1, id);
			pstm.setInt(2,code);
			rs = pstm.executeQuery();
			if(rs.next()) {
				res = rs.getInt(1);
			}
			
		
		}finally {
			jdt.close(rs,pstm);
		}
	
		
		return res;
	}
	
}
