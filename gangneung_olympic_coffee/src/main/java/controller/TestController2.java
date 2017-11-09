package controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import dao.MemberDAO;
import dto.Member;
import sercurity.SHAEncoding;

@Controller
public class TestController2 {
	@Autowired
	private MemberDAO memberDao;

	@RequestMapping("/test2.do")
	public String TestGo(Model model) {
		return "home2";
	}

	@RequestMapping("/loginPage")
	public String loginPage(@RequestParam("email") String email, @RequestParam("passwd") String passwd) {
		/* Member member = new Member(); */

		return "loginPage";
	}

	@RequestMapping(value = "/insertMember", method = RequestMethod.POST)
	public String insertMember(@RequestParam("email") String email, @RequestParam("passwd") String passwd) {
		SHAEncoding sha = new SHAEncoding();
		Member member = new Member();

		member.setEmail(email);
		member.setPassword(sha.getPassword(passwd));
		member.setSalt(sha.getSalt());
		int result = memberDao.insertMember(member);
		System.out.println("result ===>" + result);

		return "loginPage";
	}

}
