package up.habit.controller;

import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.swing.plaf.basic.BasicScrollPaneUI.HSBChangeListener;

import org.apache.catalina.filters.AddDefaultCharsetFilter;

import com.sun.mail.handlers.message_rfc822;

import common.frontController.Controller;
import common.frontController.ModelAndView;
import up.habit.model.service.HabitService;
import up.habit.model.vo.Habit;
import up.member.model.service.MemberService;
import up.member.model.vo.Member;

public class HabitController implements Controller {

	HabitService hs = new HabitService();

	/**
	  * @Method Name : habitPage
	  * @작성일 : 2020. 5. 7.
	  * @작성자 : 정상훈
	  * @변경이력 : 완료
	  * @Method 설명 :habit 페이지로 이동
	  * @param request
	  * @return ModelAndView
	  */
	
	public ModelAndView habitPage(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		mav.setView("habit/habitPage");

		return mav;
	}

	/**
	  * @Method Name : habitRegistration
	  * @작성일 : 2020. 5. 7.
	  * @작성자 : 정상훈
	  * @변경이력 : 완료
	  * @Method 설명 : habit 등록 페이지로 이동
	  * @param request
	  * @return ModelAndView
	  */
	
	public ModelAndView habitRegistration(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		mav.setView("habit/habitRegistration");

		return mav;
	}

	/**
	  * @Method Name : habitRemove
	  * @작성일 : 2020. 5. 7.
	  * @작성자 : 정상훈
	  * @변경이력 : 완료
	  * @Method 설명 : habit 목록 및 삭제 페이지로 이동 / 현재 유저의 habit List를 뿌려준다.
	  * @param request
	  * @return ModelAndView
	  */
	
	public ModelAndView habitRemove(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		Member m = (Member) request.getSession().getAttribute("loginInfo");

		mav.setView("habit/habitRemove");
		mav.addObject("hList", hs.selectHabitList(m));

		return mav;
	}

	/**
	  * @Method Name : deleteHabit
	  * @작성일 : 2020. 5. 7.
	  * @작성자 : 정상훈
	  * @변경이력 : 완료
	  * @Method 설명 : 유저가 선택한 현재 진행중인 habit 목표를 삭제한다.
	  * @param request
	  * @return ModelAndView
	  */
	
	public ModelAndView deleteHabit(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		int res = 0;
		Member m = (Member) request.getSession().getAttribute("loginInfo");
		res = hs.deleteHabit(Integer.parseInt(request.getParameter("hNumber")));
		
		if(res >= 1) {
			mav.setView("common/result");
			mav.addObject("url", "/up/habit/habitremove.do");
			mav.addObject("alertMsg", "습관 삭제를 완료하였습니다.");
		}else {
			mav.addObject("alertMsg", "습관 삭제에 실패하였습니다.");
			mav.addObject("back", "back");
			mav.setView("common/result");
		}
		
		// mav.addObject("result", hm.deleteHabit(request.get, m));
		return mav;
	}

	/**
	  * @Method Name : habitRegistrationImple
	  * @작성일 : 2020. 5. 7.
	  * @작성자 : 정상훈
	  * @변경이력 : 완료
	  * @Method 설명 : 유저가 입력한 habit 정보를 Habit DB에 insert 해준다.
	  * @param request
	  * @return ModelAndView
	  */
	
	public ModelAndView habitRegistrationImple(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		Member m = (Member) request.getSession().getAttribute("loginInfo");

		int res = 0;

		Habit h = new Habit();
		int categoryCode = 0;
		h.sethSubcategory(request.getParameter("titleName"));
		h.sethSelectday(request.getParameter("selectDay"));


		Date toDate = Date.valueOf(request.getParameter("searchStartDate"));
		Date fromDate = Date.valueOf(request.getParameter("searchEndDate"));

		h.sethStartDate(toDate);
		h.sethEndDate(fromDate);

		h.sethMoney(Integer.parseInt(request.getParameter("goalMoney")));
		h.sethTime(Integer.parseInt(request.getParameter("goalTime")));
		if (request.getParameter("selectCategory").equals("금연")) {
			categoryCode = 1;
		} else if (request.getParameter("selectCategory").equals("금주")) {
			categoryCode = 2;
		} else if (request.getParameter("selectCategory").equals("독서")) {
			categoryCode = 3;
		} else {
			categoryCode = 4;
		}

		h.setcCode(categoryCode);
		h.setmId(m.getUserId());

		res = hs.insertNewHabit(h);
		if (res >= 1) {
			mav.setView("common/result");
			mav.addObject("url", "/up/habit/habitpage.do");
			mav.addObject("alertMsg", "습관등록을 완료하였습니다.");
		} else {
			mav.addObject("alertMsg", "습관등록에 실패하였습니다.");
			mav.addObject("back", "back");
			mav.setView("common/result");
		}

		// mav.addObject("result", hm.deleteHabit(request.get, m));
		return mav;
	}
	
	/**
	  * @Method Name : finishPopup
	  * @작성일 : 2020. 5. 8.
	  * @작성자 : 정상훈
	  * @변경이력 : 완성
	  * @Method 설명 : 습관 100퍼센트달성시 띄워주는 팝업창
	  * @param request
	  * @return ModelAndView
	  */
	
	public ModelAndView finishPopup(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		mav.setView("habit/finishPopup");
		MemberService ms = new MemberService();
		//명언 문자열 가져오기
		List<String> list = ms.wise();
		int random = (int) (Math.random()*list.size());
		mav.addObject("wise",list.get(random));	
		
		return mav;
	}
}
