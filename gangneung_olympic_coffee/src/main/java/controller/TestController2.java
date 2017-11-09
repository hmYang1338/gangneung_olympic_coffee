package controller;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import dao.ManagerDAO;
import dao.MemberDAO;
import dto.Manager;
import dto.Member;
import sercurity.ShaEncoder;

@Controller
public class TestController2 {
	
	@Autowired
	private MemberDAO memberDao;
	@Autowired
	private ManagerDAO managerDao;
	
	@Resource(name = "shaEncoder")
	private ShaEncoder encoder;
	
	@RequestMapping("/test2.do")
	public String TestGo(Model model) {
		return "home2";
	}

	@RequestMapping(value = "/loginPage.do", method = RequestMethod.POST)
	public String loginPage(@RequestParam String email, @RequestParam String password) {
		Member member = memberDao.selectMemberByEmail(email);
		System.out.println(member);
		if (member == null) {// ID가 없는경우
			System.out.println("없는 회원입니다.");	// test
			throw new UsernameNotFoundException(email + "는 없는 회원입니다.");
		}
		if(encoder.matches(password, member.getPassword())) {
			System.out.println("성공?");
		}
		return "test/loginSuccess";
	}

	@RequestMapping(value = "/insertMember.do", method = RequestMethod.POST)
	public String insertMember(@RequestParam String email, @RequestParam String password) {
		Member member = new Member();
		member.setEmail(email);
		member.setPassword(encoder.encoding(password));
		member.setSalt("423423");
		System.out.println(member);
		int result = memberDao.insertMember(member);
		return "test/loginPage";
	}
	
	@RequestMapping(value = "/insertManager", method = RequestMethod.POST)
	public String insertManager(@ModelAttribute Manager manager, Model data) {
		String uri = null;
		if (manager.getEmail() == null || manager.getEmail().trim().length() == 0 
				|| manager.getPassword() == null || manager.getPassword().trim().length() == 0
				|| manager.getName() == null || manager.getName().trim().length() == 0 
				|| manager.gettel() == null || manager.gettel().trim().length() == 0
				|| manager.getBirth() == null || manager.getBirth().trim().length() == 0
				|| manager.getLanCode() == 0 || manager.getId() == 0
				|| manager.getImgDir() == null || manager.getImgDir().trim().length() == 0
				|| manager.getMajor() == null || manager.getMajor().trim().length() == 0) {
			return "test/loginPage";
		}

		int result = managerDao.insertManager(manager);

		if (result == 0) {
			System.out.println("error"); // test
		} else {
			System.out.println(result); // test
			uri = "test/managerinsertSuccess";
		}
		return uri;
	}
}
