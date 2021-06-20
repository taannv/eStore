package com.Project.eStore.admin.controller;

import com.Project.eStore.entity.Product;
import com.Project.eStore.exception.ExistenceException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.Project.eStore.dao.CategoryDAO;
import com.Project.eStore.entity.Category;

/**
 *
 * @author: Nguyen Van Tan
 *
 * October 16, 2020
 *
 */

@Controller
public class CategoryManager {
	@Autowired
	CategoryDAO dao;

	@RequestMapping("/admin/category/index")
	public String index(Model model) {
		Category entity = new Category();
		
		model.addAttribute("entity",entity);
		model.addAttribute("list",dao.findAll());
		return "admin/category/index";
	}
	
	@RequestMapping("/admin/category/edit/{id}")
	public String edit(Model model, @PathVariable("id") Integer id) {
		Category entity = dao.findById(id);
		model.addAttribute("entity",entity);
		model.addAttribute("list", dao.findAll());
		return "admin/category/index";
	}
	
	@RequestMapping("/admin/category/create")
	public String create(RedirectAttributes model, @ModelAttribute("entity") Category entity) {
		dao.create(entity);
		model.addAttribute("message", "Thêm mới thành công!");
		return "redirect:/admin/category/index";
	}
	
	@RequestMapping("/admin/category/update")
	public String update(RedirectAttributes model, @ModelAttribute("entity") Category entity) {
		dao.update(entity);
		model.addAttribute("message", "Cập nhật thành công!");
		return "redirect:/admin/category/edit/"+entity.getId();
	}
	
	@RequestMapping(value = {"/admin/category/delete", "/admin/category/delete/{id}"})
	public String delete(RedirectAttributes model,
			@RequestParam(value = "id",required = false) Integer id1, @ModelAttribute("entity") Product entity,
			@PathVariable(value = "id",required = false) Integer id2) throws ExistenceException {
			if (entity.getId().equals(id1)) {
				throw new ExistenceException("Danh mục này có tồn tại sản phẩm");
			}
			if(id1 != null) {
				dao.delete(id1);
			}else {
				dao.delete(id2);
			}
			model.addAttribute("message", "Xóa thành công!");
			return "redirect:/admin/category/index";

	}
}
