package controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import dao.MemberDAO;
import dao.ProductRatingDAO;
import dto.Member;
import dto.ProductRating;
/**
 * 
 * 상품 평가 항목에 대해 관리하는 클래스
 * @author 신승엽
 *
 */
@Controller
@SessionAttributes({"memberSession","lanCode"})
public class ProductRatingController {
	@Autowired
	private ProductRatingDAO productRatingDAO;
	
	@Autowired
	private MemberDAO memberDAO;
	/**
	 * 모든 물품에 관한 평가를 리턴 함
	 * @return 물품 평가 리스트
	 */
	@RequestMapping("/productRatingSelect.do")
	public @ResponseBody List<ProductRating> productRatingSelect(){
		return productRatingDAO.selectAllProductRating();
	}
	
	/**
	 * 특정 상점에 관한 품목 평가를 받아옵니다.
	 * @param productRating
	 * @param lanCode
	 * @return
	 */
	@RequestMapping("/productRatingSelectById.do")
	public @ResponseBody List<ProductRating> productRatingSelectById(@ModelAttribute ProductRating productRating,@ModelAttribute("lanCode") Integer lanCode){
		productRating.setLanCode(lanCode);
		return productRatingDAO.selectAllProductRatingById(productRating);
	}
	
	@RequestMapping("/productRatingSelectJoinById.do")
	public @ResponseBody List<Map<String,Object>> productRatingSelectJoinById(@ModelAttribute ProductRating productRating,@ModelAttribute("lanCode") Integer lanCode){
		productRating.setLanCode(lanCode);
		return productRatingDAO.selectAllProductRatingJoinById(productRating);
	}
	
	@RequestMapping(value = "/productRatingDelete.do",produces = "application/json; charset=utf8")
	public @ResponseBody String productRatingDelete(@ModelAttribute ProductRating productRating, @ModelAttribute("memberSession") Member memberSession,@ModelAttribute("lanCode") Integer lanCode) {
		if(memberSession==null||memberSession.getEmail().trim().equals("")){
			return "need login";
		} else if(memberSession.getEmail()!=productRating.getEmail()){
			return "hacking sido??";
		} else {
			productRating.setLanCode(lanCode);
			String[][] resultArr = {{"","DELETE failure!","리뷰 삭제 실패","删除失败"},
					{"","DELETE Success!","리뷰 삭제 성공","删除成功"}};
			return resultArr[productRatingDAO.deleteProductRating(productRating)][memberSession.getLanCode()];
		}
	}
	
	@RequestMapping("/productRatingUpdate.do")
	public @ResponseBody String productRatingUpdate(@ModelAttribute ProductRating productRating, @ModelAttribute("memberSession") Member memberSession,@ModelAttribute("lanCode") Integer lanCode) {
		if(memberSession==null||memberSession.getEmail().trim().equals("")){
			return "need login";
		} else {
			productRating.setLanCode(lanCode);
			return productRatingDAO.updateProductRating(productRating)>0?"success":"fail";
		}
	}
	
	@RequestMapping("/productRatingInsert.do")
	public @ResponseBody String productRatingInsert(@ModelAttribute ProductRating productRating, @ModelAttribute("memberSession") Member memberSession, @ModelAttribute("lanCode") Integer lanCode) {
		if(memberSession==null||memberSession.getEmail().trim().equals("")){
			return "need login";
		} else {
			productRating.setLanCode(lanCode);
			return productRatingDAO.insertProductRating(productRating)>0?"success":"fail";
		}
	}

}
