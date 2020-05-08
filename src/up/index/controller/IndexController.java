package up.index.controller;

import javax.servlet.http.HttpServletRequest;

import common.frontController.Controller;
import common.frontController.ModelAndView;

import up.index.model.service.IndexService;
import up.member.model.vo.Member;

import up.member.model.service.MemberService;

/**
 * @FileName : IndexController.java
 * @Project : semiproject
 * @Date : 2020. 4. 28.
 * @작성자 : 김성민
 * @변경이력 :
 * @프로그램 설명 : main 페이지 controller
 */
public class IndexController implements Controller {

	IndexService is = new IndexService();

	/**
	 * @Method Name : index
	 * @작성일 : 2020. 4. 28.
	 * @작성자 : 김성민
	 * @변경이력 : simple 페이지에서 index페이지생성해서 변경
	 * @Method 설명 : index view 페이지로 연결시켜줍니다.
	 * @param request
	 * @return ModelAndView
	 */
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
		mav.addObject("HabitList", is.selectHabitList(m.getUserId()));
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
}
