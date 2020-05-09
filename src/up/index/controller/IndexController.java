package up.index.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;

import common.frontController.Controller;
import common.frontController.ModelAndView;
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

		mav.setView("index/detail");
		return mav;
	}

	/**
	 * @Method Name : calendar
	 * @작성일 : 2020. 5. 5.
	 * @작성자 : 김성민
	 * @변경이력 :
	 * @Method 설명 : Calendar view 페이지로 연결시켜줍니다.
	 * @param request
	 * @return ModelAndView
	 */
	public ModelAndView calendar(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();

		mav.setView("index/calendar");

		return mav;
	}
	
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
	
	public ModelAndView updateHabit(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		Member m = (Member) request.getSession().getAttribute("loginInfo");
		System.out.println(request.getParameter("habitNo"));
		int res = is.checkhabit(m, Integer.parseInt(request.getParameter("habitNo")));
		
//		res가 1일경우 오늘 체크한 습관이 없다는 것이다.
		if (res >= 1) {
//			int result = is.updateHabit(Integer.parseInt(request.getParameter("cCode")));
			
			
		}
//		오늘 이미 습관 체크했다는 것이다.
		else {
			mav.addObject("alertMsg", "오늘은 이미 체크하셨습니다.");
			mav.addObject("back", "back");
			mav.setView("common/result");
		}
		
		
		return mav;
	}
	
}
