package com.Project.eStore.dao;

import java.util.List;

/**
 *
 * @author: Nguyen Van Tan
 *
 * October 16, 2020
 *
 */

public interface ReportDAO {
	public List<Object[]> inventory();
	public List<Object[]> revenueByCategory();
	public List<Object[]> revenueByCustomer();
	public List<Object[]> revenueByYear();
	public List<Object[]> revenueByQuarter();
	public List<Object[]> revenueByMonth();
}
