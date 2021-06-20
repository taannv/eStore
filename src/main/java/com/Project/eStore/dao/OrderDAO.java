package com.Project.eStore.dao;

import java.util.List;

import com.Project.eStore.entity.Customer;
import com.Project.eStore.entity.Order;
import com.Project.eStore.entity.OrderDetail;
import com.Project.eStore.entity.Product;

/**
 *
 * @author: Nguyen Van Tan
 *
 * October 16, 2020
 *
 */

public interface OrderDAO {
	Order findById(Integer id);
	List<Order> findAll();
	Order create(Order entity);
	void update(Order entity);
	Order delete(Integer id);
	void create(Order order, List<OrderDetail> details);
	List<Order> findByUser(Customer user);
	List<Product> findItemsByUser(Customer user);
}
