package up.mypage.controller;

import java.io.File;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.security.interfaces.RSAKey;
import java.sql.ResultSet;
import java.util.Date;
import java.util.Enumeration;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import common.frontController.Controller;
import common.frontController.ModelAndView;
import common.util.FileUtil;
import common.vo.UploadFile;
import up.member.model.vo.Member;
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
	  * @변경이력 : 서비스 다오 만들다말았음 , 멤버테이블에 대표 타이틀 필요할듯
	  * @Method 설명 : 개인정보 변경하여 멤버테이블에 update 시켜준다.
	  * @param request
	  * @return ModelAndView
	 * @throws UnsupportedEncodingException 
	  */
	
	public ModelAndView infoUpdate(HttpServletRequest request){
		ModelAndView mav = new ModelAndView();
		// Member m = (Member) request.getSession().getAttribute("loginInfo");
		
		int res = 0;
		
		
		
		
		String uploadPath =  request.getServletContext().getRealPath("upload");
	     String fileName1 = "";
	     String orgfileName1 = "";
	     String title = "";	
			String nick = "";
	     
	      try {
	  		MultipartRequest multi = new MultipartRequest( // MultipartRequest 인스턴스 생성(cos.jar의 라이브러리)
	  				request, 
	  				uploadPath, // 파일을 저장할 디렉토리 지정
	  				1024 * 1024 * 10, // 첨부파일 최대 용량 설정(bite) / 10KB / 용량 초과 시 예외 발생
	  				"utf-8",// 인코딩 방식 지정
	  				new DefaultFileRenamePolicy() // 중복 파일 처리(동일한 파일명이 업로드되면 뒤에 숫자 등을 붙여 중복 회피)
	  				
	  		);
	  		
	  	
	  		
	  		fileName1 = multi.getFilesystemName("profile"); // name=file1의 업로드된 시스템 파일명을 구함(중복된 파일이 있으면, 중복 처리 후 파일 이름)
			orgfileName1 = multi.getOriginalFileName("profile"); // name=file1의 업로드된 원본파일 이름을 구함(중복 처리 전 이름)
			title = multi.getParameter("title");
			nick = multi.getParameter("nick");
		
			File file = multi.getFile("profile");
			
			res = ms.updateInfomation(title,  nick);
			
			if(res >= 1) {
				
				mav.setView("common/result");
				mav.addObject("url", "/up/mypage/mypage.do");
				mav.addObject("alertMsg", "개인정보 수정에 성공하였습니다.");
			}else {
				mav.addObject("alertMsg", "개인정보 수정에 실패하였습니다.");
				mav.addObject("back", "back");
				mav.setView("common/result");
			}
			
			/*File originFile = new File(uploadPath + "\\" + fileName1);
			res = ms.updateFileName(orgfileName1, fileName1);
			if(res > 0) {
				System.out.println("전송완료");
			}else {
				System.out.println("전송실패");
			}*/
			
			
	      }catch (Exception e) {
	  		e.getStackTrace();
	  		
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
		
		int res =  ms.updatePassword(newPwd, id);
		
		if(res >= 1) {
			m.setUserPwd(newPwd);
			request.getSession().setAttribute("loginInfo", m);
			mav.setView("common/result");
			mav.addObject("url", "/up/mypage/mypage.do");
			mav.addObject("alertMsg", "비밀번호 수정에 성공하였습니다.");
		}else {
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
		
		if(res >= 1) {
			m.setUserLeaveYN("Y");
			request.getSession().setAttribute("loginInfo", m);
			mav.setView("common/result");
			mav.addObject("url", "/up/mypage/goodbye.do");
			mav.addObject("alertMsg", "회원탈퇴처리가 성공적으로 완료되었습니다.");
		}else {
			mav.addObject("alertMsg", "회원탈퇴처리에 실패하였습니다.");
			mav.addObject("back", "back");
			mav.setView("common/result");
		}

		return mav;
	}
	
	
	public ModelAndView uploadProfileImage(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		int res = 0;
		String uploadPath =  request.getServletContext().getRealPath("upload");
	     String fileName1 = "";
	     String orgfileName1 = "";
	     
	     
	      try {
	  		MultipartRequest multi = new MultipartRequest( // MultipartRequest 인스턴스 생성(cos.jar의 라이브러리)
	  				request, 
	  				uploadPath, // 파일을 저장할 디렉토리 지정
	  				1024 * 1024 * 10, // 첨부파일 최대 용량 설정(bite) / 10KB / 용량 초과 시 예외 발생
	  				"utf-8",// 인코딩 방식 지정
	  				new DefaultFileRenamePolicy() // 중복 파일 처리(동일한 파일명이 업로드되면 뒤에 숫자 등을 붙여 중복 회피)
	  				
	  		);
	  		
	  	
	  		
	  		fileName1 = multi.getFilesystemName("profile"); // name=file1의 업로드된 시스템 파일명을 구함(중복된 파일이 있으면, 중복 처리 후 파일 이름)
			orgfileName1 = multi.getOriginalFileName("profile"); // name=file1의 업로드된 원본파일 이름을 구함(중복 처리 전 이름)
			
		
		
			
			/*File originFile = new File(uploadPath + "\\" + fileName1);
			res = ms.updateFileName(orgfileName1, fileName1);
			if(res > 0) {
				System.out.println("전송완료");
			}else {
				System.out.println("전송실패");
			}*/
			mav.setView("common/result");
			mav.addObject("back", "back");
	      }catch (Exception e) {
	  		e.getStackTrace();
	  		mav.setView("file");
	  	}
	      
		return mav;
	}
	
}
