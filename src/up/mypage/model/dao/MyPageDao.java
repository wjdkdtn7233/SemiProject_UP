package up.mypage.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.sun.mail.handlers.message_rfc822;

import common.JDBCTemplate;
import up.member.model.vo.Member;
import up.mypage.model.vo.History;
import up.mypage.model.vo.Title;

public class MyPageDao {

	JDBCTemplate jdt = JDBCTemplate.getInstance();

	public List<History> selectHabitHistory(Connection conn,Member m) throws SQLException {

		int count = 1;
		List<History> historyList = new ArrayList<>();

		PreparedStatement pstm = null;

		ResultSet rs = null;

		String sql = " select c_name,h.* from tb_history h " + " inner join tb_category c on (h.c_code=c.c_code) "
				+ " where  m_id=? order by h.his_no";

		try {
			pstm = conn.prepareStatement(sql);
			pstm.setString(1, m.getUserId());
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

	public int updateInfomation(String title, String nick, Connection conn /* ,Member m */) throws SQLException {

		int res = 0;
		PreparedStatement pstm = null;

		String sql = "update tb_member set m_maintitle=?, m_nickname=? where m_id='wjdkdtn'";
		try {
			pstm = conn.prepareStatement(sql);
			pstm.setString(1, title);
			pstm.setString(2, nick);
			res = pstm.executeUpdate();
		} finally {
			jdt.close(pstm);
		}

		return res;
	}

	public List<Title> selectUserTitle(Connection conn,Member m) throws SQLException {
		List<Title> tList = new ArrayList<>();

		PreparedStatement pstm = null;

		ResultSet rs = null;

		String sql = "select mt.t_code, t.t_name, t.t_color from tb_member  m inner join tb_m_title mt on(m.m_id=mt.m_id) inner join tb_title t on(mt.t_code=t.t_code) where m.m_id =?";

		try {
			pstm = conn.prepareStatement(sql);
			pstm.setString(1, m.getUserId());
			rs = pstm.executeQuery();
			while (rs.next()) {
				Title title = new Title();
				title.setTCode(rs.getInt(1));
				title.setTName(rs.getString(2));
				title.setTColor(rs.getString(3));
				

				tList.add(title);
			}

		} finally {
			jdt.close(rs, pstm);
		}

		return tList;
	}

	public int updatePassword(String newPwd, String id, Connection conn) throws SQLException {

		int res = 0;
		PreparedStatement pstm = null;

		String sql = "update tb_member set m_pass=? where m_id=? ";

		try {
			pstm = conn.prepareStatement(sql);
			pstm.setString(1, newPwd);
			pstm.setString(2, id);
			res = pstm.executeUpdate();
		} finally {
			jdt.close(pstm);
		}

		return res;
	}

	public int updateLeaveYN(Connection conn,Member m ) throws SQLException {
		int res = 0;
		PreparedStatement pstm = null;

		String sql = "update tb_member set leave_yn='Y' where m_id=?";

		try {
			pstm = conn.prepareStatement(sql);
			pstm.setString(1, m.getUserId());
			res = pstm.executeUpdate();
		} finally {
			jdt.close(pstm);
		}

		return res;
	}

	public int updateFileName(String ofn,String rfn,Connection conn/*,Member m*/) throws SQLException {
		int res = 0;
		PreparedStatement pstm = null;

		String sql = "update tb_member set ORIGINAL_FILEPATH=? , RENAME_FILEPATH=? where m_id='wjdkdtn'";

		try {
			pstm = conn.prepareStatement(sql);
			pstm.setString(1, ofn);
			pstm.setString(2, rfn);
			res = pstm.executeUpdate();
		} finally {
			jdt.close(pstm);
		}

		return res;
	}
}
