package up.habit.controller;

import javax.servlet.http.HttpServletRequest;

import common.frontController.Controller;
import common.frontController.ModelAndView;

public class HabitController implements Controller{

	
	public ModelAndView habitPage(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		mav.setView("habit/habitPage");
		
		
		return mav;
	}
	
	public ModelAndView habitRegistration(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		mav.setView("habit/habitRegistration");
		
		
		return mav;
	}
}
