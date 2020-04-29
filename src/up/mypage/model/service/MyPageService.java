package up.mypage.model.service;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import common.JDBCTemplate;
import up.mypage.model.dao.MyPageDao;
import up.mypage.model.vo.History;
import up.mypage.model.vo.Title;

public class MyPageService {

	JDBCTemplate jdt = JDBCTemplate.getInstance();
	MyPageDao mdao = new MyPageDao();

	/**
	  * @Method Name : selectHabitHistory
	  * @작성일 : 2020. 4. 29.
	  * @작성자 : 정상훈
	  * @변경이력 : 완료 
	  * @Method 설명 : 해당 유저의 history 테이블에서 data를 리스트로 받아옴 
	  * @return List<History>
	  */
	
	public List<History> selectHabitHistory(/* Member m */) {

		List<History> historyList = new ArrayList<>();

		Connection conn = null;

		conn = jdt.getConnection();

		try {
			historyList = mdao.selectHabitHistory(conn);

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			jdt.close(conn);
		}

		return historyList;
	}

	/**
	  * @Method Name : selectTitleList
	  * @작성일 : 2020. 4. 29.
	  * @작성자 : 정상훈
	  * @변경이력 : 완료 (더미데이터만 넣으면됨)
	  * @Method 설명 :타이틀 DB에서 리스트를 받아옴
	  * @return List<Title>
	  */
	
	public List<Title> selectTitleList() {

		List<Title> titleList = new ArrayList<>();

		Connection conn = null;

		conn = jdt.getConnection();
		
		try {
			titleList = mdao.selectTitleList(conn);
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			jdt.close(conn);
		}
		

		return titleList;
	}
	
	
	/**
	  * @Method Name : updateInfomation
	  * @작성일 : 2020. 4. 29.
	  * @작성자 : 정상훈
	  * @변경이력 : 
	  * @Method 설명 : 유저가 새로 입력한 닉네임, 이메일 , 타이틀을 update 해줌
	  * @param nick
	  * @param email
	  * @param titleName
	  * @return int
	  */
	
	public int updateInfomation(String nick, String email, String titleName) {
		int res = 0;
		Connection conn = null;
		conn = jdt.getConnection();
		
		jdt.close(conn);
		
		return res;
	}
}
