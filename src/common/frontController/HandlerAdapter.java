package common.frontController;

import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;

import javax.servlet.http.HttpServletRequest;

public class HandlerAdapter {

	public ModelAndView excute(Controller ctr, String methodName, HttpServletRequest request) {
		ModelAndView mav = null;
		
//		Object클래스로 부터 상속받은 getClass 메서드를 사용해서 해당 객체의
//		Class 객체를 반환받는다.
		
		Class<? extends Controller> c = ctr.getClass();
		try {
//			규약으로 모든 controller를 가지고 있는 클래스는 반환형으로 ModelAndView 해주며
//			HttpServletRequest를 매개변수를 갖는다.
//			클래스 CLASS 가 가지고 있는 getDeclareMethod()를 활용해서
//			이름이 methodName인 메서드 개체를 반환
			Method exMethod = c.getDeclaredMethod(methodName, HttpServletRequest.class);
			
//			실행하고 결과를 반환 받는다. 그리고 실행시켜준다.
			mav = (ModelAndView)exMethod.invoke(ctr, request);
			
		} catch (NoSuchMethodException e) {
			e.printStackTrace();
		} catch (SecurityException e) {
			e.printStackTrace();
		} catch (IllegalAccessException e) {
			e.printStackTrace();
		} catch (IllegalArgumentException e) {
			e.printStackTrace();
		} catch (InvocationTargetException e) {
			e.printStackTrace();
		}
		
		
		return mav;
	}
}
