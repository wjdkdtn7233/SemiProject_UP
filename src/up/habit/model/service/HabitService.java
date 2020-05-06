package up.habit.model.service;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import common.JDBCTemplate;
import up.habit.model.dao.HabitDao;
import up.habit.model.vo.Habit;
import up.member.model.dao.MemberDao;
import up.member.model.vo.Member;

public class HabitService {
	
	JDBCTemplate jdt = JDBCTemplate.getInstance();
	HabitDao hdao = new HabitDao();
	
	public List<Habit> selectHabitList(Member m) {
		List<Habit> hList = new ArrayList<Habit>();
		
		Connection conn = null;
		
		conn = jdt.getConnection();
		
		try {
			
			hList = hdao.selectHabitList(conn, m);
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			jdt.close(conn);
		}
		
		
		return hList;
	}
	
	public int deleteHabit(int hNo,Member m) {
		int res = 0;
		Connection conn = null;
		
		conn = jdt.getConnection();
		
		try {
			
			hdao.deleteHabit(conn, hNo, m);
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			jdt.close(conn);
		}
		return res;
	}
}
