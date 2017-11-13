package controller;

import java.util.List;

import javax.annotation.Resource;
import javax.mail.Session;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import dao.FavoriteDAO;
import dao.MemberDAO;
import dto.Member;
import sercurity.ShaEncoder;


@Controller
public class TestController3 {
	
	@Autowired
	private FavoriteDAO favoriteDAO;
	
	@RequestMapping("/test3.do")
	public String TestGo(Model model) {
		return "home3";
	}

}
