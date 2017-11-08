package controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import dao.MemberDAO;
import dto.Member;
import service.SHAEncoding;

@Controller
public class TestController2 {
	@Autowired
	private MemberDAO userDao;

	@RequestMapping("/test2.do")
	public String TestGo(Model model) {
		return "home2";
	}

	@RequestMapping("/loginPage")
	public String loginPage(@RequestParam("email") String email, @RequestParam("passwd") String passwd) {
		/* Member member = new Member(); */

		return "loginPage";
	}

	@RequestMapping(value = "/insertUser", method = RequestMethod.POST)
	public String insertUser(@RequestParam("email") String email, @RequestParam("passwd") String passwd) {
		SHAEncoding sha = new SHAEncoding();
		Member member = new Member();

		member.setEmail(email);
		member.setPassword(sha.getPassword(passwd));
		member.setSalt(sha.getSalt());
		int result = userDao.insertUser(member);
		System.out.println("result ===>" + result);
		/* logger.info("result ===> {}", result); */
		return "loginPage";
	}

}
