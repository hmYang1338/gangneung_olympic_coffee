package controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import dao.TourDAO;
import dto.Tour;

@Controller
@SessionAttributes({"memberSession","managerSession","lanCode"})
public class TourController {
	@Autowired
	private TourDAO tourDAO;
	
	@RequestMapping("/tourList.do")
	public @ResponseBody List<Tour> StoreList(@ModelAttribute("lanCode") Integer lanCode) {
		return tourDAO.getStoreSelectMap(lanCode);
	}
	
	@RequestMapping("/tourSelectById.do")
	public @ResponseBody Tour storeSelectById(@ModelAttribute("lanCode") Integer lanCode,@RequestParam int id) {
		System.out.println(tourDAO.getTourSelectById(id, lanCode));
		return tourDAO.getTourSelectById(id, lanCode);
	}
}
