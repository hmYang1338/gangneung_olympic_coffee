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
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.i18n.SessionLocaleResolver;

import dao.LanguageDAO;
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
	
	@Autowired
	private LanguageDAO languageDAO;

	@Resource(name = "shaEncoder")
	private ShaEncoder encoder;

	/**
	 * 버튼 클릭시 로그인 페이지 이동
	 * @return 로그인 페이지
	 */
	@RequestMapping("/loginBtn.do")
	public String loginBtn(Model model) {
		model.addAttribute("languageList",languageDAO.selectLanguage());
		return "member/memberLogin";
	}
	
	@RequestMapping("/memberJoinBtn.do")
	public String memberJoinBtn(Model model) {
		model.addAttribute("nationList",nationDAO.selectNation());
		model.addAttribute("languageList",languageDAO.selectLanguage());
		return "member/memberJoin";
	}

	@RequestMapping("/memberUpdateBtn.do")
	public String memberUpdateBtn(@ModelAttribute Member memberSession, Model model) {
		model.addAttribute("nationList",nationDAO.selectNation());
		model.addAttribute("languageList",languageDAO.selectLanguage());
		return "member/memberUpdate";
	}
	
	@RequestMapping(value = "/loginPage.do", method = RequestMethod.POST)
	public String loginPage(@RequestParam String email, @RequestParam String password, Model model) {
		Member member = memberDAO.selectMemberByEmail(email);
		System.out.println(member);
		model.addAttribute("nationList",nationDAO.selectNation());
		model.addAttribute("languageList",languageDAO.selectLanguage());
		if (member == null) {// ID가 없는경우
			System.out.println("없는 회원입니다.");	// test
			throw new UsernameNotFoundException(email + "는 없는 회원입니다.");
		}else {
			if(encoder.matches(password, member.getPassword())) {
				System.out.println("성공");
				memberDAO.updateMemberByLastDate(email);
				model.addAttribute("memberSession", member);
				return "redirect:test.do";
			}else {
				System.out.println("비밀번호 MissMatch");
				return "forward:member/memberJoin.jsp";
			}
		}
	}
	/**
	 * Logout시에 session 제거
	 * @param status
	 * @return Main Page 이동
	 */
	@RequestMapping("/logout.do")
	public String logout(SessionStatus status) {
		status.setComplete();
		return "redirect:test.do";
	}

	/**
	 * 회원가입
	 * @param member
	 * @param model
	 * @return Main Page 이동
	 */
	@RequestMapping(value = "/insertMember.do", method = RequestMethod.POST)
	public String insertMember(@ModelAttribute Member member, Model model) {
		String uri = null;
		member.setPassword(encoder.encoding(member.getPassword()));
		int result = memberDAO.insertMember(member);
		if (result == 0) {
			System.out.println("error"); // test
		} else {
			uri = "redirect:test.do";
		}
		return uri;
	}
	
	//회원리스트
	@RequestMapping(value = "/selectMemberAll.do")
	public String selectMember(Model model) {
		List<Member> list = memberDAO.selectMember();
		model.addAttribute("memberList",list);
		return "forward:memeber/memberList.jsp";
	}
	
	//회원탈퇴(관리자)
	@RequestMapping(value = "/deleteMemberByManager.do", method = RequestMethod.POST)
	public String deleteMemberByManager(@RequestParam String email, Model model) {
		System.out.println(email);//test
		memberDAO.deleteMemberByManager(email);
		return "forward:member/memberList.jsp";
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
			return "forward:member/memberDelete.jsp";//추후 index로 바꿔줄 것
		} else {
			System.out.println("삭제 실패");
			return "forward:member/memberJoin.jsp";
		}
	}
	
	//회원정보 수정
	@RequestMapping(value = "/updateMember.do", method = RequestMethod.POST)
	public String updateMember(@RequestParam String passwordBefore, @RequestParam String password, @ModelAttribute Member memberSession) {
		String passwordDB = memberDAO.selectMemberByPassword(memberSession.getEmail());
		if(encoder.matches(passwordBefore, passwordDB)) {
			if(password==null) {
				memberDAO.updateMember(memberSession);
				return "forward:member/memberList.jsp";
			}else if(password.length()>=8) {
				memberSession.setPassword(encoder.encoding(memberSession.getPassword()));
				memberDAO.updateMember(memberSession);
				return "forward:member/memberList.jsp";
			}else {
				System.out.println("Inner 실패");
				return "forward:member/memberJoin.jsp";
			}
		}else {
		System.out.println("Outter 실패 - 이전 비밀번호가 틀림");
		return "forward:member/memberJoin.jsp";
		}
		
	}
}
