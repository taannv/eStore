package com.Project.eStore.admin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 *
 * @author: Nguyen Van Tan
 *
 * October 16, 2020
 *
 */

@Controller
public class AdminHomeController {

	@RequestMapping("/admin/home/index")
	public String index() {
		return "admin/home/index";
	}
}
