package up.mypage.controller;

import javax.servlet.http.HttpServletRequest;

import common.frontController.Controller;
import up.member.model.vo.Member;
import up.mypage.model.service.TitleUrlService;
import up.mypage.model.vo.Title;

public class TitleUrlController implements Controller{
	
	TitleUrlService us = new TitleUrlService();
	
	/**
	 * @Method Name : getTitleURL
	 * @작성일 : 2020. 5. 9.
	 * @작성자 : 배상엽
	 * @변경이력 : 
	 * @Method 설명 : 유저의 대표타이틀의 URL을 가져온다.
	 * @param request
	 */

	public void getTitleURL(HttpServletRequest request) {
		Member m = (Member) request.getSession().getAttribute("loginInfo");
		Title title = us.getTitleURL(m);
		System.out.println(title.getTURL());
		request.getSession().setAttribute("representationTitleURL", title);

	}

}
