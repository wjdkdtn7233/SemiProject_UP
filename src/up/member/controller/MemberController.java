package up.member.controller;

import javax.servlet.http.HttpServletRequest;

import common.frontController.Controller;
import common.frontController.ModelAndView;

/**
  * @FileName : MemberController.java
  * @Project : semiproject_0.1
  * @Date : 2020. 4. 28. 
  * @작성자 : Hyeyeon
  * @변경이력 :
  * @프로그램설명 : member jsp folder 기능(로그인, 회원가입, ID체크, email체크)
  */
public class MemberController implements Controller {

	/**
	 * @MethodName: login
	 * @ClassName: MemberController.java
	 * @변경이력: 카카오 로그인 버튼 변경 (url 미연결 상태), ID/비밀번호찾기/회원가입 페이지 연결
	 * @Comment: 로그인 페이지(사이트 메인 대문 화면) // 명언 슬라이드 부분 수정 필요
	 * @작성자: 박혜연
	 * @작성일: 2020. 4. 28.
	 */
	public ModelAndView login(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		System.out.println("----Running in MemeberController----");
		mav.setView("member/login");

		return mav;
	}

	/**
	 * @MethodName: register
	 * @ClassName: MemberController.java
	 * @변경이력: 로고, footer 추가
	 * @Comment: 회원가입 페이지 // ID체크, 비밀번호체크 js 설정 필요
	 * @작성자: 박혜연
	 * @작성일: 2020. 4. 28.
	 */
	public ModelAndView register(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		System.out.println("----Running in MemeberController----");
		mav.setView("member/register");

		return mav;
	}
	
	/**
	 *	@MethodName: forgotId
	 *	@ClassName: MemberController.java
	 *	@변경이력: 
	 *	@Comment: 아이디 찾기 페이지 // email sending 연결 필요
	 *	@작성자: 박혜연
	 *	@작성일: 2020. 4. 28.
	*/
	public ModelAndView forgotId(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		System.out.println("----Running in MemeberController----");
		mav.setView("member/forgotId");
		
		return mav;
	}
	
	/**
	 *	@MethodName: forgotPwd
	 *	@ClassName: MemberController.java
	 *	@변경이력: 
	 *	@Comment: 비밀번호 찾기 페이지 // email sending 연결 필요
	 *	@작성자: 박혜연
	 *	@작성일: 2020. 4. 28.
	*/
	public ModelAndView forgotPwd(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		System.out.println("----Running in MemeberController----");
		mav.setView("member/forgotPwd");
		
		return mav;
	}
	
	/**
	 *	@MethodName: emailCheck
	 *	@ClassName: MemberController.java
	 *	@변경이력: 
	 *	@Comment: 
	 *	@작성자: 박혜연
	 *	@작성일: 2020. 4. 28.
	*/
	public ModelAndView emailCheck(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		System.out.println("----Running in MemeberController----");
		mav.setView("member/emailCheck");
		
		return mav;
	}

}
