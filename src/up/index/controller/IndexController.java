package up.index.controller;

import javax.servlet.http.HttpServletRequest;

import common.frontController.Controller;
import common.frontController.ModelAndView;

public class IndexController implements Controller  {

	public ModelAndView index(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		System.out.println("인덱스 메서드 잘 실행되나~");
		mav.setView("index/index");
		
		return mav;
	}
}
