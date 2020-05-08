package up.habit.model.service;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import common.JDBCTemplate;
import up.habit.model.dao.HabitDao;
import up.habit.model.vo.Habit;
import up.member.model.dao.MemberDao;
import up.member.model.vo.Member;

public class HabitService {

	JDBCTemplate jdt = JDBCTemplate.getInstance();
	HabitDao hdao = new HabitDao();

	/**
	  * @Method Name : selectHabitList
	  * @작성일 : 2020. 5. 7.
	  * @작성자 : 정상훈
	  * @변경이력 : 완료
	  * @Method 설명 : 유저의 현재 habit 목록을 가져와준다.
	  * @param m
	  * @return List<Habit>
	  */
	
	public List<Habit> selectHabitList(Member m) {
		List<Habit> hList = new ArrayList<Habit>();

		Connection conn = null;

		conn = jdt.getConnection();

		try {

			hList = hdao.selectHabitList(conn, m);

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			jdt.close(conn);
		}

		return hList;
	}

	/**
	  * @Method Name : deleteHabit
	  * @작성일 : 2020. 5. 7.
	  * @작성자 : 정상훈
	  * @변경이력 : 완료
	  * @Method 설명 : hNo에 해당하는 Habit 정보를 삭제시킨다.
	  * @param hNo
	  * @return int
	  */
	
	public int deleteHabit(int hNo) {
		int res = 0;
		Connection conn = null;

		conn = jdt.getConnection();

		try {

			res = hdao.deleteHabit(conn, hNo);
			if(res >= 1) {
				jdt.commit(conn);
			}else {
				jdt.rollback(conn);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			jdt.rollback(conn);
		} finally {
			jdt.close(conn);
		}
		return res;
	}

	/**
	  * @Method Name : insertNewHabit
	  * @작성일 : 2020. 5. 7.
	  * @작성자 : 정상훈
	  * @변경이력 : 완료
	  * @Method 설명 :Habit 데이터 insert
	  * @param h
	  * @return int
	  */
	
	public Map<String, Object> insertNewHabit( Habit h) {
		
		Map<String, Object> map = new HashMap<>();
		Connection conn = null;

		conn = jdt.getConnection();

		try {
			map = hdao.insertNewHabit(conn, h);
			if((int)map.get("proRes") >= 1) {
				jdt.commit(conn);
			}else {
				jdt.rollback(conn);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			jdt.rollback(conn);
		} finally {
			jdt.close(conn);
		}

		return map;
	}
}
