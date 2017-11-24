package controller;

import java.util.HashMap;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.LocaleResolver;
import org.springframework.web.servlet.i18n.SessionLocaleResolver;

import dao.ProductRatingDAO;
import dao.StoreDAO;
import dao.StoreRatingDAO;
import dto.Member;
import dto.ProductRating;
import dto.Store;
import dto.StoreRating;
import dto.UserGPS;

@Controller
@SessionAttributes({"memberSession","lanCode"})
public class TestController {
	
	
	@Autowired 
	private SessionLocaleResolver localeResolver; 
	@Autowired 
	private MessageSource messageSource;

	@RequestMapping("/test.do")
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
	
	@RequestMapping("/gps.do")
	public @ResponseBody UserGPS GpsReciver(@ModelAttribute UserGPS userGPS) {
		System.out.println(userGPS);
		return userGPS;
	}
	
}

