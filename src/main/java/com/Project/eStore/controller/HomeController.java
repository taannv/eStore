package com.Project.eStore.controller;

import com.Project.eStore.dao.ProductDAO;
import com.Project.eStore.entity.Product;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.ServletContext;
import java.util.List;

/**
 *
 * @author: Nguyen Van Tan
 *
 * October 20, 2020
 *
 */

@Controller
public class HomeController {

	@Autowired
	ProductDAO dao;
	@Autowired
	ServletContext app;

	@RequestMapping("/home/index")
	public String index(Model model) {
		List<Product> list = dao.findBySpecial(4);
		model.addAttribute("list", list);
		return "home/index";
	}
	
	@RequestMapping("/home/about")
	public String about() {
		return "home/about";
	}
	
	@RequestMapping("/home/contact")
	public String contact() {
		return "home/contact";
	}
	
	@RequestMapping("/home/feedback")
	public String feedback() {
		return "home/feedback";
	}
	
	@RequestMapping("/home/faq")
	public String faq() {
		return "home/faq";
	}
	
	@ResponseBody
	@RequestMapping("/home/language")
	public void language() {
	}
}
