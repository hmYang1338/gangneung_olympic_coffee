package controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import dao.TestDAO;
import dto.Test;

@Controller
public class TestController {
	
	@Autowired
	private TestDAO testDAO;
	
	@RequestMapping("/test.do")
	public String TestGo(Model model) {
		List<Test> test = null;
		model.addAttribute("test",test = testDAO.selectAllTest());
		System.out.println(test.toString());
		return "home";
	}

}
