package up.mypage.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import common.JDBCTemplate;
import up.member.model.vo.Member;
import up.mypage.model.vo.Title;

public class TitleUrlDao {

	JDBCTemplate jdt = JDBCTemplate.getInstance();

	public Title getTitleURL(Member m,Connection conn) throws SQLException {
		Title t = new Title();
		PreparedStatement pstm = null;
		ResultSet rs =null;
		
		String sql = "select t.t_URL from tb_member  m inner join tb_title  t on(m.REPRESENTATION_TITLE = t.t_code) where m_id =?" ;
		try {
			pstm = conn.prepareStatement(sql);
			pstm.setString(1, m.getUserId());
			rs = pstm.executeQuery();

			if (rs.next()) {
				t.setTURL(rs.getString(1));
			}
		}finally {
			jdt.close(rs,pstm);
		}
		
		
		return t;
	}
	
}
