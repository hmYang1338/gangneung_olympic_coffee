package controller;

import java.util.List;
import java.util.Locale;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.i18n.SessionLocaleResolver;

import dao.ProductFavoriteDAO;
import dao.LanguageDAO;
import dao.ManagerDAO;
import dao.MemberDAO;
import dao.NationDAO;
import dao.ProductRatingDAO;
import dao.StoreDAO;
import dao.StoreFavoriteDAO;
import dao.StoreRatingDAO;
import dto.ProductFavorite;
import dto.Language;
import dto.Manager;
import dto.Member;
import dto.ProductRating;
import dto.StoreFavorite;
import dto.StoreRating;
import security.ShaEncoder;


@Controller
@SessionAttributes({"memberSession","managerSession","adminSession","lanCode"})
public class MemberController {
	@Autowired
	private MemberDAO memberDAO;
	
	@Autowired
	private ManagerDAO managerDAO;
	
	@Autowired
	private NationDAO nationDAO;
	
	@Autowired
	private LanguageDAO languageDAO;

	@Autowired
	private ProductRatingDAO productRatingDAO;
	
	@Autowired
	private StoreRatingDAO storeRatingDAO;
	
	@Autowired
	private ProductFavoriteDAO productFavoriteDAO;
	
	@Autowired
	private StoreFavoriteDAO storeFavoriteDAO;
	
	@Autowired 
	private SessionLocaleResolver localeResolver; 
	
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
		Manager manager = managerDAO.selectManagerByEmail(email);
		int major = managerDAO.selectManagerByMajor(email);
		System.out.println("---major : "+major);//test
		System.out.println(member);//test
		System.out.println(manager);//test
		model.addAttribute("nationList",nationDAO.selectNation());
		model.addAttribute("languageList",languageDAO.selectLanguage());
		if (member == null) {// ID가 없는경우
			if(manager == null) {
				System.out.println("없는 회원입니다.");	// test
				throw new UsernameNotFoundException(email + "는 없는 회원입니다.");
			}else {
				if(encoder.matches(password, manager.getPassword())) {
					if(major == 0) {
						System.out.println("관리자님 입장");//test
						model.addAttribute("adminSession",manager);
						return "redirect:index.do";
					}else {
						System.out.println(manager.getId()+"Manager님 입장");//test
						model.addAttribute("managerSession",manager);
						return "redirect:index.do";
					}
				}else {
					System.out.println("Error");//test
				}
			}
		}else {
			if(encoder.matches(password, member.getPassword())) {
				System.out.println("성공");//test
				memberDAO.updateMemberByLastDate(email);
				localeResolver.setDefaultLocale(Language.LANGUAGE_VALUE[member.getLanCode()]);
				model.addAttribute("memberSession", member);
				return "redirect:index.do";
			}else {
				System.out.println("비밀번호 MissMatch");
				return "forward:member/memberJoin.jsp";
			}
		}
		return "redirect:index.do";
	}
	/**
	 * Logout시에 session 제거
	 * @param status
	 * @return Main Page 이동
	 */
	@RequestMapping("/logout.do")
	public String logout(SessionStatus status) {
		status.setComplete();
		return "redirect:index.do";
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
			uri = "redirect:index.do";
		}
		return uri;
	}
	
	//회원리스트
	@RequestMapping(value = "/selectMemberAll.do", method = RequestMethod.GET)
	public String selectMember(Model model) {
		List<Member> list = memberDAO.selectMember();
		model.addAttribute("memberList",list);
		return "member/memberList";
	}
	
	//회원탈퇴(관리자)
	@RequestMapping(value = "/deleteMemberByManager.do", method = RequestMethod.POST)
	public String deleteMemberByManager(@RequestParam String email, Model model) {
		System.out.println(email);//test
		int result = memberDAO.deleteMemberByManager(email);
		if(result == 1) {
			model.addAttribute("msg", "삭제 성공."); 
			model.addAttribute("url","index.do");
		return "redirect:message.jsp";
		}else {
			model.addAttribute("msg", "삭제 실패."); 
			model.addAttribute("url","index.do");
			return "redirect:";
		}
	}
	
	//회원탈퇴(자발적인) - 자발적이라 썼지만 우선 admin으로도 못함...
	@RequestMapping(value = "/deleteMember.do", method = RequestMethod.POST)
	public String deleteMember(@RequestParam String passwordBefore, @ModelAttribute Member memberSession, SessionStatus status, Model model) {
		//select 구문을 이용해서 password만 가지고오는 dao를 하나 제작!
		//그 다음 DB에서 암호를 가지고 왔다고 가정함!!
		System.out.println("자발적 탈퇴 들어옴");//test
		String passwordDB = memberDAO.selectMemberByPassword(memberSession.getEmail());
		System.out.println(passwordDB);//test
		if (encoder.matches(passwordBefore, passwordDB)) {
			System.out.println("삭제 완료");	// test
			model.addAttribute("msg", "삭제되었습니다."); 
			model.addAttribute("url","index.do");
			memberDAO.deleteMember(memberSession.getEmail());
			status.setComplete();
			return "redirect:message.jsp";//추후 index로 바꿔줄 것
		} else {
			model.addAttribute("msg", "삭제가 실패되었습니다."); 
			model.addAttribute("url","index.do");
			System.out.println("삭제 실패");
			return "redirect:";
		}
	}
	//회원정보 수정
	@RequestMapping(value = "/updateMember.do", method = RequestMethod.POST)
	public String updateMember(@RequestParam String passwordBefore, @RequestParam String password, @ModelAttribute Member memberSession) {
		String passwordDB = memberDAO.selectMemberByPassword(memberSession.getEmail());
		if(encoder.matches(passwordBefore, passwordDB)) {
			if(password==null||password.trim().equals("")) {
				memberSession.setPassword(encoder.encoding(passwordBefore));
				memberDAO.updateMember(memberSession);
				localeResolver.setDefaultLocale(Language.LANGUAGE_VALUE[memberSession.getLanCode()]);
				return "redirect:index.do";
			}else if(password.length()>=8) {
				memberSession.setPassword(encoder.encoding(memberSession.getPassword()));
				memberDAO.updateMember(memberSession);
				localeResolver.setDefaultLocale(Language.LANGUAGE_VALUE[memberSession.getLanCode()]);
				return "redirect:index.do";
			}else {
				System.out.println("Inner 실패");
				return "forward:member/memberJoin.jsp";
			}
		}else {
		System.out.println("Outter 실패 - 이전 비밀번호가 틀림");
		return "forward:member/memberJoin.jsp";
		}
		
	}
	
	//StoreRatingInsert
	@RequestMapping("/storeRatingBtn.do")
	public String storeRatingInsertBtn(@ModelAttribute Member memberSession, Model model) {
		return "storeRating";
	}

	
	@RequestMapping("/insertStoreRating.do")
	public String insertStoreRating(@ModelAttribute("memberSession") Member memberSession, @ModelAttribute StoreRating storeRating) {
		System.out.println("storeRating 들어옴");//test
		localeResolver.setDefaultLocale(Language.LANGUAGE_VALUE[memberSession.getLanCode()]);
		System.out.println(memberSession);//test
		int maxNum =storeRatingDAO.selectStoreRaingByRatNum(memberSession.getEmail());
		System.out.println(maxNum);//test
		storeRating.setEmail(memberSession.getEmail());
		storeRating.setRatNum(++maxNum);
		storeRating.setLanCode(memberSession.getLanCode());
		System.out.println(storeRating);//test
		if(storeRatingDAO.insertStoreRating(storeRating)==1) {
			System.out.println("성공하였습니다.");
		} else {
			System.out.println("실패하였습니다.");
		}
		return "redirect:index.do";
	}
	
	//productRatingInsert
	@RequestMapping("/productRatingBtn.do")
	public String productRatingInsertBtn(@ModelAttribute Member memberSession, Model model) {
		return "productRating";
	}
	
	@RequestMapping("/insertProductRating.do")
	public String insertProductRating(@ModelAttribute("memberSession") Member memberSession, @ModelAttribute ProductRating productRating) {
		localeResolver.setDefaultLocale(Language.LANGUAGE_VALUE[memberSession.getLanCode()]);
		int maxNum = productRatingDAO.selectProductRaingByRatNum(memberSession.getEmail());
		System.out.println(maxNum);
		productRating.setRatNum(++maxNum);
		productRating.setEmail(memberSession.getEmail());
		productRating.setLanCode(memberSession.getLanCode());
		System.out.println(productRating);
		if(productRatingDAO.insertProductRating(productRating)==1) {
			System.out.println("성공하였습니다.");
		}else {
			System.out.println("실패하였습니다.");
		}
		return "redirect:index.do";
	}
	
	//ProductFavorite Test
	@RequestMapping("/productFavoriteBtn.do")
	public String favoriteInsertBtn(@ModelAttribute Member memberSession, Model model) {
		return "productFavorite";
	}
	
	@RequestMapping("/insertProductFavorite.do")
	public String insertFavorite(@ModelAttribute("memberSession") Member memberSession, @ModelAttribute ProductFavorite productFavorite) {
		System.out.println(productFavorite);
		localeResolver.setDefaultLocale(Language.LANGUAGE_VALUE[memberSession.getLanCode()]);
		int maxNum = productFavoriteDAO.selectProductFavoriteByNum(memberSession.getEmail());
		System.out.println(maxNum);
		productFavorite.setFavNum(++maxNum);
		productFavorite.setEmail(memberSession.getEmail());
		productFavorite.setLanCode(memberSession.getLanCode());
		System.out.println("Result" + productFavorite);
		if(productFavoriteDAO.insertProductFavorite(productFavorite)==1) {
			System.out.println("성공하였습니다.");
		}else {
			System.out.println("실패하였습니다.");
		}
		return "redirect:index.do";
	}
	
	
	//StoreFavorite
	@RequestMapping("/storeFavoriteBtn.do")
	public String storeFavoriteInsertBtn(@ModelAttribute Member memberSession, Model model) {
		return "storeFavorite";
	}
	
	@RequestMapping(value="/insertStoreFavorite.do",produces = "application/json; charset=utf8")
	public @ResponseBody String insertStoreFavorite(@ModelAttribute("memberSession") Member memberSession, @RequestParam("id") int id) {
		localeResolver.setDefaultLocale(Language.LANGUAGE_VALUE[memberSession.getLanCode()]);
		
		int maxNum = storeFavoriteDAO.selectStoreFavoriteByNum(memberSession.getEmail());
		StoreFavorite storeFavorite = new StoreFavorite();
		
		storeFavorite.setId(id);
		storeFavorite.setFavNum(++maxNum);
		storeFavorite.setEmail(memberSession.getEmail());
		storeFavorite.setLanCode(memberSession.getLanCode());
		
		String[][] resultArr = {{"","ADD failure!","즐겨찾기 추가 실패","最喜欢的失败"},
				{"","ADD Success!","즐겨찾기 추가 성공","书签成功"}};
		
		return resultArr[storeFavoriteDAO.insertStoreFavorite(storeFavorite)][memberSession.getLanCode()];
	}
}
