package up.mypage.model.dao;



import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.sun.mail.handlers.message_rfc822;

import common.JDBCTemplate;
import up.mypage.model.vo.History;
import up.mypage.model.vo.Title;

public class MyPageDao {

	JDBCTemplate jdt = JDBCTemplate.getInstance();

	public List<History> selectHabitHistory(/* Member m */Connection conn) throws SQLException {

		int count = 1;
		List<History> historyList = new ArrayList<>();

		PreparedStatement pstm = null;

		ResultSet rs = null;

		String sql = " select c_name,h.* from tb_history h " + " inner join tb_category c on (h.c_code=c.c_code) "
				+ " where  m_id=? order by h.his_no";

		try {
			pstm = conn.prepareStatement(sql);
			pstm.setString(1, ""/* m.getID */);
			rs = pstm.executeQuery();
			while (rs.next()) {

				History his = new History();
				his.setCName(rs.getString(1));
				his.setHisNo(count++);
				his.setHisSubcategory(rs.getString(3));
				his.setHisStartdate(rs.getDate(4));
				his.setHisEndDate(rs.getDate(5));
				his.setHisPercent(rs.getInt(6));
				his.setMId(rs.getString(8));
				his.setHNo(rs.getInt(9));

				historyList.add(his);
			}

		} finally {
			jdt.close(rs, pstm);
		}

		return historyList;
	}

	public List<Title> selectTitleList(Connection conn) throws SQLException {

		List<Title> titleList = new ArrayList<>();

		PreparedStatement pstm = null;

		ResultSet rs = null;
		
		String sql = "select * from tb_title";

		try {
			pstm = conn.prepareStatement(sql);
			rs = pstm.executeQuery();
			while (rs.next()) {
				Title title = new Title();
				title.setTCode(rs.getInt(1));
				title.setTName(rs.getString(2));
				title.setTComment(rs.getString(3));
				title.setTCondition(rs.getString(4));
				title.setTColor(rs.getString(5));
				
				titleList.add(title);
			}

		} finally {
			jdt.close(rs, pstm);
		}
		
		return titleList;
	}
	
	public int updateInfomation(Connection conn /*,Member m*/) throws SQLException{
		
		int res = 0;
		PreparedStatement pstm = null;
		
		String sql = "update tb_member set ";
		try {
			pstm = conn.prepareStatement(sql);
		}finally {
			jdt.close(pstm);
		}
		
		
		return res;
	}
}
