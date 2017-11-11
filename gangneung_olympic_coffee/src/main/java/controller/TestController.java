package controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import dao.MemberDAO;
import dao.StoreDAO;
import dto.Store;
import dto.UserGPS;

@Controller
public class TestController {
	
	@Autowired
	private StoreDAO storeDAO;
	
	
	@RequestMapping("/test.do")
	public String TestGo(Model model) {
		return "gpsTest";
	}
	
	@RequestMapping("/storeList.do")
	public @ResponseBody List<Store> StoreList() {
		System.out.println(storeDAO.getStoreSelectMap(1));
		return storeDAO.getStoreSelectMap(1);
	}
	
	@RequestMapping("/gps.do")
	public @ResponseBody UserGPS GpsReciver(@ModelAttribute UserGPS userGPS) {
		System.out.println(userGPS);
		return userGPS;
	}
}

