package up.index.controller;

import javax.servlet.http.HttpServletRequest;

import common.frontController.Controller;
import common.frontController.ModelAndView;

/**
  * @FileName : IndexController.java
  * @Project : semiproject
  * @Date : 2020. 4. 28. 
  * @작성자 : 김성민
  * @변경이력 : 
  * @프로그램 설명 : main 페이지에 보여줄 내용
  */
public class IndexController implements Controller  {

	
	/**
	  * @Method Name : index
	  * @작성일 : 2020. 4. 28.
	  * @작성자 : 김성민
	  * @변경이력 : 편의상 이름은 simple이 아닌 index로 설정했습니다만 변경요청시 바꾸겠습니다.
	  * @Method 설명 : Simple view 페이지로 연결시켜줍니다.
	  * @param request
	  * @return ModelAndView
	  */
	public ModelAndView index(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		System.out.println("인덱스 메서드 잘 실행되나~");
		mav.setView("index/index");
		
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
