package common.frontController;

import java.util.HashMap;

import common.exception.Status404;
import up.index.controller.IndexController;
import up.member.controller.MemberController;

public class HandlerMapping {

	private HashMap<String, Controller> list = null;

	public HandlerMapping() {
		list = new HashMap<String, Controller>();
		list.put("index", new IndexController());
		list.put("member", new MemberController());
	}

	public Controller getController(String[] uriArr) throws Status404 {
		Controller res = list.get(uriArr[2]);

//		현재 servlet이기 때문에 404로 예외를 명시해줬다.
		if (res == null) {
			throw new Status404("uri를 다시 확인해주세요");
		}

		return res;
	}

	public String getMethod(String[] uriArr) throws Status404 {
		String methodName = "";

		switch (uriArr[2]) {
		case "index":
			switch (uriArr[3]) {
			case "index.do":
				methodName = "index";
				break;
			default:
				throw new Status404("uri를 다시 확인 해주세요!");
			}
			break;
		case "member":
			switch (uriArr[3]) {
			case "login.do":
				methodName = "login";
				break;
			case "register.do":
				methodName = "register";
				break;
			case "forgotid.do":
				methodName = "forgotId";
				break;
			case "forgotpwd.do":
				methodName = "forgotPwd";
				break;
			case "emailcheck.do":
				methodName = "emailCheck";
				break;
			default:
				throw new Status404("uri를 다시 확인 해주세요!");
			}
			break;
		case "mypage":
			switch (uriArr[3]) {
			case "mypage.do":
				methodName = "myPage";
				break;
			}
			break;
		case "book":
			break;
		case "use":
			break;
		case "notice":
			switch (uriArr[3]) {
			case "notice.do":
				methodName = "notice";
				break;
			default:
				throw new Status404("uri를 다시 확인해주세요!");
			}
			break;
		default:
			throw new Status404("uri를 다시 확인해주세요!");
		}
		return methodName;
	}

}
