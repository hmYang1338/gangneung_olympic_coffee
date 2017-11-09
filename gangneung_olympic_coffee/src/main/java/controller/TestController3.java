package controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import dao.MemberDAO;
import dto.Member;


@Controller
public class TestController3 {
	
	@Autowired
	private MemberDAO memberDAO;
	
	@RequestMapping("/test3.do")
	public String TestGo(Model model) {
//		List<Member> member = null;
//		model.addAttribute("member",member = memberDAO.selectAllMember());
//		System.out.println(member.toString());
		return "home3";
	}

}
