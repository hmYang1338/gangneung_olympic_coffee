package controller;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import dao.LanguageDAO;
import dao.ManagerDAO;
import dao.ReportingDAO;
import dao.StoreDAO;
import dto.Manager;
import dto.ManagerStoreJOIN;
import dto.Reporting;
import dto.Store;
import security.ShaEncoder;

@Controller
@SessionAttributes({ "error", "resultContent", "list","managerSession","adminSession","lanCode" })
public class ManagerController {
	@Autowired
	private StoreDAO storeDAO;
	@Autowired
	private ManagerDAO managerDAO;
	@Autowired
	private ReportingDAO reportingDAO;
	@Autowired
	private LanguageDAO languageDAO;
	
	@Resource(name = "shaEncoder")
	private ShaEncoder encoder;

	
	/**
	 * 관리자가 관리하는 창을 띄움
	 * @return
	 */
	@RequestMapping(value="/showManage.do")
	public String showManage(@ModelAttribute("adminSession") Manager adminSession) {
		if(adminSession.getEmail()!=null && adminSession.getEmail().trim().length()!=0) {
			return "manager/showManage";
		} else {
			return "test/error";
		}
	}
	@RequestMapping(value="/showManagerManage.do")
	public String showManagerManage(@ModelAttribute("adminSession") Manager adminSession) {
		if(adminSession.getEmail()!=null && adminSession.getEmail().trim().length()!=0) {
			return "manager/managerManage";
		} else {
			return "test/error";
		}
	}
	@RequestMapping(value="/showStoreManage.do")
	public String showStoreManage(@ModelAttribute("adminSession") Manager adminSession) {
		if(adminSession.getEmail()!=null && adminSession.getEmail().trim().length()!=0) {
			return "manager/storeManage";
		} else {
			return "test/error";
		}
	}
	@RequestMapping(value="/showReportManage.do")
	public String showReportManage(@ModelAttribute("adminSession") Manager adminSession) {
		if(adminSession.getEmail()!=null && adminSession.getEmail().trim().length()!=0) {
			return "manager/reportManage";
		} else {
			return "test/error";
		}
	}
	
	/**
	 * 운영자가 관리하는 창을 띄움
	 */
	@RequestMapping(value="/showManager.do")
	public String showManager(@ModelAttribute("managerSession") Manager managerSession) {
		return "manager/showManager";
	}
	@RequestMapping(value = "/showMyManage.do")
	public String myManage(@ModelAttribute("managerSession") Manager managerSession, Model model) {
		model.addAttribute("myManagerList", managerDAO.selectManagerByEmail(managerSession.getEmail()));
		return "manager/showMyManage";
	}
	@RequestMapping(value="/showMyStoreManage.do")
	public String showMyStoreManager(@ModelAttribute("managerSession") Manager managerSession, Model model) {
		model.addAttribute("myManagerList", managerDAO.selectManagerByEmail(managerSession.getEmail()));
		return "manager/myStoreManage";
	}
	
	@RequestMapping(value="/selectMyStore.do")
	public String selectMyStore(@ModelAttribute("managerSession") Manager managerSession, Model model) {
		model.addAttribute("myStoreList", managerDAO.selectOneManagerDetail(managerSession.getEmail()));
		return "manager/managerDetail";
	}
	
	
	/**
	 * (폼)운영자 계정 생성하는 폼
	 * 
	 * @return
	 */
	@RequestMapping(value = "/insertForm.do")
	public String showInsertForm(@ModelAttribute("adminSession") Manager adminSession, Model model) {
		model.addAttribute("languageList", languageDAO.selectLanguage());
		return "manager/managerInsert";
	}

	/**
	 * (기능)운영자 계정 생성
	 * 
	 * @param manager
	 * @return
	 */
	@RequestMapping(value = "/insertManager.do", method = RequestMethod.POST)
	public String insertManager(@ModelAttribute Manager manager, Model data) {
		String uri = null;
		if (manager.getEmail() == null || manager.getEmail().trim().length() == 0 || manager.getPassword() == null
				|| manager.getPassword().trim().length() == 0 || manager.getName() == null
				|| manager.getName().trim().length() == 0 || manager.gettel() == null
				|| manager.gettel().trim().length() == 0 || manager.getBirth() == null
				|| manager.getBirth().trim().length() == 0) { // 계정 생성시 빈칸이 있는지 확인
			return "test/loginPage"; // 빈칸 있을시 이동하는 페이지 // 추후 시스템 운영에 맞게 수정
		}
		manager.setPassword(encoder.encoding(manager.getPassword())); // 비밀번호암호화
		int result = managerDAO.insertManager(manager);
		if (result == 0) {
			System.out.println("error"); // test//계정 생성 실패시 이동하는 페이지 // 추후 시스템 운영에 맞게 수정
			uri = "test/error";
		} else {
			uri = "redirect:index.do"; // 계정 생성시 이동하는 페이지 // 추후 시스템 운영에 맞게 수정
		}
		return uri;
	}

	/**
	 * (기능)전체 운영자 계정 조회 (Ajax)
	 * 
	 * @param data
	 * @return
	 */
	@RequestMapping(value = "/listAjax.do")
	public String listAjax(@ModelAttribute Manager manager, Model data) {
		String url = "test/error";
		data.addAttribute("list", managerDAO.selectManagerAll());
		url = "manager/managerList"; // 계정 생성시 이동하는 페이지 // 추후 시스템 운영에 맞게 수정
		return url;
	}

	/**
	 * (기능)전체 운영자 계정 조회 (페이지 전환)
	 * 
	 * @param data
	 * @return
	 */
	@RequestMapping(value = "/selectAllManager.do")
	public @ResponseBody List<Manager> selectAllManager(@ModelAttribute("adminSession") Manager adminSession, Model data) {
		if(adminSession.getEmail()!=null && adminSession.getEmail().trim().length()!=0) {
			return managerDAO.selectManagerAll();
		} else {
			return null;
		}
		/*String url = "test/error";
		data.addAttribute("list", managerDAO.selectManagerAll());
		url = "test/managerList"; // 계정 생성시 이동하는 페이지 // 추후 시스템 운영에 맞게 수정
*/		
	}

	/**
	 * (기능)해당 운영자 계정 상세 조회 - managerList에서 email 선택하면 해당 email에 대한 상세 내용을
	 * 조회(managerDetail.jsp로 이동) -
	 * 
	 * @param email
	 * @param data
	 * @return
	 */
	@RequestMapping(value = "/detail.do/{email}.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String read(@PathVariable String email, Model data) {
		if (email == null) {
			return "test/managerList";
		}
		String url = "test/error";
		ManagerStoreJOIN managerstore = null;
		managerstore = managerDAO.selectOneManagerDetail(email);
		
		if (managerstore == null) {
			data.addAttribute("error", "해당 게시글이 존재하지 않습니다");
		} else {
			data.addAttribute("resultContent", managerstore);
			managerstore.setEmail(email);
			url = "manager/managerDetail";
		}
		return url;
	}

	@RequestMapping(value = "/managerSelectByEmail.do", method = { RequestMethod.GET, RequestMethod.POST })
	public @ResponseBody ManagerStoreJOIN read2(@RequestParam int lanCode, @RequestParam String email) {
		return managerDAO.selectOneManagerDetail(lanCode, email);
	}
	
	/**
	 * (폼)운영자 계정 수정하는 폼
	 * 
	 * @param email
	 * @param data
	 * @return
	 */
	@RequestMapping(value = "/updateForm.do", method = RequestMethod.POST)
	public String showUpdateForm(@RequestParam String email, Model data) {
		String url = "test/error";
		if (email == null) {
			return url;
		}
		ManagerStoreJOIN managerstore = null;
		managerstore = managerDAO.selectOneManagerDetail(email);
		managerstore.setEmail(email);

		data.addAttribute("resultContent", managerstore);
		url = "test/managerUpdate";
		return url;
	}

	/**
	 * (기능)운영자 계정 수정
	 * 
	 * @param managerstore
	 * @param data
	 * @return
	 */
	@RequestMapping(value = "/updateManager.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String update(@ModelAttribute("managerSession") Manager managerSession, @RequestParam String email, @RequestParam String tel, Model data) {
		String url = null;
		int result = managerDAO.updateManager(email, tel);
		if (result == 0) {
			url = "test/error";
		} else {
			url = "home2";
		}
		return url;
	}

	/**
	 * (기능)운영자 계정 삭제
	 * 
	 * @param email
	 * @param data
	 * @return
	 */
	@RequestMapping(value = "/deleteManager.do", method = RequestMethod.POST)
	public String delete(@ModelAttribute("adminSession") Manager adminSession, @RequestParam String email, Model model) {
		if(adminSession != null && adminSession.getEmail().trim().length()!=0) {
			System.out.println(adminSession + "Test1");
			int result = managerDAO.deleteManager(email);
			System.out.println("Test2" + result);
			if(result == 1) {
				model.addAttribute("msg", "삭제 성공."); 
				model.addAttribute("url","index.do");
				return "redirect:message.jsp";
			}else {
				model.addAttribute("msg", "삭제 실패."); 
				model.addAttribute("url","index.do");
				return "redirect:";
			}
		}else {
			return null;//처리할 것
		}
	}

	/////////////////////////////////////////////////////////////////////////////////
	/**
	 * (폼)운영자 비밀번호 수정 폼
	 * 
	 * @return
	 */
	@RequestMapping(value = "/updatePasswordForm.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String showUpdatePasswordForm(@ModelAttribute("managerSession") Manager managerSession, Model data) {
		data.addAttribute("managerInfo", managerDAO.selectManagerByEmail(managerSession.getEmail()));
		return "manager/managerupdatePassword";
	}

	/**
	 * (기능)운영자가 자신의 비밀번호를 수정
	 * @param manager
	 * @param now_password
	 * @param ch_password
	 * @param data
	 * @return
	 */
	@RequestMapping(value = "/updatePassword.do", method=RequestMethod.POST)
	public String updatePassword(@ModelAttribute("managerSession") Manager managerSession, @RequestParam String now_password, 
								 @RequestParam String ch_password, Model data) {
		String url = null;
		String passwordDB = managerDAO.selectOneManagerByEmail(managerSession.getEmail());
		if(encoder.matches(now_password, passwordDB)) { //현재 비밀번호가 다르면 오류
			if(ch_password==null) {	// 변경할 패스워드가 null이라면
				url = "test/error";		// 아무런 변화없이 home2로 이동
			} else if(ch_password.length()>=8) {	// 변경할 패스워드가 8자리 이상이라면
				managerDAO.updatePassword(managerSession.getEmail(), encoder.encoding(ch_password));	// 패스워드 바꾸고
				url = "redirect:index.do";		// home2로 이동
			} else {
				url = "test/error";
			}
		}
		return url;
	}
	
	/////////////////////////////////////////////////////////////////////////////////
	/* 관리자_카페 통합 관리 */
	/**
	 * (기능)카페 정보 조회
	 * 
	 * @param data
	 * @return
	 */
	@RequestMapping(value = "/selectAllStore.do")
	public String selectAllStore(@ModelAttribute("adminSession")Manager adminSession, Model data) {
		String url = "test/error";
		data.addAttribute("list", storeDAO.getStoreSelectMap(1));
		url = "manager/managerstoreList"; // 계정 생성시 이동하는 페이지 // 추후 시스템 운영에 맞게 수정
		return url;
	}
	
	
	/**
	 * (폼)카페 정보 등록
	 * @return
	 */
	@RequestMapping(value = "/insertStoreForm.do")
	public String showStoreInsertForm(@ModelAttribute("adminSession")Manager adminSession) {
		return "manager/storeInsert";
	}

	
	/**
	 * (기능)카페 정보 등록
	 * 
	 * @param store
	 * @return
	 */
	@RequestMapping(value = "/insertStore.do", method = RequestMethod.POST)
	public String insertStore(@ModelAttribute("adminSession")Manager adminSession, @ModelAttribute Store store, Model data) {
		String uri = null;
		if (store.getId() == 0 || store.getName() == null || store.getName().trim().length() == 0
				|| store.getAddr() == null || store.getAddr().trim().length() == 0
				|| store.getTel() == null || store.getTel().trim().length() == 0
				|| store.getStoreHours() == null || store.getStoreHours().trim().length() == 0
				|| store.getLanCode() == 0
				|| store.getLongi() == 0 || store.getLat() == 0) {
			return "test/error"; // 빈칸 있을시 이동하는 페이지 // 추후 시스템 운영에 맞게 수정
		}
		int result = storeDAO.insertStore(store);
		if (result == 0) {
			uri = "test/error";
		} else {
			uri = "redirect:test.do"; // 계정 생성시 이동하는 페이지 // 추후 시스템 운영에 맞게 수정
		}
		return uri;
	}
	
	
	/**
	 * 카페 정보 상세 조회
	 * @param id
	 * @param data
	 * @return
	 */
	@RequestMapping(value = "/detailStore.do/{id}.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String readStore(@ModelAttribute("adminSession")Manager adminSession, @PathVariable int id, Model data) {
		if (id == 0) {
			return "test/managerstoreList";
		}
		String url = "test/error";
		Store store = null;
		store = storeDAO.getStoreSelectById(id, 1);

		if (store == null) {
			data.addAttribute("error", "해당 게시글이 존재하지 않습니다");
		} else {
			data.addAttribute("resultContent", store);
			store.setId(id);
			url = "test/managerstoreDetail";
		}
		return url;
	}
	
	
	/**
	 * (폼)운영자 계정 수정하는 폼
	 * 
	 * @param email
	 * @param data
	 * @return
	 */
	@RequestMapping(value = "/updateStoreForm.do", method = RequestMethod.POST)
	public String updateStoreForm(@ModelAttribute("managerSession") Manager managerSession, @RequestParam int id, Model data) {
		String url = "test/error";
		if (id == 0) {
			return url;
		}
		Store store = null;
		store = storeDAO.getStoreSelectById(id, 1);
		store.setId(id);

		data.addAttribute("resultContent", store);
		url = "test/managerstoreUpdate";
		return url;
	}

	/**
	 * (기능)운영자 계정 수정
	 * 
	 * @param managerstore
	 * @param data
	 * @return
	 */
	@RequestMapping(value = "/updateStore.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String updateStore(@ModelAttribute("managerSession") Manager managerSession, @RequestParam int id, @RequestParam String tel, Model data) {
		String url = null;
		int result = storeDAO.updateStore(id, tel);
		if (result == 0) {
			url = "test/error";
		} else {
			url = "admin";
		}
		return url;
	}

	/**
	 * (기능)운영자 계정 삭제
	 * 
	 * @param email
	 * @param data
	 * @return
	 */
	@RequestMapping(value = "/deleteStore.do", method = RequestMethod.POST)
	public String deleteStore(@ModelAttribute("managerSession") Manager managerSession, @RequestParam int id, Model data) {
		String url = null;
		if (id == 0) {
			return "test/error";
		}
		int result = storeDAO.deleteStore(id);
		if (result == 0) {
			data.addAttribute("error", "삭제하려는 게시글이 존재하지 않습니다.");
		} else {
			url = "admin";
		}
		return url;
	}
	
	/////////////////////////////////////////////////////////////////////////////////
	/* 신고관리 */
	/**
	 * (기능) 관리자가 관리하는 신고리스트
	 * @return
	 */
	@RequestMapping(value="/selectReporting.do", method={RequestMethod.GET, RequestMethod.POST})
	public String selectReporting(@ModelAttribute("adminSession") Manager adminSession, Model data) {
		data.addAttribute("reportList", reportingDAO.selectReporting());
		return "manager/myReportList";
	}
	
	/**
	 * (기능) 운영자가 관리하는 내 카페 신고리스트
	 * @param seq
	 * @param email
	 * @return
	 */
	@RequestMapping(value = "/selectMyReport.do")
	public String selectMyReport(@ModelAttribute("managerSession") Manager managerSession, Model data) {
		data.addAttribute("reportList", reportingDAO.selectOneReportingByEmail(managerSession.getEmail()));
		return "manager/myReportList";
	}
	
	/**
	 * (기능) 운영자가 게시글을 신고
	 * @param reporting
	 * @param managerSession
	 * @return
	 */
	@RequestMapping(value="/insertReporting.do", method = { RequestMethod.GET, RequestMethod.POST })
	public @ResponseBody String insertReporting(@ModelAttribute Reporting reporting, @ModelAttribute Manager managerSession) {
		if(managerSession==null||managerSession.getEmail().trim().equals("")){
			return "need login";
		} else {
			return reportingDAO.insertReport(reporting)>0?"success":"fail";
		}
	}
	
	/**
	 * (기능) 관리자가 해당 신고게시글을 삭제
	 * @param seq
	 * @param managerSession
	 * @return
	 */
	@RequestMapping("/deleteReporting.do")
	public @ResponseBody String deleteReporting(@RequestParam int seq, @ModelAttribute Manager adminSession) {
		if(adminSession==null||adminSession.getEmail().trim().equals("")){
			return "need login";
		} else {
			return reportingDAO.deleteReport(seq)>0?"success":"fail";
		}
	}
	
}
