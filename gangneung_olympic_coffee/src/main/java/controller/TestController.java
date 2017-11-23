package controller;

import java.util.HashMap;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.LocaleResolver;
import org.springframework.web.servlet.i18n.SessionLocaleResolver;

import dao.ProductRatingDAO;
import dao.StoreDAO;
import dao.StoreRatingDAO;
import dto.Member;
import dto.ProductRating;
import dto.Store;
import dto.StoreRating;
import dto.UserGPS;

@Controller
@SessionAttributes({"memberSession","lanCode"})
public class TestController {
	
	@Autowired
	private StoreDAO storeDAO;
	@Autowired
	private ProductRatingDAO productRatingDAO;
	@Autowired
	private StoreRatingDAO storeRatingDAO;
	@Autowired 
	private SessionLocaleResolver localeResolver; 
	@Autowired 
	private MessageSource messageSource;

	@RequestMapping("/test.do")
	public String TestGo(Model data,HttpServletRequest request) {
		String language = localeResolver.resolveLocale(request).getLanguage();
		String[] languageCode = {"","en","ko","zh"};
		for(int i = 1; i < languageCode.length;i++) {
			if(language.equals(languageCode[i])) {
				data.addAttribute("lanCode", i);
				System.out.println(i);
				break;
			}
		}
		return "index";
	}
	
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
	public @ResponseBody List<ProductRating> productRatingSelectById(@ModelAttribute ProductRating productRating,@ModelAttribute("lanCode") Integer lanCode){
		productRating.setLanCode(lanCode);
		return productRatingDAO.selectAllProductRatingById(productRating);
	}
	
	@RequestMapping("/productRatingDelete.do")
	public @ResponseBody String productRatingDelete(@ModelAttribute ProductRating productRating, @ModelAttribute Member memberSession,@ModelAttribute("lanCode") Integer lanCode) {
		if(memberSession==null||!memberSession.getEmail().trim().equals("")){
			return "need login";
		} else {
			productRating.setLanCode(lanCode);
			return productRatingDAO.deleteProductRating(productRating)>0?"success":"fail";
		}
	}
	
	@RequestMapping("/productRatingUpdate.do")
	public @ResponseBody String productRatingUpdate(@ModelAttribute ProductRating productRating, @ModelAttribute Member memberSession,@ModelAttribute("lanCode") Integer lanCode) {
		if(memberSession==null||!memberSession.getEmail().trim().equals("")){
			return "need login";
		} else {
			productRating.setLanCode(lanCode);
			return productRatingDAO.updateProductRating(productRating)>0?"success":"fail";
		}
	}
	
	@RequestMapping("/productRatingInsert.do")
	public @ResponseBody String productRatingInsert(@ModelAttribute ProductRating productRating, @ModelAttribute Member memberSession, @ModelAttribute("lanCode") Integer lanCode) {
		if(memberSession==null||!memberSession.getEmail().trim().equals("")){
			return "need login";
		} else {
			productRating.setLanCode(lanCode);
			return productRatingDAO.insertProductRating(productRating)>0?"success":"fail";
		}
	}
	
	@RequestMapping("/storeRatingSelect.do")
	public @ResponseBody List<StoreRating> storeRatingSelect(){
		return storeRatingDAO.selectAllStoreRating();
	}
	
	@RequestMapping("/storeRatingSelectById.do")
	public @ResponseBody List<StoreRating> storeRatingSelectById(@ModelAttribute StoreRating storeRating,@ModelAttribute("lanCode") Integer lanCode){
		System.out.println(storeRating);
		storeRating.setLanCode(lanCode);
		return storeRatingDAO.selectAllStoreRatingById(storeRating);
	}
	
	@RequestMapping("/storeRatingDelete.do")
	public @ResponseBody String storeRatingDelete(@ModelAttribute StoreRating storeRating, @ModelAttribute Member memberSession, @ModelAttribute("lanCode") Integer lanCode) {
		if(memberSession==null||!memberSession.getEmail().trim().equals("")){
			return "need login";
		} else {
			storeRating.setLanCode(lanCode);
			return storeRatingDAO.deleteStoreRating(storeRating)>0?"success":"fail";
		}
	}
	
	@RequestMapping("/storeRatingUpdate.do")
	public @ResponseBody String storeRatingUpdate(@ModelAttribute StoreRating storeRating, @ModelAttribute Member memberSession, @ModelAttribute("lanCode") Integer lanCode) {
		if(memberSession==null||!memberSession.getEmail().trim().equals("")){
			return "need login";
		} else {
			storeRating.setLanCode(lanCode);
			return storeRatingDAO.updateStoreRating(storeRating)>0?"success":"fail";
		}
	}
	
	@RequestMapping("/storeRatingInsert.do")
	public @ResponseBody String storeRatingInsert(@ModelAttribute StoreRating storeRating, @ModelAttribute Member memberSession, @ModelAttribute("lanCode") Integer lanCode) {
		if(memberSession==null||!memberSession.getEmail().trim().equals("")){
			return "need login";
		} else {
			storeRating.setLanCode(lanCode);
			return storeRatingDAO.insertStoreRating(storeRating)>0?"success":"fail";
		}
	}
}

