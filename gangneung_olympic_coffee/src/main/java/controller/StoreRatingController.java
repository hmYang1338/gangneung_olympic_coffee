package controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import dao.StoreRatingDAO;
import dto.Member;
import dto.StoreRating;

@Controller
@SessionAttributes({"memberSession","lanCode"})
public class StoreRatingController {
	@Autowired
	private StoreRatingDAO storeRatingDAO;
	
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
