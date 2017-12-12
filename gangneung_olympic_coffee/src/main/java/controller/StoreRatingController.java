package controller;

import java.util.List;
import java.util.Map;

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
@SessionAttributes({"memberSession","lanCode","admminSession"})
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
	
	@RequestMapping("/storeRatingSelectJoinById.do")
	public @ResponseBody List<Map<String, Object>> storeRatingSelectJoinById(@ModelAttribute StoreRating storeRating,@ModelAttribute("lanCode") Integer lanCode){
		System.out.println(storeRating);
		storeRating.setLanCode(lanCode);
		return storeRatingDAO.selectAllStoreRatingJoinById(storeRating);
	}
	
	@RequestMapping(value = "/storeRatingDelete.do",produces = "application/json; charset=utf8")
	public @ResponseBody String storeRatingDelete(@ModelAttribute StoreRating storeRating, @ModelAttribute("memberSession") Member memberSession, @ModelAttribute("lanCode") Integer lanCode) {
		try {
			if(memberSession.getEmail().trim().equals("")) {
				return "need login";
			}else if(memberSession.getEmail()!=storeRating.getEmail()) {
				return "hacking sido??";
			}else {
				storeRating.setLanCode(lanCode);
				String[][] resultArr = {{"","DELETE failure!","리뷰 삭제 실패","删除失败"},
						{"","DELETE Success!","리뷰 삭제 성공","删除成功"}};
				return resultArr[storeRatingDAO.deleteStoreRating(storeRating)][memberSession.getLanCode()];
			}
		}catch(NullPointerException e) {
			return null;
		}
	}
	@RequestMapping("/storeRatingUpdate.do")
	public @ResponseBody String storeRatingUpdate(@ModelAttribute StoreRating storeRating, @ModelAttribute("memberSession") Member memberSession, @ModelAttribute("lanCode") Integer lanCode) {
		if(memberSession==null||!memberSession.getEmail().trim().equals("")){
			return "need login";
		} else {
			storeRating.setLanCode(lanCode);
			return storeRatingDAO.updateStoreRating(storeRating)>0?"success":"fail";
		}
	}
	
	@RequestMapping("/storeRatingInsert.do")
	public @ResponseBody String storeRatingInsert(@ModelAttribute StoreRating storeRating, @ModelAttribute("memberSession") Member memberSession, @ModelAttribute("lanCode") Integer lanCode) {
		if(memberSession==null||!memberSession.getEmail().trim().equals("")){
			return "need login";
		} else {
			storeRating.setLanCode(lanCode);
			return storeRatingDAO.insertStoreRating(storeRating)>0?"success":"fail";
		}
	}

}
