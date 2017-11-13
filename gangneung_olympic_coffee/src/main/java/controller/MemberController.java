package controller;

import java.util.List;

import javax.annotation.Resource;
import javax.mail.Session;
import javax.servlet.http.HttpSession;

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
import dao.NationDAO;
import dto.Member;
import sercurity.ShaEncoder;


@Controller
@SessionAttributes({"memberSession"})
public class MemberController {
	
	@Autowired
	private MemberDAO memberDAO;
	
	@Autowired
	private NationDAO nationDAO;
	
	@Resource(name = "shaEncoder")
	private ShaEncoder encoder;
	
	@RequestMapping("/member.do")
	public String TestGo(Model model) {
		return "member";
	}

	@RequestMapping(value = "/loginPage.do", method = RequestMethod.POST)
	public String loginPage(@RequestParam String email, @RequestParam String password, Model model) {
		Member member = memberDAO.selectMemberByEmail(email);
		System.out.println(member);
		if (member == null) {// ID가 없는경우
			System.out.println("없는 회원입니다.");	// test
			throw new UsernameNotFoundException(email + "는 없는 회원입니다.");
		}else {
			if(encoder.matches(password, member.getPassword())) {
				System.out.println("성공");
				model.addAttribute("memberSession", member);
				return "memberLoginSuccess";
			}else {
				System.out.println("비밀번호 MissMatch");
				return "member";
			}
		}
		
	}

	//회원가입
	@RequestMapping(value = "/insertMember.do", method = RequestMethod.POST)
	public String insertMember(@ModelAttribute Member member, Model model) {
		String uri = null;
		System.out.println("회원가입 들어오는지 확인");//test
		member.setLanCode(1);
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
	public String selectMember(Model model) {
		List<Member> list = memberDAO.selectMember();
		model.addAttribute("memberList",list);
		return "memberList";
	}
	
	//회원탈퇴(관리자)
	@RequestMapping(value = "/deleteMemberByManager.do", method = RequestMethod.POST)
	public String deleteMemberByManager(@RequestParam String email, Model model) {
		System.out.println(email);//test
		memberDAO.deleteMemberByManager(email);
		return "memberList";
	}
	
	//회원탈퇴(자발적인) - 자발적이라 썼지만 우선 admin으로도 못함...
	@RequestMapping(value = "/deleteMember.do", method = RequestMethod.POST)
	public String deleteMember(@RequestParam String password, @ModelAttribute Member memberSession) {
		//select 구문을 이용해서 password만 가지고오는 dao를 하나 제작!
		//그 다음 DB에서 암호를 가지고 왔다고 가정함!!
		System.out.println("자발적 탈퇴 들어옴");//test
		String passwordDB = memberDAO.selectMemberByPassword(memberSession.getEmail());
		System.out.println(passwordDB);//test
		if (encoder.matches(password, passwordDB)) {
			System.out.println("삭제 완료");	// test
			memberDAO.deleteMember(memberSession.getEmail());
			return "memberDelete";//추후 index로 바꿔줄 것
		} else {
			System.out.println("삭제 실패");
			return "member";
		}
	}
	
	//회원정보 수정
	@RequestMapping(value = "/updateMember.do", method = RequestMethod.POST)
	public String updateMember(@RequestParam String passwordBefore, @RequestParam String password, @ModelAttribute Member memberSession) {
		String passwordDB = memberDAO.selectMemberByPassword(memberSession.getEmail());
		if(encoder.matches(passwordBefore, passwordDB)) {
			if(password==null) {
				memberDAO.updateMember(memberSession);
				return "memberList";
			}else if(password.length()>=8) {
				memberSession.setPassword(encoder.encoding(memberSession.getPassword()));
				memberDAO.updateMember(memberSession);
				return "memberList";
			}else {
				System.out.println("Inner 실패");
				return "member";
			}
		}else {
		System.out.println("Outter 실패 - 이전 비밀번호가 틀림");
		return "member";
		}
		
	}
}
