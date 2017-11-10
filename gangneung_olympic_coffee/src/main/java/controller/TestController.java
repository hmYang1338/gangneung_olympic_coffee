package controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import dao.MemberDAO;
import dao.StoreDAO;
import dto.Store;

@Controller
public class TestController {
	
	@Autowired
	private StoreDAO storeDAO;
	
	
	@RequestMapping("/test.do")
	public String TestGo(Model model) {
		return "storeList";
	}
	
	@RequestMapping("/storeList.do")
	public @ResponseBody List<Store> StoreList(Model model) {
		System.out.println(storeDAO.getStoreSelectMap());
		return storeDAO.getStoreSelectMap();
	}
}

