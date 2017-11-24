package controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

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
	
	/**
	 * 모든 물품에 관한 평가를 리턴 함
	 * @return 물품 평가 리스트
	 */
	@RequestMapping("/productRatingSelect.do")
	public @ResponseBody List<ProductRating> productRatingSelect(){
		return productRatingDAO.selectAllProductRating();
	}
	
	/**
	 * 
	 * @param productRating
	 * @param lanCode
	 * @return
	 */
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

}
