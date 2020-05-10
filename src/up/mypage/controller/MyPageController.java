package up.mypage.controller;

import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import common.frontController.Controller;
import common.frontController.ModelAndView;
import up.member.model.vo.Member;
import up.mypage.model.service.MyPageService;
import up.mypage.model.vo.History;
import up.mypage.model.vo.Title;

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
	 * @Method 설명 :습관히스토리 DB에서 히스토리를 List에 담아 habitHistory.jsp에 뿌려준다.
	 * @param request
	 * @return ModelAndView
	 */
	public ModelAndView habitHistory(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		Member m = (Member) request.getSession().getAttribute("loginInfo");
		
		mav.addObject("historyList", ms.selectHabitHistory(m));
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
		mav.setView("mypage/titleList");
		mav.addObject("titleList", ms.selectTitleList());
		return mav;

	}

	/**
	 * @Method Name : infoPwdCheck
	 * @작성일 : 2020. 4. 29.
	 * @작성자 : 정상훈
	 * @변경이력 : 이거 로그인정보 세션객체에 담기면 infoPwdCheck.jsp 하단 script부분 완성해주면됨
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
	 * @변경이력 : 이거 로그인정보 세션객체에 담기면 pwPwdCheck.jsp 하단 script부분 완성해주면됨
	 * @Method 설명 : pwPwdCheck.jsp 로 이동
	 * @param request
	 * @return ModelAndView
	 */
	public ModelAndView pwPwdCheck(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		// Member m = (Member) request.getSession().getAttribute("loginInfo");
		mav.setView("mypage/pwPwdCheck");
		String uploadPath = request.getServletContext().getRealPath("resources\\upload");
		System.out.println(uploadPath);
		return mav;
	}

	/**
	 * @Method Name : infoModify
	 * @작성일 : 2020. 5. 1.
	 * @작성자 : 정상훈
	 * @변경이력 : 완성
	 * @Method 설명 : 개인정보수정 화면으로 이동
	 * @param request
	 * @return ModelAndView
	 */

	public ModelAndView infoModify(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		Member m = (Member) request.getSession().getAttribute("loginInfo");
		mav.addObject("tList", ms.selectUserTitle(m));
		mav.setView("mypage/infoModify");

		return mav;
	}

	/**
	 * @Method Name : infoUpdate
	 * @작성일 : 2020. 5. 1.
	 * @작성자 : 정상훈
	 * @변경이력 : 완성
	 * @Method 설명 : 개인정보 변경하여 멤버테이블에 update 시켜준다(닉네임,대표타이틀,프로필사진).
	 * @param request
	 * @return ModelAndView
	 * @throws IOException
	 * @throws UnsupportedEncodingException
	 */

	public ModelAndView infoUpdate(HttpServletRequest request) throws IOException {
		ModelAndView mav = new ModelAndView();
		Member m = (Member) request.getSession().getAttribute("loginInfo");

		int res = 0;
		String uploadPath = request.getServletContext().getRealPath("/") + "resources/upload";
		int size = 1024 * 1024 * 10;
		String fileName = "";
		String orgfileName = "";
		String title = "";
		String nick = "";
		String basicPicture = "";

		// 파일의 경로 + 파일명
		String filePath = uploadPath + "/" + m.getOriginFile();
		String filePath2 = uploadPath+ "/" + m.getRenameFile();
		System.out.println(filePath);
		System.out.println(filePath2);
		File deleteFile = new File(filePath);
		File deleteFile2 = new File(filePath2);

		// 파일이 존재하는지 체크 존재할경우 true, 존재하지않을경우 false
		

		MultipartRequest multi = new MultipartRequest( // MultipartRequest 인스턴스 생성(cos.jar의 라이브러리)
				request, uploadPath, // 파일을 저장할 디렉토리 지정
				size, // 첨부파일 최대 용량 설정(bite) / 10KB / 용량 초과 시 예외 발생
				"utf-8", // 인코딩 방식 지정
				new DefaultFileRenamePolicy()); // 중복 파일 처리(동일한 파일명이 업로드되면 뒤에 숫자 등을 붙여 중복 회피)

		basicPicture = multi.getParameter("basicPicture");
		fileName = multi.getFilesystemName("profile"); // name=file1의 업로드된 시스템 파일명을 구함(중복된 파일이 있으면, 중복 처리 후 파일 이름)
		orgfileName = multi.getOriginalFileName("profile"); // name=file1의 업로드된 원본파일 이름을 구함(중복 처리 전 이름)
		title = multi.getParameter("title");
		nick = multi.getParameter("nick");
		System.out.println(fileName + "잘 나오냐" + orgfileName);

		// 기본이미지라면
		if (basicPicture.equals("unnamed.jpg")) {
			ms.updateFileName(basicPicture, basicPicture, m.getUserId());
			// 로그인 세션에 유저의 현재 프로필 사진네임을 다시 셋팅해준다.
			if (!m.getOriginFile().equals("unnamed.jpg")) {
				if (deleteFile2.exists()) {

					// 파일을 삭제합니다.
					deleteFile2.delete();
					System.out.println("파일을 삭제하였습니다.");

				}else {
					System.out.println("파일이 존재하지 않습니다.");
				}
			}
			m.setOriginFile(basicPicture);
			m.setRenameFile(basicPicture);
			// 기본이미지가 아니고 받아온 파일의 이름이 null이 아니라면
		} else if (orgfileName != null) {
			ms.updateFileName(orgfileName, fileName, m.getUserId());
			// 로그인 세션에 유저의 현재 프로필 사진네임을 다시 셋팅해준다.
			if (!m.getOriginFile().equals("unnamed.jpg")) {
				if (deleteFile2.exists()) {

					// 파일을 삭제합니다.
					deleteFile2.delete();
					System.out.println("파일을 삭제하였습니다.");

				}else {
					System.out.println("파일이 존재하지 않습니다.");
				}
			}
			m.setOriginFile(orgfileName);
			m.setRenameFile(fileName);
		}

		res = ms.updateInfomation(title, nick, m);

		if (res >= 1) {
			// 유저가 바꾼 닉네임, 파일 이름 로그인 세션에 다시 바꿔서 저장한다.
			m.setUserNickName(nick);
			
			// 대표타이틀도 바꿨으니 다시 초기화
			
			// 대표 타이틀 url 도 초기화
			TitleUrlController uc = new TitleUrlController();
			uc.getTitleURL(request);
			
			m.setUserTitleCode(getTitle(request,m).getTCode());
			
			request.getSession().setAttribute("loginInfo", m);
			mav.setView("common/result");
			mav.addObject("url", "/up/mypage/mypage.do");
			mav.addObject("alertMsg", "개인정보 수정에 성공하였습니다.");
		} else {
			mav.addObject("alertMsg", "개인정보 수정에 실패하였습니다.");
			mav.addObject("back", "back");
			mav.setView("common/result");
		}

		return mav;
	}

	/**
	 * @Method Name : passwordModify
	 * @작성일 : 2020. 5. 1.
	 * @작성자 : 정상훈
	 * @변경이력 : 완성
	 * @Method 설명 : 비밀번화 확인 후 비밀번호 변경 페이지로 넘어가는 메소드
	 * @param request
	 * @return ModelAndView
	 */

	public ModelAndView passwordModify(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();

		mav.setView("mypage/passwordModify");

		return mav;
	}

	/**
	 * @Method Name : pwdCheck
	 * @작성일 : 2020. 5. 1.
	 * @작성자 : 정상훈
	 * @변경이력 : 완료
	 * @Method 설명 : 사용자가 변경하고자 하는 비밀번호를 입력받아 update 시켜준다.
	 * @param request
	 * @return ModelAndView
	 */

	public ModelAndView pwdCheck(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		Member m = (Member) request.getSession().getAttribute("loginInfo");

		String newPwd = request.getParameter("newPwd");
		String id = m.getUserId();

		int res = ms.updatePassword(newPwd, id);

		if (res >= 1) {
			m.setUserPwd(newPwd);
			request.getSession().setAttribute("loginInfo", m);
			mav.setView("common/result");
			mav.addObject("url", "/up/mypage/mypage.do");
			mav.addObject("alertMsg", "비밀번호 수정에 성공하였습니다.");
		} else {
			mav.addObject("alertMsg", "비밀번호 수정에 실패하였습니다.");
			mav.addObject("back", "back");
			mav.setView("common/result");
		}
		return mav;
	}

	/**
	 * @Method Name : memberWithdrawal
	 * @작성일 : 2020. 5. 1.
	 * @작성자 : 정상훈
	 * @변경이력 : 완성
	 * @Method 설명 : 회원탈퇴 페이지로 이동
	 * @param request
	 * @return ModelAndView
	 */

	public ModelAndView memberWithdrawal(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		// Member m = (Member) request.getSession().getAttribute("loginInfo");
		mav.setView("mypage/memberWithdrawal");

		return mav;
	}

	/**
	 * @Method Name : deleteMember
	 * @작성일 : 2020. 5. 1.
	 * @작성자 : 정상훈
	 * @변경이력 :
	 * @Method 설명 : 회원탈퇴를 원하는 고객의 leave_yn 값을 y로 변경
	 * @param request
	 * @return ModelAndView
	 */

	public ModelAndView deleteMember(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		Member m = (Member) request.getSession().getAttribute("loginInfo");

		int res = 0;

		res = ms.updateLeaveYN(m);

		if (res >= 1) {
			m.setUserLeaveYN("Y");
			request.getSession().setAttribute("loginInfo", m);
			// 회원탈퇴하면서 세션 무효화
			request.getSession().invalidate();
			mav.setView("common/result");
			mav.addObject("url", "/up/mypage/goodbye.do");
			mav.addObject("alertMsg", "회원탈퇴처리가 성공적으로 완료되었습니다.");
		} else {
			mav.addObject("alertMsg", "회원탈퇴처리에 실패하였습니다.");
			mav.addObject("back", "back");
			mav.setView("common/result");
		}

		return mav;
	}

	/**
	 * @Method Name : getTitle
	 * @작성일 : 2020. 5. 3.
	 * @작성자 : 정상훈
	 * @변경이력 : 완성
	 * @Method 설명 : 유저의 대표타이틀의 컬러와 네임을 가져온다.
	 * @param request
	 */

	public Title getTitle(HttpServletRequest request,Member m) {
		
		Title title = ms.getTitle(m);
		request.getSession().setAttribute("representationTitle", title);
		
		return title;

	}

	public ModelAndView goodBye(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		// Member m = (Member) request.getSession().getAttribute("loginInfo");
		mav.setView("mypage/goodBye");

		return mav;
	}
}
