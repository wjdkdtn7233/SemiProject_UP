package up.habit.model.dao;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.jasper.compiler.JDTCompiler;

import common.JDBCTemplate;
import up.habit.model.vo.Habit;
import up.member.model.vo.Member;

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
	
	public int deleteHabit(Connection conn,int hNo,Member m) throws SQLException {
		int res = 0;
		PreparedStatement pstm = null;
		CallableStatement cstm = null;
		String sql = "{call up.}";
		
		try {
			cstm = conn.prepareCall(sql);
			
			
		}finally {
			jdt.close(pstm);
		}
		
		
		
		
		return res;
		
	}
	
}
