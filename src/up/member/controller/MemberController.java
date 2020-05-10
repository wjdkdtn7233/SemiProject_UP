package up.member.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import common.frontController.Controller;
import common.frontController.ModelAndView;
import up.member.model.service.MemberService;
import up.member.model.vo.Member;
import up.mypage.controller.MyPageController;
import up.mypage.controller.TitleUrlController;

/**
 * @FileName : MemberController.java
 * @Project : semiproject_0.1
 * @Date : 2020. 4. 28.
 * @작성자 : 박혜연
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
		
		List<String> list = ms.wise();
		
		mav.addObject("wiseList", list);
		mav.setView("member/login");

		return mav;
	}

	/**
	 * @MethodName: loginImple
	 * @ClassName: MemberController.java
	 * @변경이력: 회원탈퇴 시, 로그인 제한 (5/2 완료) // 카카오톡 로그인 미완료
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
			if (m.getUserLeaveYN().equals("N") || m.getUserLeaveYN().equals("n")) {
				// leave_yn 이 y면 로그인 불가
				HttpSession session = request.getSession();
				session.setAttribute("loginInfo", m);
				// 유저가 로그인 하는동안 타이틀 네임 / 컬러 띄워주는 메소드
				MyPageController mc = new MyPageController();
				
				// 타이틀 url 가져오기 
				TitleUrlController uc = new TitleUrlController();
				uc.getTitleURL(request);
				//
				mc.getTitle(request,m);
				
				//history 갱신
				history(m.getUserId());
				mav.setView("index/index");
			} else {
				mav.addObject("isSuccess", "false");
				mav.setView("member/login");
			}
		} else {
			mav.addObject("isSuccess", "false");
			mav.setView("member/login");
		}
		return mav;
	}

	/**
	 * @MethodName: register
	 * @ClassName: MemberController.java
	 * @변경이력: 완료
	 * @Comment: 회원가입 페이지 // ID체크, 비밀번호체크 js 설정
	 * @작성자: 박혜연
	 * @작성일: 2020. 4. 28.
	 */
	public ModelAndView register(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		mav.setView("member/register");

		return mav;
	}
	
	public ModelAndView kakaoRegister(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		String id = request.getParameter("id");
		request.setAttribute("id", id);
		mav.setView("member/kakaoregister");

		return mav;
	}

	
	/**
	 * @MethodName: idCheck
	 * @ClassName: MemberController.java
	 * @변경이력: 완료
	 * @Comment: register의 id 체크와 ms.idCheck 연결
	 * @작성자: 박혜연
	 * @작성일: 2020. 4. 30.
	 */
	public ModelAndView idCheck(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();

		String userId = ms.idCheck(request.getParameter("userId"));

		mav.setView("ajax");
		mav.addObject("userId", userId);

		return mav;
	}

	/**
	 * @MethodName: emailCheck
	 * @ClassName: MemberController.java
	 * @변경이력:완료
	 * @Comment: 회원가입 시, 확인용 메일 발송
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

		// 회원 이메일로 등록 요청 메일 발송
		ms.regEmailCheck(m);

		mav.setView("member/emailCheck");

		return mav;
	}
	
	/**
	 *	@MethodName: sendMailCheck
	 *	@ClassName: MemberController.java
	 *	@변경이력: 완료
	 *	@Comment: id찾기, 비밀번호 찾기 시 이메일 여부 확인
	 *	@작성자: 박혜연
	 *	@작성일: 2020. 5. 8.
	*/
	public ModelAndView sendMailCheck(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		
		String userEmail = ms.mailCheck(request.getParameter("userEmail"));
		
		mav.setView("ajax");
		mav.addObject("userEmail", userEmail);
		
		return mav;
	}

	/**
	 * @MethodName: insertMember
	 * @ClassName: MemberController.java
	 * @변경이력: 완료
	 * @Comment: 회원등록
	 * @작성자: 박혜연
	 * @작성일: 2020. 5. 1.
	 */
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
		// 회원 이메일로 등록 요청 메일 발송
		if (result >= 1) {
			// 변경된 sql 구문이 있다면
			mav.setView("member/welcome");
		} else {
			// 변경된 sql 구문이 없다면
			mav.setView("member/register");
			mav.addObject("isSuccess", "false");
		}

		return mav;
	}

	/**
	 * @MethodName: welcome
	 * @ClassName: MemberController.java
	 * @변경이력: 완료
	 * @Comment: 회원가입 이메일 최종 확인 후 welcome 페이지 연결
	 * @작성자: 박혜연
	 * @작성일: 2020. 5. 1.
	 */
	public ModelAndView welcome(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		mav.setView("member/welcome");

		return mav;
	}

	/**
	 * @MethodName: forgotId
	 * @ClassName: MemberController.java
	 * @변경이력: 완료
	 * @Comment: 아이디 찾기 페이지
	 * @작성자: 박혜연
	 * @작성일: 2020. 4. 28.
	 */
	public ModelAndView forgotId(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		mav.setView("member/forgotId");

		return mav;
	}

	/**
	 * @MethodName: findId
	 * @ClassName: MemberController.java
	 * @변경이력: 완료
	 * @Comment: id 찾기 기능
	 * @작성자: 박혜연
	 * @작성일: 2020. 5. 1.
	 */
	public ModelAndView findId(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();

		ms.findid(request.getParameter("userEmail"));

		mav.setView("member/login");

		return mav;
	}

	/**
	 * @MethodName: forgotPwd
	 * @ClassName: MemberController.java
	 * @변경이력: 완료
	 * @Comment: 비밀번호 찾기 페이지 // email sending 연결 필요
	 * @작성자: 박혜연
	 * @작성일: 2020. 4. 28.
	 */
	public ModelAndView forgotPwd(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();

		mav.setView("member/forgotPwd");

		return mav;
	}

	/**
	 * @MethodName: findPwd
	 * @ClassName: MemberController.java
	 * @변경이력: 완료
	 * @Comment: 비밀번호 찾기 기능 (이메일 연결 필요)
	 * @작성자: 박혜연
	 * @작성일: 2020. 5. 1.
	 */
	public ModelAndView findPwd(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();

		ms.findPwd(request.getParameter("userId"), request.getParameter("userEmail"));

		mav.setView("member/login");

		return mav;
	}
	
	/**
	 *	@MethodName: kakaoIdCheck
	 *	@ClassName: MemberController.java
	 *	@변경이력: 
	 *	@Comment: kakaoId 중복여부 확인
	 *	@작성자: 박혜연
	 *	@작성일: 2020. 5. 7.
	*/
	public ModelAndView kakaoIdCheck(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		
		System.out.println(request.getParameter("id"));
		
		String kakaoId = ms.idCheck(request.getParameter("id"));
		
		System.out.println("확인용" + kakaoId);

		mav.setView("ajax");
		mav.addObject("id", kakaoId);
		
		return mav;
	}

	/**
	 * @MethodName: kakaoLogin
	 * @ClassName: MemberController.java
	 * @변경이력:
	 * @Comment: 카카오 로그인 결과 토큰으로 받아온 내용과 DB 비교 후 로그인
	 * @작성자: 박혜연
	 * @작성일: 2020. 5. 6.
	 */
	public ModelAndView kakaoLogin(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();

		String id = request.getParameter("id");
		System.out.println(id);
		request.setAttribute("id", id);
		Member m = ms.kakaoImple(id);

		if (m != null) {
			if (m.getUserLeaveYN().equals("N") || m.getUserLeaveYN().equals("n")) {
				// leave_yn 이 y면 로그인 불가
				// 로그인 시 로그인 횟수 +1
				m.setUserLoginCnt((m.getUserLoginCnt())+1);
				
				HttpSession session = request.getSession();
				session.setAttribute("loginInfo", m);
				// 유저가 로그인 하는동안 타이틀 네임 / 컬러 띄워주는 메소드
				MyPageController mc = new MyPageController();

				mc.getTitle(request,m);
				
				//history 갱신
				history(m.getUserId());
				mav.setView("index/index");
			} else {
				mav.setView("common/result");
				mav.addObject("url", "/up/mypage/login.do");
				mav.addObject("alertMsg", "탈퇴한 회원입니다.");
			}
		} else {
			mav.setView("common/result");
			mav.addObject("url", "/up/mypage/kakaoregister.do");
			mav.addObject("alertMsg", "등록되지 않은 회원입니다. 회원가입을 해주세요.");
		}
		
		return mav;
	}
	
	public void history(String userId) {
		ms.history(userId);
	}

}
