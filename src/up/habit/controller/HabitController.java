package up.habit.controller;

import javax.servlet.http.HttpServletRequest;

import com.sun.mail.handlers.message_rfc822;

import common.frontController.Controller;
import common.frontController.ModelAndView;
import up.habit.model.service.HabitService;
import up.member.model.vo.Member;

public class HabitController implements Controller{

	HabitService hm = new HabitService();
	
	
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
	
	public ModelAndView habitRemove(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		Member m = (Member) request.getSession().getAttribute("loginInfo");
		
		
		mav.setView("habit/habitRemove");
		mav.addObject("hList", hm.selectHabitList(m));
		
		return mav;
	}
	
	public ModelAndView deleteHabit(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		Member m = (Member) request.getSession().getAttribute("loginInfo");
		
		
		mav.setView("ajax");
		
		return mav;
	}
}
