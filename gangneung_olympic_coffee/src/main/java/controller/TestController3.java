package controller;


import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;


public class TestController3 {
	
	@RequestMapping("/test3.do")
	public String test3(Model model) {
		return "home3";
	}
}
