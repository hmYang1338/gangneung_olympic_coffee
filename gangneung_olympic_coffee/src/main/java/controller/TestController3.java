package controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import dao.NationDAO;
import dto.Nation;

@Controller
public class TestController3 {
	
	@Autowired
	private NationDAO nationDAO;
	
	@RequestMapping("/test3.do")
	public String TestGo(Model model) {
		return "home3";
	}

	@RequestMapping(value = "/selectNation.do", method = RequestMethod.POST)
	public String selectNation(@ModelAttribute Nation nation, Model model) {
		List<Nation> list = nationDAO.selectNation();
		model.addAttribute("nation",list);
		return "nationList";
	}
}
