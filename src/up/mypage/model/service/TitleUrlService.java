package up.mypage.model.service;



import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import common.JDBCTemplate;
import up.member.model.vo.Member;
import up.mypage.model.dao.MyPageDao;
import up.mypage.model.dao.TitleUrlDao;
import up.mypage.model.vo.History;
import up.mypage.model.vo.Title;

public class TitleUrlService {

	JDBCTemplate jdt = JDBCTemplate.getInstance();
	TitleUrlDao udao = new TitleUrlDao();

	/**
	  * @Method Name : getTitleURL
	  * @작성일 : 2020. 5. 9.
	  * @작성자 : 배상엽
	  * @변경이력 : 
	  * @Method 설명 : 유저가 가지고 있는 타이틀 URL을 가져온다.
	  * @param m
	  * @return
	  */
	public Title getTitleURL(Member m) {
		Title t = new Title();
		
		Connection conn = null;

		conn = jdt.getConnection();
		try {
			t = udao.getTitleURL(m, conn);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			jdt.close(conn);
		}
		
		return t;
	}
}
