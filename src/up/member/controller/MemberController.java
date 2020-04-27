package up.member.controller;

import javax.servlet.http.HttpServletRequest;

import common.frontController.Controller;
import common.frontController.ModelAndView;

public class MemberController implements Controller{
	
	
	/**
	 *	1. MethodName: login
	 *	2. ClassName: MemberController.java
	 *	3. Comment: 로그인 기능
	 *	4. 작성자: 박혜연
	 *	5. 작성일: 2020. 4. 27.
	 */
	public ModelAndView login(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		System.out.println("----Running in MemeberController----");
		mav.setView("member/login");
		
		return mav;
	}
	
	
	/**
	 *	1. MethodName: register
	 *	2. ClassName: MemberController.java
	 *	3. Comment: 회원 가입 기능
	 *	4. 작성자: 박혜연
	 *	5. 작성일: 2020. 4. 27.
	 */
	public ModelAndView register(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		System.out.println("----Running in MemeberController----");
		mav.setView("member/register");
		
		return mav;
	}

}
