package controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class TestController2 {
		
	@RequestMapping("/test2.do")
	public String TestGo(Model model) {
		return"home2";
	}

}
