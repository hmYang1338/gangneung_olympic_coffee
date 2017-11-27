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
import dto.Member;
import dto.ProductRating;
import dto.Reporting;
import dto.Store;
import sercurity.ShaEncoder;

@Controller
@SessionAttributes({ "error", "resultContent", "list" })
public class ManagerController {
	@Autowired
	private StoreDAO storeDao;
	@Autowired
	private ManagerDAO managerDao;
	@Autowired
	private ReportingDAO reportingDao;
	@Autowired
	private LanguageDAO languageDAO;
	
	@Resource(name = "shaEncoder")
	private ShaEncoder encoder;

	@RequestMapping("/test2.do")
	public String TestGo(Model model) {
		/*return "home2";*/
		return "admin";
	}

	/**
	 * manager가 관리하는 창을 띄움
	 * @return
	 */
	@RequestMapping(value="/showManage.do")
	public String showManage() {
		return "manager/showManage";
	}
	@RequestMapping(value="/showManagerManage.do")
	public String showManagerManage() {
		return "manager/managerManage";
	}
	@RequestMapping(value="/showStoreManage.do")
	public String showStoreManage() {
		return "manager/storeManage";
	}
	
	
	/**
	 * (폼)운영자 계정 생성하는 폼
	 * 
	 * @return
	 */
	@RequestMapping(value = "/insertForm.do")
	public String showInsertForm(Model model) {
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
				|| manager.getBirth().trim().length() == 0 || manager.getId() == 0 || manager.getImgDir() == null
				|| manager.getImgDir().trim().length() == 0 || manager.getMajor() == null
				|| manager.getMajor().trim().length() == 0) { // 계정 생성시 빈칸이 있는지 확인
			return "test/loginPage"; // 빈칸 있을시 이동하는 페이지 // 추후 시스템 운영에 맞게 수정
		}
		manager.setPassword(encoder.encoding(manager.getPassword())); // 비밀번호암호화
		int result = managerDao.insertManager(manager);
		if (result == 0) {
			System.out.println("error"); // test//계정 생성 실패시 이동하는 페이지 // 추후 시스템 운영에 맞게 수정
			uri = "test/error";
		} else {
			uri = "redirect:test.do"; // 계정 생성시 이동하는 페이지 // 추후 시스템 운영에 맞게 수정
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
	public String listAjax(Model data) {
		String url = "test/error";
		data.addAttribute("list", managerDao.selectManagerAll());
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
	public @ResponseBody List<Manager> selectAllManager(Model data) {
		/*String url = "test/error";
		data.addAttribute("list", managerDao.selectManagerAll());
		url = "test/managerList"; // 계정 생성시 이동하는 페이지 // 추후 시스템 운영에 맞게 수정
*/		return managerDao.selectManagerAll();
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
		managerstore = managerDao.selectOneManagerDetail(email);
		
		if (managerstore == null) {
			data.addAttribute("error", "해당 게시글이 존재하지 않습니다");
		} else {
			data.addAttribute("resultContent", managerstore);
			managerstore.setEmail(email);
			url = "manager/managerDetail";
		}
		System.out.println("test read");
		System.out.println(url);
		System.out.println(email);
		return url;
	}

	@RequestMapping(value = "/managerSelectByEmail.do", method = { RequestMethod.GET, RequestMethod.POST })
	public @ResponseBody ManagerStoreJOIN read2(@RequestParam int lanCode, @RequestParam String email) {
		return managerDao.selectOneManagerDetail(lanCode, email);
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
		managerstore = managerDao.selectOneManagerDetail(email);
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
	public String update(@RequestParam String email, @RequestParam String tel, Model data) {
		String url = null;
		int result = managerDao.updateManager(email, tel);
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
	public String delete(@RequestParam String email, Model data) {
		String url = null;
		if (email == null || email.trim().length() == 0) {
			return "test/managerList";
		}
		int result = managerDao.deleteManager(email);
		if (result == 0) {
			data.addAttribute("error", "삭제하려는 게시글이 존재하지 않습니다.");
		} else {
			url = "home2";
		}
		return url;
	}

	/////////////////////////////////////////////////////////////////////////////////
	/**
	 * (폼)운영자 비밀번호 수정 폼
	 * 
	 * @return
	 */
	@RequestMapping(value = "/updatePasswordForm.do")
	public String showUpdatePasswordForm() {
		return "test/managerupdatePassword";
	}

	/**
	 * (기능)운영자가 자신의 비밀번호를 수정
	 * @param manager
	 * @param now_password
	 * @param ch_password
	 * @param data
	 * @return
	 */
	@RequestMapping(value = "/updatePassword.do")
	public String updatePassword(@RequestParam Manager manager, @RequestParam String now_password, 
								 @RequestParam String ch_password, Model data) {
		String url = null;
		String passwordDB = managerDao.selectOneManagerByEmail(manager.getEmail());
		
		if(encoder.matches(now_password, passwordDB)) { //현재 비밀번호가 다르면 오류
			if(ch_password==null) {	// 변경할 패스워드가 null이라면
				url = "home2";		// 아무런 변화없이 home2로 이동
			} else if(ch_password.length()>=8) {	// 변경할 패스워드가 8자리 이상이라면
				managerDao.updatePassword(manager.getEmail(), encoder.encoding(ch_password));	// 패스워드 바꾸고
				url = "home2";		// home2로 이동
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
	public String selectAllStore(Model data) {
		String url = "test/error";
		data.addAttribute("list", storeDao.getStoreSelectMap(1));
		url = "manager/managerstoreList"; // 계정 생성시 이동하는 페이지 // 추후 시스템 운영에 맞게 수정
		return url;
	}
	
	
	/**
	 * (폼)카페 정보 등록
	 * @return
	 */
	@RequestMapping(value = "/insertStoreForm.do")
	public String showStoreInsertForm() {
		return "manager/storeInsert";
	}

	
	/**
	 * (기능)카페 정보 등록
	 * 
	 * @param store
	 * @return
	 */
	@RequestMapping(value = "/insertStore.do", method = RequestMethod.POST)
	public String insertStore(@ModelAttribute Store store, Model data) {
		String uri = null;
		System.out.println("insertstore test1");
		if (store.getId() == 0 || store.getName() == null || store.getName().trim().length() == 0
				|| store.getAddr() == null || store.getAddr().trim().length() == 0
				|| store.getTel() == null || store.getTel().trim().length() == 0
				|| store.getStoreHours() == null || store.getStoreHours().trim().length() == 0
				|| store.getLanCode() == 0
				|| store.getLongi() == 0 || store.getLat() == 0) {
			return "test/error"; // 빈칸 있을시 이동하는 페이지 // 추후 시스템 운영에 맞게 수정
		}
		System.out.println("insertstore test2");
		int result = storeDao.insertStore(store);
		System.out.println("insertstore test3"+result);
		if (result == 0) {
			System.out.println("error"); // test//계정 생성 실패시 이동하는 페이지 // 추후 시스템 운영에 맞게 수정
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
	public String readStore(@PathVariable int id, Model data) {
		if (id == 0) {
			return "test/managerstoreList";
		}
		String url = "test/error";
		Store store = null;
		store = storeDao.getStoreSelectById(id, 1);

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
	public String updateStoreForm(@RequestParam int id, Model data) {
		String url = "test/error";
		if (id == 0) {
			return url;
		}
		Store store = null;
		store = storeDao.getStoreSelectById(id, 1);
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
	public String updateStore(@RequestParam int id, @RequestParam String tel, Model data) {
		String url = null;
		int result = storeDao.updateStore(id, tel);
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
	public String deleteStore(@RequestParam int id, Model data) {
		String url = null;
		if (id == 0) {
			return "test/error";
		}
		int result = storeDao.deleteStore(id);
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
	public @ResponseBody List<Reporting> selectReporting() {
		return reportingDao.selectReporting();
	}
	
	/**
	 * (기능) 운영자가 관리하는 내 카페 신고리스트
	 * @param seq
	 * @param email
	 * @return
	 */
	@RequestMapping(value = "/selectOneReportingByEmail.do", method = { RequestMethod.GET, RequestMethod.POST })
	public @ResponseBody Reporting selectOneReportingByEmail(@RequestParam int seq, @RequestParam String email) {
		return reportingDao.selectOneReportingByEmail(seq, email);
	}
	
	/**
	 * (기능) 운영자가 게시글을 신고
	 * @param reporting
	 * @param managerSession
	 * @return
	 */
	@RequestMapping(value="/insertReporting.do", method = { RequestMethod.GET, RequestMethod.POST })
	public @ResponseBody String insertReporting(@ModelAttribute Reporting reporting, @ModelAttribute Manager managerSession) {
		if(managerSession==null||!managerSession.getEmail().trim().equals("")){
			return "need login";
		} else {
			return reportingDao.insertReport(reporting)>0?"success":"fail";
		}
	}
	
	/**
	 * (기능) 관리자가 해당 신고게시글을 삭제
	 * @param seq
	 * @param managerSession
	 * @return
	 */
	@RequestMapping("/deleteReporting.do")
	public @ResponseBody String deleteReporting(@RequestParam int seq, @ModelAttribute Manager managerSession) {
		if(managerSession==null||!managerSession.getEmail().trim().equals("")){
			return "need login";
		} else {
			return reportingDao.deleteReport(seq)>0?"success":"fail";
		}
	}
}
