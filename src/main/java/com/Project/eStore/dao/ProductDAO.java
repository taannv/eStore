package com.Project.eStore.dao;

import java.util.List;

import com.Project.eStore.entity.Product;

/**
 *
 * @author: Nguyen Van Tan
 *
 * October 16, 2020
 *
 */

public interface ProductDAO {
	Product findById(Integer id);
	List<Product> findAll();
	Product create(Product entity);
	void update(Product entity);
	Product delete(Integer id);
	List<Product> findByCategoryId(Integer categoryId);
	List<Product> findByKeywords(String keywords);
	List<Product> findByIds(String ids);
	List<Product> findBySpecial(Integer id);

	List<Product> getPage(int pageNo, int pageSize);

	long getPageCount(int pageSize);
}
