package controller;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import dao.MemberDAO;
import dao.ProductRatingDAO;
import dao.StoreDAO;
import dto.ProductRating;
import dto.Store;
import dto.UserGPS;

@Controller
public class TestController {
	
	@Autowired
	private StoreDAO storeDAO;
	@Autowired
	private ProductRatingDAO productRatingDAO;
	
	@RequestMapping("/test.do")
	public String TestGo(Model model) {
		return "productRating";
	}
	
	@RequestMapping("/storeList.do")
	public @ResponseBody List<Store> StoreList() {
		System.out.println(storeDAO.getStoreSelectMap(1));
		return storeDAO.getStoreSelectMap(1);
	}
	
	@RequestMapping("/storeListMap.do")
	public @ResponseBody List<HashMap<String,Object>> StoreListMap() {
		System.out.println(storeDAO.getStoreSelectHashMap(1));
		return storeDAO.getStoreSelectHashMap(1);
	}
	
	@RequestMapping("/nearByStore.do")
	public @ResponseBody List<HashMap<String,Object>> nearByStore(@ModelAttribute UserGPS userGPS) {
		userGPS.setLanCode(1);
		System.out.println(userGPS);
		return storeDAO.getStoreSelectMapByDistance(userGPS);
	}
	
	@RequestMapping("/storeSelectByName.do")
	public @ResponseBody List<HashMap<String,Object>> storeSelectByName(@RequestParam String name) {
		return storeDAO.getStoreSelectByName(name,1);
	}
	
	@RequestMapping("/gps.do")
	public @ResponseBody UserGPS GpsReciver(@ModelAttribute UserGPS userGPS) {
		System.out.println(userGPS);
		return userGPS;
	}
	
	@RequestMapping("/productRatingSelect.do")
	public @ResponseBody List<ProductRating> productRatingSelect(){
		return productRatingDAO.selectAllProductRating();
	}
	
	@RequestMapping("/productRatingSelectById.do")
	public @ResponseBody List<ProductRating> productRatingSelectById(@ModelAttribute ProductRating productRating){
		return productRatingDAO.selectAllProductRatingById(productRating);
	}
}

