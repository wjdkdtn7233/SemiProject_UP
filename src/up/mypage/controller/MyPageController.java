package up.mypage.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import common.frontController.Controller;
import common.frontController.ModelAndView;
import up.mypage.model.service.MyPageService;

/**
  * @FileName : MyPageController.java
  * @Project : semiproject
  * @Date : 2020. 4. 28. 
  * @작성자 : 정상훈
  * @변경이력 :
  * @프로그램 설명 : mypage 에 대한 컨트롤러
  */
public class MyPageController implements Controller {

	MyPageService ms = new MyPageService();

	// 1. MethodName: myPage
	// 2. ClassName: MyPageController.java
	// 3. Comment: 마이페이지 이동
	// 4. 작성자: 정상훈
	// 5. 작성일: 2020. 4. 28.

	/**
	  * @Method Name : myPage
	  * @작성일 : 2020. 4. 28.
	  * @작성자 : 정상훈
	  * @변경이력 : 완료
	  * @Method 설명 : myPage.jsp 로 이동
	  * @param request
	  * @return ModelAndView
	  */
	public ModelAndView myPage(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		mav.setView("mypage/myPage");

		return mav;
	}

	/**
	 * @Method Name : habitHistory
	 * @작성일 : 2020. 4. 28.
	 * @작성자 : 정상훈
	 * @변경이력 : Member vo 가 만들어지지 않아 일단 주석처리 해놓음
	 * @Method 설명 :습관히스토리 DB에서  히스토리를 List에 담아 habitHistory.jsp에 뿌려준다.
	 * @param request
	 * @return ModelAndView
	 */
	public ModelAndView habitHistory(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		// Member m = (Member) request.getSession().getAttribute("loginInfo");
		mav.addObject("historyList", ms.selectHabitHistory(/* m */));
		mav.setView("mypage/habitHistory");
		
		return mav;
	}

	/**
	  * @Method Name : titleList
	  * @작성일 : 2020. 4. 28.
	  * @작성자 : 정상훈
	  * @변경이력 : 완료
	  * @Method 설명 : tb_title 의 data를 꺼내와 titleList.jsp에 뿌려준다.
	  * @param request
	  * @return ModelAndView
	  */
	public ModelAndView titleList(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		mav.setView("mypage/titleLihst");
		mav.addObject("titleList", ms.selectTitleList());
		return mav;
		
	}

	/**
	  * @Method Name : infoPwdCheck
	  * @작성일 : 2020. 4. 29.
	  * @작성자 : 정상훈
	  * @변경이력 : 이거 로그인정보 세션객체에 담기면  infoPwdCheck.jsp  하단 script부분 완성해주면됨
	  * @Method 설명 : infoPwdCheck.jsp 로 이동.
	  * @param request
	  * @return ModelAndView
	  */
	public ModelAndView infoPwdCheck(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		// Member m = (Member) request.getSession().getAttribute("loginInfo");
		mav.setView("mypage/infoPwdCheck");

		return mav;
	}

	/**
	  * @Method Name : pwPwdCheck
	  * @작성일 : 2020. 4. 29.
	  * @작성자 : 정상훈
	  * @변경이력 : 이거 로그인정보 세션객체에 담기면  pwPwdCheck.jsp  하단 script부분 완성해주면됨
	  * @Method 설명 : pwPwdCheck.jsp 로 이동
	  * @param request
	  * @return ModelAndView
	  */
	public ModelAndView pwPwdCheck(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		// Member m = (Member) request.getSession().getAttribute("loginInfo");
		mav.setView("mypage/pwPwdCheck");

		return mav;
	}

	public ModelAndView infoModify(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		// Member m = (Member) request.getSession().getAttribute("loginInfo");
		mav.setView("mypage/infoModify");

		return mav;
	}

	public ModelAndView passwordModify(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		// Member m = (Member) request.getSession().getAttribute("loginInfo");
		mav.setView("mypage/passwordModify");

		return mav;
	}

	public ModelAndView memberWithdrawal(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		// Member m = (Member) request.getSession().getAttribute("loginInfo");
		mav.setView("mypage/memberWithdrawal");

		return mav;
	}
}
