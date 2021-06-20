package com.Project.eStore.dao;

import java.util.List;

import javax.persistence.TypedQuery;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author: Nguyen Van Tan
 *
 * October 16, 2020
 *
 */

@Transactional
@Repository
public class ReportDAOImpl implements ReportDAO{
	@Autowired
	SessionFactory factory;

	@Override
	public List<Object[]> inventory() {
		String hql = "select p.category.nameVN,"
				+ " sum(p.quantity),"
				+ " sum(p.unitPrice*p.quantity),"
				+ " min(p.unitPrice),"
				+ " max(p.unitPrice),"
				+ "avg(p.unitPrice)"
				+ " from Product p"
				+ " group by p.category.nameVN";
		
		Session session = factory.getCurrentSession();
		TypedQuery<Object[]> query = session.createQuery(hql,Object[].class);
		List<Object[]> list = query.getResultList();
		return list;
	}

	@Override
	public List<Object[]> revenueByCategory() {
		String hql = "select d.product.category.nameVN,"
				+ " sum(d.quantity),"
				+ " sum((d.unitPrice*d.quantity)-((d.quantity*d.unitPrice) * d.discount)/100),"
				+ " min(d.unitPrice),"
				+ " max(d.unitPrice),"
				+ "avg(d.unitPrice)"
				+ " from OrderDetail d"
				+ " group by d.product.category.nameVN";

		Session session = factory.getCurrentSession();
		TypedQuery<Object[]> query = session.createQuery(hql,Object[].class);
		List<Object[]> list = query.getResultList();
		return list;
	}

	@Override
	public List<Object[]> revenueByCustomer() {
		String hql = "select d.order.customer.id,"
				+ " sum(d.quantity),"
				+ " sum((d.unitPrice*d.quantity)-((d.quantity*d.unitPrice) * d.discount)/100),"
				+ " min(d.unitPrice),"
				+ " max(d.unitPrice),"
				+ "avg(d.unitPrice)"
				+ " from OrderDetail d"
				+ " group by d.order.customer.id";
			//	+ " order by sum(d.unitPrice*d.quantity) DESC";

		Session session = factory.getCurrentSession();
		TypedQuery<Object[]> query = session.createQuery(hql,Object[].class);
		List<Object[]> list = query.getResultList();
		return list;
	}

	@Override
	public List<Object[]> revenueByYear() {
		String hql = "select year(d.order.orderDate),"
				+ " sum(d.quantity),"
				+ " sum((d.unitPrice*d.quantity)-((d.quantity*d.unitPrice) * d.discount)/100),"
				+ " min(d.unitPrice),"
				+ " max(d.unitPrice),"
				+ "avg(d.unitPrice)"
				+ " from OrderDetail d"
				+ " group by year(d.order.orderDate)"
				+ " order by year(d.order.orderDate) DESC";

		Session session = factory.getCurrentSession();
		TypedQuery<Object[]> query = session.createQuery(hql,Object[].class);
		List<Object[]> list = query.getResultList();
		return list;
	}

	@Override
	public List<Object[]> revenueByQuarter() {
		String hql = "select ceiling(month(d.order.orderDate)/3.0),"
				+ " sum(d.quantity),"
				+ " sum((d.unitPrice*d.quantity)-((d.quantity*d.unitPrice) * d.discount)/100),"
				+ " min(d.unitPrice),"
				+ " max(d.unitPrice),"
				+ "avg(d.unitPrice)"
				+ " from OrderDetail d"
				+ " group by ceiling(month(d.order.orderDate)/3.0)"
				+ " order by ceiling(month(d.order.orderDate)/3.0)";

		Session session = factory.getCurrentSession();
		TypedQuery<Object[]> query = session.createQuery(hql,Object[].class);
		List<Object[]> list = query.getResultList();
		return list;
	}

	@Override
	public List<Object[]> revenueByMonth() {
		String hql = "select month(d.order.orderDate),"
				+ " sum(d.quantity),"
				+ " sum((d.unitPrice*d.quantity)-((d.quantity*d.unitPrice) * d.discount)/100),"
				+ " min(d.unitPrice),"
				+ " max(d.unitPrice),"
				+ "avg(d.unitPrice)"
				+ " from OrderDetail d"
				+ " group by month(d.order.orderDate)"
				+ " order by month(d.order.orderDate) DESC";

		Session session = factory.getCurrentSession();
		TypedQuery<Object[]> query = session.createQuery(hql,Object[].class);
		List<Object[]> list = query.getResultList();
		return list;
	}
}
