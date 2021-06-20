package com.Project.eStore.dao;

import java.util.List;

import com.Project.eStore.entity.Customer;

/**
 *
 * @author: Nguyen Van Tan
 *
 * October 16, 2020
 *
 */

public interface CustomerDAO {
	Customer findById(String id);
	List<Customer> findAll();
	Customer create(Customer entity);
	void update(Customer entity);
	Customer delete(String id);
    long getPageCount(int pageSize);
	List<Customer> getPage(int pageNo, int pageSize);
}
