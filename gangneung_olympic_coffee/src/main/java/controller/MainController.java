package controller;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.i18n.SessionLocaleResolver;

import dto.Manager;
import dto.Member;
import dto.UserGPS;

@Controller
@SessionAttributes({"memberSession","managerSession","adminSession","lanCode"})
public class MainController {
	
	/**
	 * 스프링에서 기본적으로 지원하는 다국어 세션
	 */
	@Autowired 
	private SessionLocaleResolver localeResolver; 
	@Autowired 
	private MessageSource messageSource;

	/**
	 * 웹 페이지에 접근하면 현재 설정된 
	 * @param data
	 * @param request
	 * @return
	 */
	@RequestMapping("/index.do")
	public String TestGo(Model data,HttpServletRequest request) {
		String language = localeResolver.resolveLocale(request).getLanguage();
		String[] languageCode = {"","en","ko","zh"};
		for(int i = 1; i < languageCode.length;i++) {
			if(language.equals(languageCode[i])) {
				data.addAttribute("lanCode", i);
				System.out.println(i);
				break;
			}
		}
		return "index";
	}
	/**
	 * 현재 세션에 있는 권한을 점검합니다.
	 * @param memberSession
	 * @param managerSession
	 * @return int (0은 비로그인 1는 회원 2는 운영자 3은 관리자)
	 */
	@RequestMapping("/session.do")
	public @ResponseBody HashMap<String,Object> SessionConnected(HttpSession session) {
		HashMap<String,Object> map = new HashMap<>();
		try {
			Member member = (Member) session.getAttribute("memberSession");
			if (member.getEmail() != null && !member.getEmail().trim().equals("")) {
				map.put("authority", 1);
				map.put("email",member.getEmail());
				return map;
			}
		} catch (NullPointerException e) {
			map.put("authority", 0);
			map.put("email","");
		}
		try {
			Manager manager = (Manager) session.getAttribute("managerSession");
			if(manager.getEmail() != null && !manager.getEmail().trim().equals("")) {
				map.put("email",manager.getEmail());
				map.put("authority", 2);
				return map;
			}
		} catch (NullPointerException e) {
			map.put("authority", 0);
			map.put("email","");
		}
		
		try {
			Manager manager = (Manager) session.getAttribute("adminSession");
			if(manager.getEmail() != null && !manager.getEmail().trim().equals("")) {
				map.put("email",manager.getEmail());
				map.put("authority", 3);
				return map;
			}
		} catch (NullPointerException e) {
			map.put("authority", 0);
			map.put("email","");
		}
		return map;
	}
	
	@RequestMapping("/gps.do")
	public @ResponseBody UserGPS GpsReciver(@ModelAttribute UserGPS userGPS) {
		System.out.println(userGPS);
		return userGPS;
	}
	
}

