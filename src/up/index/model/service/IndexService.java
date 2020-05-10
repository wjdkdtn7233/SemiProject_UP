package up.index.model.service;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import common.JDBCTemplate;
import up.habit.model.vo.Habit;
import up.index.model.dao.IndexDao;
import up.index.model.vo.HabitState;
import up.member.model.vo.Member;

/**
 * @FileName : IndexService.java
 * @Project : semiproject
 * @Date : 2020. 5. 7.
 * @작성자 : 김성민
 * @변경이력 :
 * @프로그램 설명 : 메인페이지 service
 */
public class IndexService {

	JDBCTemplate jdt = JDBCTemplate.getInstance();
	IndexDao id = new IndexDao();

	/**
	 * @Method Name : selectHabitList
	 * @작성일 : 2020. 5. 7.
	 * @작성자 : 김성민
	 * @변경이력 : 없음
	 * @Method 설명 : 습관 정보를 List형식으로 불러온다.
	 * @return List<HabitState>
	 */
	public List<HabitState> selectHabitList(Member m) {
		List<HabitState> res = new ArrayList<>();

		Connection conn = null;

		conn = jdt.getConnection();

		try {
			res = id.selectHabitList(conn, m);

//			jdt.commit(conn);
		} catch (SQLException e) {
//			jdt.rollback(conn);
		} finally {
			jdt.close(conn);
		}

		return res;
	}

	/**
	 * @Method Name : searchHabitList
	 * @작성일 : 2020. 5. 9.
	 * @작성자 : 김성민
	 * @변경이력 : 없음
	 * @Method 설명 : 검색한 습관 정보를 List형식으로 불러온다.
	 * @param m
	 * @return List<HabitState>
	 */
	public List<HabitState> searchHabitList(Member m, String select, String searchContent) {
		List<HabitState> res = new ArrayList<>();

		Connection conn = null;

		conn = jdt.getConnection();

		try {
			res = id.searchHabitList(conn, m, select, searchContent);

//			jdt.commit(conn);
		} catch (SQLException e) {
//			jdt.rollback(conn);
		} finally {
			jdt.close(conn);
		}

		return res;
	}

	/**
	  * @Method Name : checkhabit
	  * @작성일 : 2020. 5. 10.
	  * @작성자 : 김성민
	  * @변경이력 : 
	  * @Method 설명 : 생성된 habit check가 있는지 확인하는 service
	  * @param m
	  * @param hNo
	  * @return int
	  */
	public int checkhabit(Member m, List<HabitState> hList) {
		int res = 0;

		Connection conn = null;

		conn = jdt.getConnection();

		try {
			for(int i = 0; i < hList.size(); i++) {
				res = id.checkhabit(conn, m, hList.get(i).gethNo());
			}

			jdt.commit(conn);
		} catch (SQLException e) {
			jdt.rollback(conn);
		} finally {
			jdt.close(conn);
		}

		return res;
	}
	
	/**
	  * @Method Name : addHabitChack
	  * @작성일 : 2020. 5. 10.
	  * @작성자 : 김성민
	  * @변경이력 : 
	  * @Method 설명 : 사용자가 오늘 습관 버튼을 눌렀을경우 갱신시켜주는 service
	  * @param cCode
	  * @return 
	  */
	public int addHabitChack(int cCode) {
		int res = 0;

		Connection conn = null;

		conn = jdt.getConnection();

		try {
			res = id.addHabitChack(conn, cCode);

			jdt.commit(conn);
		} catch (SQLException e) {
			jdt.rollback(conn);
		} finally {
			jdt.close(conn);
		}

		return res;
		
	}
	
	/**
	  * @Method Name : removeHabitChack
	  * @작성일 : 2020. 5. 10.
	  * @작성자 : 김성민
	  * @변경이력 : 
	  * @Method 설명 : 사용자가 오늘 습관 갱신 버튼을 다시 취소했을경우 취소시켜주는 service
	  * @param cCode
	  * @return int
	  */
	public int removeHabitChack(int cCode) {
		int res = 0;

		Connection conn = null;

		conn = jdt.getConnection();

		try {
			res = id.removeHabitChack(conn, cCode);

			jdt.commit(conn);
		} catch (SQLException e) {
			jdt.rollback(conn);
		} finally {
			jdt.close(conn);
		}

		return res;
		
	}

	/**
	  * @Method Name : insertTodayCheck
	  * @작성일 : 2020. 5. 10.
	  * @작성자 : 김성민
	  * @변경이력 : 
	  * @Method 설명 : tb_habit_check에 오늘의 습관체크 튜플이 없을 경우생성해줌
	  * @param m
	  * @param hNo
	  * @return 
	  */
	public int insertTodayCheck(Member m, int hNo) {
		int res = 0;

		Connection conn = null;

		conn = jdt.getConnection();

		try {
			res = id.insertTodayCheck(conn, m, hNo);

			jdt.commit(conn);
		} catch (SQLException e) {
			jdt.rollback(conn);
		} finally {
			jdt.close(conn);
		}

		return res;
		
	}
	public List<HabitState> getTodayHabit(Member m) {
		List<HabitState> hsList = new ArrayList<HabitState>();

		Connection conn = null;

		conn = jdt.getConnection();

		try {
			hsList = id.getTodayHabit(conn, m);

//			jdt.commit(conn);
		} catch (SQLException e) {
//			jdt.rollback(conn);
		} finally {
			jdt.close(conn);
		}

		return hsList;
		
	}
}
