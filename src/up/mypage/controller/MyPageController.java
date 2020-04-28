package up.mypage.controller;

import javax.servlet.http.HttpServletRequest;

import common.frontController.Controller;
import common.frontController.ModelAndView;

public class MyPageController implements Controller {

	/**
	 *	1. MethodName: myPage
	 *	2. ClassName: MyPageController.java
	 *	3. Comment: 마이페이지 이동
	 *	4. 작성자: 정상훈
	 *	5. 작성일: 2020. 4. 28.
	 */
	public ModelAndView myPage(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		
		mav.setView("mypage/myPage");
		
		return mav;
	}
	public ModelAndView habitHistory(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		
		mav.setView("mypage/habitHistory");
		
		return mav;
	}
	public ModelAndView titleList(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		
		mav.setView("mypage/titleList");
		
		return mav;
	}
	public ModelAndView infoPwdCheck(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		
		mav.setView("mypage/infoPwdCheck");
		
		return mav;
	}	
	public ModelAndView pwPwdCheck(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		
		mav.setView("mypage/pwPwdCheck");
		
		return mav;
	}
	public ModelAndView infoModify(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		
		mav.setView("mypage/infoModify");
		
		return mav;
	}
	public ModelAndView passwordModify(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		
		mav.setView("mypage/passwordModify");
		
		return mav;
	}
	public ModelAndView memberWithdrawal(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		
		mav.setView("mypage/memberWithdrawal");
		
		return mav;
	}
}
