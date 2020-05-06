package up.member.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import common.JDBCTemplate;
import up.member.model.vo.Member;

public class MemberDao {

	JDBCTemplate jdt = JDBCTemplate.getInstance();

	/**
	 * @throws SQLException
	 * @MethodName: loginImple
	 * @ClassName: MemberDao.java
	 * @변경이력: statement > preparedstatement // DB에 맞춰 setemail, setnickname 순서 변경
	 * @Comment: login 시, DB에서 전달받은 입력값과 동일한 내용이 있는지 확인하는 기능
	 * @작성자: 박혜연
	 * @작성일: 2020. 4. 30.
	 */
	public Member loginImple(Connection con, String userId, String userPwd) throws SQLException {
		Member result = null;
		PreparedStatement pstm = null;
		ResultSet rs = null;

		String sql = "select * from tb_member where m_id = ? and m_pass = ?";

		try {
			pstm = con.prepareStatement(sql);
			pstm.setString(1, userId);
			pstm.setString(2, userPwd);
			rs = pstm.executeQuery();

			while (rs.next()) {
				result = new Member();
				result.setUserId(rs.getString(1));
				result.setUserPwd(rs.getString(2));
				result.setUserName(rs.getString(3));
				result.setUserEmail(rs.getString(4));
				result.setUserNickName(rs.getString(5));
				result.setUserTitleCode(rs.getInt(6));
				result.setUserLoginCnt(rs.getInt(7));
				result.setUserJoinDate(rs.getDate(8));
				result.setUserLeaveYN(rs.getString(9));
				result.setOriginFile(rs.getString(10));
				result.setRenameFile(rs.getString(11));

			}
		} finally {
			jdt.close(rs);
			jdt.close(pstm);
		}

		return result;

	}
	
	/**
	 *	@MethodName: kakaoImple
	 *	@ClassName: MemberDao.java
	 *	@변경이력: 
	 *	@Comment: 카카오 로그인 용
	 *	@작성자: 박혜연
	 *	@작성일: 2020. 5. 6.
	*/
	public Member kakaoImple(Connection con, String userId) throws SQLException {
		Member result = null;
		PreparedStatement pstm = null;
		ResultSet rs = null;

		String sql = "select * from tb_member where m_id = ?";

		try {
			pstm = con.prepareStatement(sql);
			pstm.setString(1, userId);
			rs = pstm.executeQuery();

			while (rs.next()) {
				result = new Member();
				result.setUserId(rs.getString(1));
				result.setUserPwd(rs.getString(2));
				result.setUserName(rs.getString(3));
				result.setUserEmail(rs.getString(4));
				result.setUserNickName(rs.getString(5));
				result.setUserTitleCode(rs.getInt(6));
				result.setUserLoginCnt(rs.getInt(7));
				result.setUserJoinDate(rs.getDate(8));
				result.setUserLeaveYN(rs.getString(9));
				result.setOriginFile(rs.getString(10));
				result.setRenameFile(rs.getString(11));

			}
		} finally {
			jdt.close(rs);
			jdt.close(pstm);
		}

		return result;

	}

	/**
	 * @throws SQLException
	 * @MethodName: insertMember
	 * @ClassName: MemberDao.java
	 * @변경이력: 완료
	 * @Comment: 회원 등록 기능
	 * @작성자: 박혜연
	 * @작성일: 2020. 4. 30.
	 */
	public int insertMember(Connection con, Member m) throws SQLException {
		int result = 0;
		PreparedStatement pstm = null;

		String sql = "insert into tb_member values(?,?,?,?,?,0,0,sysdate,'N','unnamed.jpg','unnamed.jpg')";

		try {
			pstm = con.prepareStatement(sql);
			pstm.setString(1, m.getUserId());
			pstm.setString(2, m.getUserPwd());
			pstm.setString(3, m.getUserName());
			pstm.setString(4, m.getUserEmail());
			pstm.setString(5, m.getUserNickName());

			result = pstm.executeUpdate();

		} finally {
			jdt.close(pstm);
		}

		return result;
	}

	/**
	 * @MethodName: idCheck
	 * @ClassName: MemberDao.java
	 * @변경이력: 완료
	 * @Comment: 회원가입 시, id 중복 체크 기능
	 * @작성자: 박혜연
	 * @작성일: 2020. 4. 30.
	 */
	public String idCheck(Connection con, String userId) throws SQLException {
		String result = "";

		Statement stmt = null;
		ResultSet rs = null;

		String sql = "select m_id from tb_member where m_id = '" + userId + "'";

		try {
			stmt = con.createStatement();
			rs = stmt.executeQuery(sql);
			while (rs.next()) {
				result = rs.getString(1);
			}
		} finally {
			jdt.close(rs);
			jdt.close(stmt);
		}

		return result;
	}

	/**
	 * @throws SQLException
	 * @MethodName: findId
	 * @ClassName: MemberDao.java
	 * @변경이력: 완료
	 * @Comment: id 찾기
	 * @작성자: 박혜연
	 * @작성일: 2020. 5. 1.
	 */
	public Member findId(Connection con, String userEmail) throws SQLException {
		Member result = null;

		PreparedStatement pstm = null;
		ResultSet rs = null;

		String sql = "select m_id, m_pass, m_name, m_email, m_nickname from tb_member where m_email = ?";

		try {
			pstm = con.prepareStatement(sql);
			pstm.setString(1, userEmail);

			rs = pstm.executeQuery();

			while (rs.next()) {
				result = new Member();
				result.setUserId(rs.getString(1));
				result.setUserPwd(rs.getString(2));
				result.setUserName(rs.getString(3));
				result.setUserEmail(rs.getString(4));
				result.setUserNickName(rs.getString(5));
			}

		} finally {
			jdt.close(rs);
			jdt.close(pstm);
		}
		return result;
	}

	/**
	 * @MethodName: findPwd
	 * @ClassName: MemberDao.java
	 * @변경이력: 완료
	 * @Comment: 입력받은 id, email 가진 회원 DB 전달
	 * @작성자: 박혜연
	 * @작성일: 2020. 5. 2.
	 */
	public Member findPwd(Connection con, String userId, String userEmail) throws SQLException {
		Member result = null;

		char[] random = new char[] { 'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p',
				'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z', 'A', 'B', 'C', 'D', 'F', 'G', 'H', 'I', 'J', 'K', 'L',
				'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'V', 'W', 'X', 'Y', 'Z', '1', '2', '3', '4', '5', '6', '7', '8',
				'9', '0', '~', '!', '@', '#', '$', '%', '^', '&', '*', '(', ')', '_', '=', '+' };

		String newPwd = "";
		int ranNum = 0;

		for (int i = 0; i < 9; i++) {
			ranNum = (int) (Math.random() * random.length);
			newPwd += random[ranNum];
		}

		PreparedStatement pstm = null;
		ResultSet rs = null;

		String sql = "select m_id, m_pass, m_name, m_email, m_nickname from tb_member where m_id = ? and m_email = ?";

		int res = changePwd(con, userEmail, newPwd);

		try {

			if (res >= 1) {
				pstm = con.prepareStatement(sql);
				pstm.setString(1, userId);
				pstm.setString(2, userEmail);

				rs = pstm.executeQuery();

				while (rs.next()) {
					result = new Member();
					result.setUserId(rs.getString(1));
					result.setUserPwd(rs.getString(2));
					result.setUserName(rs.getString(3));
					result.setUserEmail(rs.getString(4));
					result.setUserNickName(rs.getString(5));
				}
			}

		} finally {
			jdt.close(rs);
			jdt.close(pstm);
		}

		return result;
	}

	/**
	 * @MethodName: changePwd
	 * @ClassName: MemberDao.java
	 * @변경이력: 완료
	 * @Comment: 임시 비밀번호 저장
	 * @작성자: 박혜연
	 * @작성일: 2020. 5. 3.
	 */
	public int changePwd(Connection con, String userEmail, String newPwd) throws SQLException {
		int result = 0;

		PreparedStatement pstm = null;

		String sql = "update tb_member set m_pass = ? where m_email = ?";
		try {
			pstm = con.prepareStatement(sql);
			pstm.setString(1, newPwd);
			pstm.setString(2, userEmail);

			result = pstm.executeUpdate();
		} finally {
			jdt.close(pstm);
		}

		return result;
	}

	/**
	 *	@MethodName: wise
	 *	@ClassName: MemberDao.java
	 *	@변경이력: 
	 *	@Comment: DB 내 명언 글귀 담기
	 *	@작성자: 박혜연
	 *	@작성일: 2020. 5. 4.
	*/
	public List<String> wise(Connection con) throws SQLException {
		List<String> result = new ArrayList<>();

		Statement stmt = null;
		ResultSet rs = null;
		String sql = "select w_text from tb_wise";

		try {
			stmt = con.createStatement();
			rs = stmt.executeQuery(sql);
			
			while(rs.next()) {
				result.add(rs.getString(1));
			}
		} finally {
			jdt.close(rs, stmt);
		}

		return result;
	}

}
