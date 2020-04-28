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
}
