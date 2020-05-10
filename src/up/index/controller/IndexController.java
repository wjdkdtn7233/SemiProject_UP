package up.index.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;

import org.w3c.dom.html.HTMLDOMImplementation;

import common.frontController.Controller;
import common.frontController.ModelAndView;
import up.habit.model.service.HabitService;
import up.habit.model.vo.Habit;
import up.index.model.service.IndexService;
import up.index.model.vo.HabitState;
import up.member.model.vo.Member;

/**
 * @FileName : IndexController.java
 * @Project : semiproject
 * @Date : 2020. 4. 28.
 * @작성자 : 김성민
 * @변경이력 :
 * @프로그램 설명 : main 페이지 controller
 */
public class IndexController implements Controller {

	/**
	 * @Method Name : index
	 * @작성일 : 2020. 4. 28.
	 * @작성자 : 김성민
	 * @변경이력 : simple 페이지에서 index페이지생성해서 변경
	 * @Method 설명 : index view 페이지로 연결시켜줍니다.
	 * @param request
	 * @return ModelAndView
	 */

	IndexService is = new IndexService();

	public ModelAndView index(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		//request로 넘어온 member 내용 중 m_id 추출
		
		System.out.println(request.getParameter("userId"));
		
		mav.setView("index/index");

		return mav;
	}

	/**
	 * @Method Name : simple
	 * @작성일 : 2020. 5. 7.
	 * @작성자 : 김성민
	 * @변경이력 : 없음
	 * @Method 설명 : simple view 페이지로 연결시켜줍니다.
	 * @param request
	 * @return ModelAndView
	 */
	public ModelAndView simple(HttpServletRequest request) {

		ModelAndView mav = new ModelAndView();
		Member m = (Member) request.getSession().getAttribute("loginInfo");
		
		mav.addObject("habitList", is.selectHabitList(m));
		mav.setView("index/simple");
		return mav;
	}

	/**
	 * @Method Name : detail
	 * @작성일 : 2020. 4. 28.
	 * @작성자 : 김성민
	 * @변경이력 :
	 * @Method 설명 : Detail view 페이지로 연결시켜줍니다.
	 * @param request
	 * @return ModelAndView
	 */
	public ModelAndView detail(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		Member m = (Member) request.getSession().getAttribute("loginInfo");
		mav.addObject("habitList", is.selectHabitList(m));
		mav.setView("index/detail");
		return mav;
	}

	/**
	 * @Method Name : calendar
	 * @작성일 : 2020. 5. 5.
	 * @작성자 : 김성민
	 * @변경이력 : 배상엽 - 데이터 추가
	 * @Method 설명 : Calendar view 페이지로 연결시켜줍니다.
	 * @param request
	 * @return ModelAndView
	 */
	public ModelAndView calendar(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		HabitService hs = new HabitService();
		Member m = (Member) request.getSession().getAttribute("loginInfo");
		
		List<Habit> mList = hs.selectCalHabitList(m);

		if (mList.size() != 0) {
			mav.addObject("calHabitList", mList);
			System.out.println("null아님");
		} else {
			mav.addObject("calHabitList", 0);
			System.out.println("null임");
		}

		mav.setView("index/calendar");

		return mav;
	}

	/**
	  * @Method Name : searchHabit
	  * @작성일 : 2020. 5. 10.
	  * @작성자 : 김성민
	  * @변경이력 : 
	  * @Method 설명 : 
	  * @param request
	  * @return 
	  */
	public ModelAndView searchHabit(HttpServletRequest request) {

		ModelAndView mav = new ModelAndView();
		Member m = (Member) request.getSession().getAttribute("loginInfo");

		System.out.println(request.getParameter("select"));
		System.out.println(request.getParameter("searchContent"));

//		검색 키워드와 검색어 저장
		String select = request.getParameter("select");
		String searchContent = request.getParameter("searchContent");
		mav.addObject("searchList", is.searchHabitList(m, select, searchContent));
		mav.setView("index/simple");

		return mav;
	}

	public ModelAndView searchDeatailHabit(HttpServletRequest request) {

		ModelAndView mav = new ModelAndView();
		Member m = (Member) request.getSession().getAttribute("loginInfo");

		System.out.println(request.getParameter("select"));
		System.out.println(request.getParameter("searchContent"));

//		검색 키워드와 검색어 저장
		String select = request.getParameter("select");
		String searchContent = request.getParameter("searchContent");
		mav.addObject("searchList", is.searchHabitList(m, select, searchContent));
		mav.setView("index/detail");

		return mav;
	}
	
	
	/**
	  * @Method Name : updateHabit
	  * @작성일 : 2020. 5. 10.
	  * @작성자 : 김성민
	  * @변경이력 : 
	  * @Method 설명 : 
	  * @param request
	  * @return 
	  */
	public ModelAndView updateHabit(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		Member m = (Member) request.getSession().getAttribute("loginInfo");
		
		System.out.println(request.getParameter("habitNo"));
		System.out.println(request.getParameter("cStateNo"));
		System.out.println(request.getParameter("habitYN"));
		System.out.println(request.getParameter("habitPercent"));
		System.out.println(request.getParameter("habitMoney"));
		System.out.println(request.getParameter("habitTime"));
		int cPercent =Integer.parseInt((String) request.getParameter("habitPercent"));
		int hMoney = Integer.parseInt((String) request.getParameter("habitMoney"));
		int hTime = Integer.parseInt((String) request.getParameter("habitTime"));
		int hNo = Integer.parseInt((String) request.getParameter("habitNo"));
		int cStateNo = Integer.parseInt((String) request.getParameter("cStateNo"));
		String flag = (String) request.getParameter("habitYN");

//		오늘 습관을 등록하지 않았다면 (습관을 등록할때 최초로 넣어주지만 다음날이되면 다음날 것을 다시넣어줘야함)
//		tb_habit_check 테이블에 등록된 튜플이 없으므로 있는지 확인
		int result = is.checkhabit(m, hNo);
		int result2 = 0;
		
//		만약 결과값이 0이라면 오늘날짜로 된 tb_habit_check가 없으므로 'n'으로 생성해줌
		if ( result == 0) {
			result2 = is.insertTodayCheck(m, hNo);
			if(result2 > 0) {
				System.out.println("tb_habit_check 추가성공");
			}
		}
		
//		만약 체크가 되지 않은 상태라면
		if (flag.equals("n")) {
			result2 = is.addHabitChack(cStateNo);
			if(result2 > 0) {
				mav.addObject("habitList", is.selectHabitList(m));
				mav.setView("index/simple");
			} else {
				mav.addObject("alertMsg", "습관 갱신에 실패하였습니다.");
				mav.addObject("back", "back");
				mav.setView("common/result");
			}
			
		}
		//달성률이 100프로가 되면 종료축하 페이지로 넘겨준다.
		if(cPercent == 100) {
			if(hMoney != 0 ) {
				mav.addObject("mt",hMoney);
				mav.addObject("money", true);
			}else {
				mav.addObject("mt",(hTime*60));
				mav.addObject("time", true);
			}
			
			mav.setView("common/finishPopup");
			return mav;
		}
//		만약 체크를 해제한다면
		else if(flag.equals("y")) {
			result2 = is.removeHabitChack(cStateNo);
			if(result2 > 0) {
				mav.addObject("habitList", is.selectHabitList(m));
				mav.setView("index/simple");
			} else {
				mav.addObject("alertMsg", "습관 갱신에 실패하였습니다.");
				mav.addObject("back", "back");
				mav.setView("common/result");
			}
		}
		
		return mav;
	}

}
