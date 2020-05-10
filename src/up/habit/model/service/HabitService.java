package up.habit.model.service;

import java.sql.Connection;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import common.JDBCTemplate;
import up.habit.model.dao.HabitDao;
import up.habit.model.vo.Habit;
import up.member.model.dao.MemberDao;
import up.member.model.vo.Member;

/**
  * @FileName : HabitService.java
  * @Project : RealSemi
  * @Date : 2020. 5. 10. 
  * @작성자 : 배상엽
  * @변경이력 :
  * @프로그램 설명 :
  */
public class HabitService {

	JDBCTemplate jdt = JDBCTemplate.getInstance();
	HabitDao hdao = new HabitDao();

	/**
	 * @Method Name : selectHabitList
	 * @작성일 : 2020. 5. 7.
	 * @작성자 : 정상훈
	 * @변경이력 : 완료
	 * @Method 설명 : 유저의 현재 habit 목록을 가져와준다.
	 * @param m
	 * @return List<Habit>
	 */

	public List<Habit> selectHabitList(Member m) {
		List<Habit> hList = new ArrayList<Habit>();

		Connection conn = null;

		conn = jdt.getConnection();

		try {

			hList = hdao.selectHabitList(conn, m);

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			jdt.close(conn);
		}

		return hList;
	}

	/**
	 * @Method Name : deleteHabit
	 * @작성일 : 2020. 5. 7.
	 * @작성자 : 정상훈
	 * @변경이력 : 완료
	 * @Method 설명 : hNo에 해당하는 Habit 정보를 삭제시킨다.
	 * @param hNo
	 * @return int
	 */

	public int deleteHabit(int hNo) {
		int res = 0;
		Connection conn = null;

		conn = jdt.getConnection();

		try {

			res = hdao.deleteHabit(conn, hNo);
			if (res >= 1) {
				jdt.commit(conn);
			} else {
				jdt.rollback(conn);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			jdt.rollback(conn);
		} finally {
			jdt.close(conn);
		}
		return res;
	}

	/**
	 * @Method Name : insertNewHabit
	 * @작성일 : 2020. 5. 7.
	 * @작성자 : 정상훈
	 * @변경이력 : 완료
	 * @Method 설명 :Habit 데이터 insert
	 * @param h
	 * @return int
	 */

	public Map<String, Object> insertNewHabit(Habit h) {

		Map<String, Object> map = new HashMap<>();
		Connection conn = null;

		conn = jdt.getConnection();

		try {
			map = hdao.insertNewHabit(conn, h);
			if ((int) map.get("proRes") >= 1) {
				jdt.commit(conn);
			} else {
				jdt.rollback(conn);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			jdt.rollback(conn);
		} finally {
			jdt.close(conn);
		}

		return map;
	}

	/**
	 * 
	 * @Method Name : selectCalHabitList
	 * @작성일 : 2020. 5. 10.
	 * @작성자 : 배상엽
	 * @변경이력 :
	 * @Method 설명 :calendar 데이터 출력을 위한 method
	 * @param m
	 * @return
	 */
	public List<Habit> selectCalHabitList(Member m) {
		List<Habit> hList = new ArrayList<Habit>();

		Connection conn = null;

		conn = jdt.getConnection();

		try {

			hList = hdao.selectHabitList(conn, m);

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			jdt.close(conn);
		}

		return calData(hList);
	}
	
	public List<Habit> calData(List<Habit> hList) {
		List<Habit> calHList = new ArrayList<>();
		
		
		for (int i = 0; i < hList.size(); i++) {
			
			String startDay = hList.get(i).gethStartDate().toString().replaceAll("-", "");
			int startYear = Integer.parseInt(startDay.substring(0,4));
	        int startMonth= Integer.parseInt(startDay.substring(4,6));
	        int startDate = Integer.parseInt(startDay.substring(6,8));

			Calendar cal = Calendar.getInstance();

			cal.set(startYear, startMonth - 1, startDate);

			// 지정요일 한글자씩 저장
			String[] arr_week = hList.get(i).gethSelectday().split("");
			// 요일을 숫자 형식으로 저장할 배열 생성
			int[] arrInt_week = new int[arr_week.length];

			// 캘린더 계산을 위해 한글을 숫자로
			// 1 : 일, 2: 월, 3: 화, 4: 수, 5: 목, 6: 금, 7: 토
			for (int j = 0; j < arr_week.length; j++) {
				switch (arr_week[j]) {
				case "일":
					arrInt_week[j] = 1;
					break;
				case "월":
					arrInt_week[j] = 2;
					break;
				case "화":
					arrInt_week[j] = 3;
					break;
				case "수":
					arrInt_week[j] = 4;
					break;
				case "목":
					arrInt_week[j] = 5;
					break;
				case "금":
					arrInt_week[j] = 6;
					break;
				case "토":
					arrInt_week[j] = 7;
					break;
				}
			}

			while (true) {
				// 날짜의 요일 변환
				int dayOfWeek = cal.get(Calendar.DAY_OF_WEEK);

				for (int j = 0; j < arrInt_week.length; j++) {
					int weekNum = arrInt_week[j];
					// 요일 포함이면 출력
					if (cal.get(Calendar.DAY_OF_WEEK) == weekNum) {
						Habit h = new Habit();
						
						h.sethNo(hList.get(i).gethNo());
						h.sethSubcategory(hList.get(i).gethSubcategory());
						
						h.sethStartDate( new java.sql.Date(cal.getTimeInMillis()) );
						h.sethEndDate( new java.sql.Date(cal.getTimeInMillis()));
						
						calHList.add(h);
					}

				}
				
				// startDt에서 하루씩 증가
				cal.add(Calendar.DATE, 1);

				String endDay = hList.get(i).gethEndDate().toString().replaceAll("-", "");
		        
				// 현재 날짜가 종료일자보다 크면 종료
				if (getDateByInteger(cal.getTime()) > Integer.parseInt(endDay)) {
					break;
				}
			}

		}
		
		return calHList;
	}

	public int getDateByInteger(Date date) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
		return Integer.parseInt(sdf.format(date));
	}

	public String getDateByString(Date date) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		return sdf.format(date);
	}
}
