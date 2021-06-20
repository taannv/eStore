package com.Project.eStore.dao;

import java.util.List;

import com.Project.eStore.entity.Order;
import com.Project.eStore.entity.OrderDetail;

/**
 *
 * @author: Nguyen Van Tan
 *
 * October 16, 2020
 *
 */

public interface OrderDetailDAO {
	OrderDetail findById(Integer id);
	List<OrderDetail> findAll();
	OrderDetail create(OrderDetail entity);
	void update(OrderDetail entity);
	OrderDetail delete(Integer id);
	List<OrderDetail> findByOrder(Order order);
}
