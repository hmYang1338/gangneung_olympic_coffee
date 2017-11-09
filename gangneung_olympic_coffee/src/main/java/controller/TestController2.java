package controller;

import java.util.Arrays;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import dao.MemberDAO;
import dto.Member;
import sercurity.PasswordEncoding;
import sercurity.SHAEncoding;
import sercurity.SHAPasswordEncoder;

@Controller
public class TestController2 {
	@Autowired
	private MemberDAO memberDao;

	@RequestMapping("/test2.do")
	public String TestGo(Model model) {
		return "home2";
	}

	@RequestMapping("/loginPage")
	public String loginPage(@RequestParam String email, @RequestParam String password) {
		Member member = memberDao.selectMemberByEmail(email);
		
		System.out.println(member);
		if (member == null) {// ID가 없는경우
			System.out.println("없는 회원입니다.");	// test
			throw new UsernameNotFoundException(email + "는 없는 회원입니다.");
		}
		
		SHAEncoding sha = new SHAEncoding();
		sha.setSalt(member.getSalt());
		if(sha.passwordEquals(member.getPassword(), password)) {
			System.out.println("??");
		}
		return "test/loginSuccess";
	}

	@RequestMapping(value = "/insertMember", method = RequestMethod.POST)
	public String insertMember(@RequestParam String email, @RequestParam String password) {
		SHAEncoding sha = new SHAEncoding();
		Member member = new Member();

		member.setEmail(email);
		member.setPassword(sha.getPassword(password));
		member.setSalt(sha.getSalt());
		System.out.println(sha.getSalt());
		System.out.println(Arrays.toString(sha.getSalt().getBytes()));
		int result = memberDao.insertMember(member);
		System.out.println("result ===>" + result);

		return "test/loginPage";
	}
}
