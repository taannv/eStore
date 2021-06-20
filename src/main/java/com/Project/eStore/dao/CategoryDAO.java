package com.Project.eStore.dao;

import java.util.List;

import com.Project.eStore.entity.Category;

/**
 *
 * @author: Nguyen Van Tan
 *
 * October 16, 2020
 *
 */

public interface CategoryDAO {
	Category findById(Integer id);
	List<Category> findAll();
	Category create(Category entity);
	void update(Category entity);
	Category delete(Integer id);
}
