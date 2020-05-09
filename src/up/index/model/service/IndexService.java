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
	  * @Method 설명 : 습관 정보를 Map형식으로 불러온다.
	  * @return Map<String, Object>
	  */
	public List<HabitState> selectHabitList(Member m){
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
}
