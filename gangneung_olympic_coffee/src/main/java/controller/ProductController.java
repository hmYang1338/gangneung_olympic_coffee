package controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import dao.ProductDAO;
import dao.ProductFavoriteDAO;
import dto.Member;
import dto.Product;
import dto.ProductFavorite;
import dto.StoreFavorite;

@Controller
@SessionAttributes({"memberSession","lanCode"})
public class ProductController {
	@Autowired
	ProductDAO productDAO;
	
	@RequestMapping("/productList.do")
	public @ResponseBody List<Product> ProductList(@ModelAttribute("lanCode") Integer lanCode) {
		return productDAO.getProductSelectMap(lanCode);
	}
	
	@RequestMapping("/productSelectById.do")
	public @ResponseBody List<Product> productSelectById(@ModelAttribute("lanCode") Integer lanCode,@RequestParam int id) {
		return productDAO.getProductSelectById(id, lanCode);
	}
	
	@RequestMapping("/productSelectByName.do")
	public @ResponseBody List<Product> productSelectByName(@ModelAttribute("lanCode") Integer lanCode,@RequestParam String product) {
		return productDAO.getProductSelectByName(product, lanCode);
	}
	
}
