package controller;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import dao.MemberDAO;
import dto.Member;
import sercurity.ShaEncoder;


@Controller
@SessionAttributes({"member"})
public class TestController3 {
	
	@Autowired
	private MemberDAO memberDAO;
	
	@Resource(name = "shaEncoder")
	private ShaEncoder encoder;
	
	@RequestMapping("/test3.do")
	public String TestGo(Model model) {
//		List<Member> member = null;
//		model.addAttribute("member",member = memberDAO.selectAllMember());
//		System.out.println(member.toString());
		return "home3";
	}

	@RequestMapping(value = "/loginPage.do", method = RequestMethod.POST)
	public String loginPage(@RequestParam String email, @RequestParam String password, Model model) {
		Member member = memberDAO.selectMemberByEmail(email);
		System.out.println(member);
		if (member == null) {// ID가 없는경우
			System.out.println("없는 회원입니다.");	// test
			throw new UsernameNotFoundException(email + "는 없는 회원입니다.");
		} else if(encoder.matches(password, member.getPassword())) {
			System.out.println("성공?");
			member.setPassword(null);
			model.addAttribute("member", member);
		}
		return "memberLoginSuccess";
	}

	//회원가입
	@RequestMapping(value = "/insertMember.do", method = RequestMethod.POST)
	public String insertMember(@ModelAttribute Member member, Model model) {
		String uri = null;
		member.setPassword(encoder.encoding(member.getPassword()));
		int result = memberDAO.insertMember(member);
		if (result == 0) {
			System.out.println("error"); // test
		} else {
			System.out.println(result); // test
			uri = "test/memberinsertSuccess";
		}
		return uri;
	}
	
	//회원리스트
	@RequestMapping(value = "/selectMemberAll.do", method = RequestMethod.GET)
	public String selectMemberAll(Model model) {
		List<Member> list = memberDAO.selectMemberAll();
		model.addAttribute("memberList",list);
		return "memberList";
	}
	
	//회원탈퇴(자발적인) - 자발적이라 썼지만 우선 admin으로도 못함...
	@RequestMapping(value = "/deleteMember.do", method = RequestMethod.POST)
	public String deleteMember(@RequestParam String email, @RequestParam String password, Model model) {
		System.out.println("delete - 1");
		System.out.println(email+","+password);
		memberDAO.deleteMember(email);
		return "redirect:/";
	}
}
