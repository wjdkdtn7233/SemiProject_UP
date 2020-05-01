package up.member.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import common.frontController.Controller;
import common.frontController.ModelAndView;
import up.member.model.service.MemberService;
import up.member.model.vo.Member;

/**
 * @FileName : MemberController.java
 * @Project : semiproject_0.1
 * @Date : 2020. 4. 28.
 * @작성자 : Hyeyeon
 * @변경이력 :
 * @프로그램설명 : member jsp folder 기능(로그인, 회원가입, ID체크, email체크)
 */
public class MemberController implements Controller {

	MemberService ms = new MemberService();

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
	 * @MethodName: loginImple
	 * @ClassName: MemberController.java
	 * @변경이력:
	 * @Comment: login 페이지에서 로그인 버튼 클릭 시, DB와 연결하여 확인 후 index로 넘기는 기능
	 * @작성자: 박혜연
	 * @작성일: 2020. 4. 30.
	 */
	public ModelAndView loginImple(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		
		String id = request.getParameter("userId");
		String pwd = request.getParameter("userPwd");
		Member m = ms.loginImple(id, pwd);

		if (m != null) {

			HttpSession session = request.getSession();
			session.setAttribute("loginInfo", m);
			mav.setView("index/index");

		} else {
			mav.addObject("isSuccess", "false");
			mav.setView("member/login");
		}
		
		System.out.println("----Running in MemeberController----");

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
	 *	@MethodName: idCheck
	 *	@ClassName: MemberController.java
	 *	@변경이력: 
	 *	@Comment: register의 id 체크와 ms.idCheck 연결
	 *	@작성자: 박혜연
	 *	@작성일: 2020. 4. 30.
	*/
	public ModelAndView idCheck(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		
		String userId = ms.idCheck(request.getParameter("userId"));
		
		mav.setView("ajax");
		mav.addObject("userId", userId);
		
		System.out.println(request.getParameter("userId"));
		System.out.println("----Running in MemeberController----");
		
		return mav;
	}
	
	/**
	 * @MethodName: emailCheck
	 * @ClassName: MemberController.java
	 * @변경이력:
	 * @Comment:
	 * @작성자: 박혜연
	 * @작성일: 2020. 4. 28.
	 */
	public ModelAndView emailCheck(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		int result = 0;
		Member m = new Member();
		
		m.setUserId(request.getParameter("userId"));
		m.setUserPwd(request.getParameter("userPwd"));
		m.setUserName(request.getParameter("userName"));
		m.setUserNickName(request.getParameter("userNickName"));
		m.setUserEmail(request.getParameter("userEmail"));
		
		//회원 이메일로 등록 요청 메일 발송
		ms.regEmailCheck(m);
		
		mav.setView("member/emailCheck");

		return mav;
	}
	
	public ModelAndView insertMember(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		int result = 0;
		Member m = new Member();
		
		m.setUserId(request.getParameter("userId"));
		m.setUserPwd(request.getParameter("userPwd"));
		m.setUserName(request.getParameter("userName"));
		m.setUserNickName(request.getParameter("userNickName"));
		m.setUserEmail(request.getParameter("userEmail"));
		
		result = ms.insertMember(m);
		//회원 이메일로 등록 요청 메일 발송
		if(result >= 1) {
			// 변경된 sql 구문이 있다면
			mav.setView("member/welcome");
		} else {
			// 변경된 sql 구문이 없다면
			mav.setView("member/register");
			mav.addObject("isSuccess", "false");
		}

		return mav;
	}
	
	
	
	public ModelAndView welcome(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		System.out.println("----Running in MemeberController----");
		mav.setView("member/welcome");

		return mav;
	}

	/**
	 * @MethodName: forgotId
	 * @ClassName: MemberController.java
	 * @변경이력:
	 * @Comment: 아이디 찾기 페이지 // email sending 연결 필요
	 * @작성자: 박혜연
	 * @작성일: 2020. 4. 28.
	 */
	public ModelAndView forgotId(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		System.out.println("----Running in MemeberController----");
		mav.setView("member/forgotId");

		return mav;
	}

	/**
	 * @MethodName: forgotPwd
	 * @ClassName: MemberController.java
	 * @변경이력:
	 * @Comment: 비밀번호 찾기 페이지 // email sending 연결 필요
	 * @작성자: 박혜연
	 * @작성일: 2020. 4. 28.
	 */
	public ModelAndView forgotPwd(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		System.out.println("----Running in MemeberController----");
		mav.setView("member/forgotPwd");

		return mav;
	}


}
