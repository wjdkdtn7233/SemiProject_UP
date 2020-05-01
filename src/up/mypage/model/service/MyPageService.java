package up.mypage.model.service;



import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import common.JDBCTemplate;
import up.member.model.vo.Member;
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
	
	public List<History> selectHabitHistory(Member m) {

		List<History> historyList = new ArrayList<>();

		Connection conn = null;

		conn = jdt.getConnection();

		try {
			historyList = mdao.selectHabitHistory(conn,m);

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
	
	public int updateInfomation(String title,String nick) {
		int res = 0;
		Connection conn = null;
		conn = jdt.getConnection();
		try {
			res = mdao.updateInfomation(title, nick, conn);
			if(res >= 1) {
				jdt.commit(conn);
			}
		} catch (SQLException e) {
			e.printStackTrace();
			jdt.rollback(conn);
		}finally {
			jdt.close(conn);
		}
		
		
		return res;
	}
	
	
	/**
	  * @Method Name : selectUserTitle
	  * @작성일 : 2020. 5. 1.
	  * @작성자 : 정상훈
	  * @변경이력 : session 로그인 정보 멤버객체를 보내줘 쿼리 수정하면 된다.
	  * @Method 설명 : 유저가 현재 가지고 있는 타이틀 목록을 꺼내와준다.
	  * @return List<Title>
	  */
	
	public List<Title> selectUserTitle(Member m){
		List<Title> tList = new ArrayList<>();
		Connection conn = null;
		conn = jdt.getConnection();
		try {
			tList = mdao.selectUserTitle(conn,m);
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			jdt.close(conn);
			
		}
		
		return tList;
	}
	
	
	/**
	  * @Method Name : updatePassword
	  * @작성일 : 2020. 5. 1.
	  * @작성자 : 정상훈
	  * @변경이력 : 완성
	  * @Method 설명 : 새로운 비밀번호로  update 시켜주는 메소드
	  * @param newPwd
	  * @param id
	  * @return int
	  */
	
	public int updatePassword(String newPwd,String id) {
		int res = 0;
		Connection conn = null;
		conn = jdt.getConnection();
		try {
			res = mdao.updatePassword(newPwd,id,conn);
			if(res >= 1) {
				jdt.commit(conn);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
			jdt.rollback(conn);
		}finally {
			jdt.close(conn);
		}
		
		
		return res;
	}
	
	
	/**
	  * @Method Name : updateLeaveYN
	  * @작성일 : 2020. 5. 1.
	  * @작성자 : 정상훈
	  * @변경이력 : 
	  * @Method 설명 : leave_yn 값을 y로 변경
	  * @return
	  */
	
	public int updateLeaveYN(Member m) {
		int res = 0;
		Connection conn = null;
		conn = jdt.getConnection();
		try {
			res = mdao.updateLeaveYN(conn,m);
			if(res >= 1) {
				jdt.commit(conn);
			}
		} catch (SQLException e) {
			e.printStackTrace();
			jdt.rollback(conn);
		}finally {
			jdt.close(conn);
		}
		
		
		return res;
	}
	
	/**
	  * @Method Name : updateFileName
	  * @작성일 : 2020. 5. 1.
	  * @작성자 : 정상훈
	  * @변경이력 : 
	  * @Method 설명 : 프로필 사진 origin 파일이름 , rename 파일이름 DB에 저장 
	  * @return int
	  */
	
	public int updateFileName(/*Member m*/String ofn,String rfn) {
		int res = 0;
		
		Connection conn = null;
		conn = jdt.getConnection();
		try {
			res = mdao.updateFileName(ofn, rfn, conn);
			if(res >= 1) {
				jdt.commit(conn);
			}
		} catch (SQLException e) {
			e.printStackTrace();
			jdt.rollback(conn);
		}finally {
			jdt.close(conn);
		}
		
		return res;
	}
	
	
	public Title getTitle(Member m) {
		Title t = new Title();
		
		Connection conn = null;

		conn = jdt.getConnection();
		try {
			t = mdao.getTitle(m, conn);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			jdt.close(conn);
		}
		
		return t;
	}
}
