package controller;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import dao.StoreDAO;
import dao.StoreFavoriteDAO;
import dto.Member;
import dto.ProductFavorite;
import dto.Store;
import dto.StoreFavorite;
import dto.UserGPS;

@Controller
@SessionAttributes({"memberSession","managerSession","lanCode"})
public class StoreController {
	@Autowired
	private StoreDAO storeDAO;
	
	@RequestMapping("/storeList.do")
	public @ResponseBody List<Store> StoreList(@ModelAttribute("lanCode") Integer lanCode) {
		return storeDAO.getStoreSelectMap(lanCode);
	}
	
	@RequestMapping("/storeListMap.do")
	public @ResponseBody List<HashMap<String,Object>> StoreListMap(@ModelAttribute("lanCode") Integer lanCode) {
		return storeDAO.getStoreSelectHashMap(lanCode);
	}
	
	@RequestMapping("/nearByStore.do")
	public @ResponseBody List<HashMap<String,Object>> nearByStore(@ModelAttribute UserGPS userGPS,@ModelAttribute("lanCode") Integer lanCode) {
		userGPS.setLanCode(lanCode);
		System.out.println(userGPS);
		return storeDAO.getStoreSelectMapByDistance(userGPS);
	}
	
	@RequestMapping("/storeSelectByName.do")
	public @ResponseBody List<HashMap<String,Object>> storeSelectByName(@RequestParam String name,@ModelAttribute("lanCode") Integer lanCode) {
		return storeDAO.getStoreSelectByName(name,lanCode);
	}
	
	@RequestMapping("/storeSelectById.do")
	public @ResponseBody Store storeSelectById(@ModelAttribute("lanCode") Integer lanCode,@RequestParam int id) {
		System.out.println(storeDAO.getStoreSelectById(id, lanCode));
		return storeDAO.getStoreSelectById(id, lanCode);
	}
	
}
