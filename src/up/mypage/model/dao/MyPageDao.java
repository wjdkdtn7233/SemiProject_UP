package up.mypage.model.dao;

import java.security.interfaces.RSAKey;
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

		String sql = " select * from tb_history"
				+ " where  m_id=? order by his_no";

		try {
			pstm = conn.prepareStatement(sql);
			pstm.setString(1, m.getUserId());
			rs = pstm.executeQuery();
			while (rs.next()) {

				History his = new History();
				his.setHisNo(count++);
				his.setHisSubcategory(rs.getString(2));
				his.setHisStartdate(rs.getDate(3));
				his.setHisEndDate(rs.getDate(4));
				his.setHisPercent(rs.getInt(5));
				his.setcCode(rs.getInt(6));
				his.setMId(rs.getString(7));
				his.setHNo(rs.getInt(8));

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

	public int updateInfomation(String title, String nick, Connection conn ,Member m ) throws SQLException {

		int res = 0;
		int titleCode;
		PreparedStatement pstm = null;

		String sql = "update tb_member set representation_title=?, m_nickname=? where m_id=?";
		try {
			if(title.equals("선택안함")) {
				titleCode=0;
			}else {
				titleCode = selectTitleCode(title,conn,pstm);
			}
			
			pstm = conn.prepareStatement(sql);
			pstm.setInt(1, titleCode);
			pstm.setString(2, nick);
			pstm.setString(3, m.getUserId());
			res = pstm.executeUpdate();
		} finally {
			jdt.close(pstm);
		}

		return res;
	}
	
	private int selectTitleCode(String title,Connection conn,PreparedStatement pstm) throws SQLException {
		
		int res = 0;
		
		ResultSet rs = null;
		
		String sql = "select t_code from tb_title where t_name =? ";
		
		try {
			
		
		pstm = conn.prepareStatement(sql);
		pstm.setString(1, title);
		rs = pstm.executeQuery();
		if(rs.next()) {
			res = rs.getInt(1);
		}
		}finally {
			jdt.close(rs);
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

	public int updateFileName(String ofn,String rfn,String id,Connection conn) throws SQLException {
		int res = 0;
		PreparedStatement pstm = null;

		String sql = "update tb_member set ORIGINAL_FILEPATH=? , RENAME_FILEPATH=? where m_id=?";

		try {
			pstm = conn.prepareStatement(sql);
			pstm.setString(1, ofn);
			pstm.setString(2, rfn);
			pstm.setString(3, id);
			res = pstm.executeUpdate();
		} finally {
			jdt.close(pstm);
		}

		return res;
	}
	
	public Title getTitle(Member m,Connection conn) throws SQLException {
		Title t = new Title();
		PreparedStatement pstm = null;
		ResultSet rs =null;
		
		String sql = "select t.t_code,t.t_name,t.t_color,t.t_comment from tb_member  m inner join tb_title  t on(m.REPRESENTATION_TITLE = t.t_code) where m_id =?" ;
		try {
			pstm = conn.prepareStatement(sql);
			pstm.setString(1, m.getUserId());
			rs = pstm.executeQuery();

			if (rs.next()) {
				t.setTCode(rs.getInt(1));
				t.setTName(rs.getString(2));
				t.setTColor(rs.getString(3));
				t.setTComment(rs.getString(4));
			}
		}finally {
			jdt.close(rs,pstm);
		}
		
		
		return t;
	}
	
}
