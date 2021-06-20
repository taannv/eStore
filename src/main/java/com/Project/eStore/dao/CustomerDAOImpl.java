package com.Project.eStore.dao;

import java.util.List;

import javax.persistence.TypedQuery;
import javax.transaction.Transactional;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.Project.eStore.entity.Customer;

/**
 *
 * @author: Nguyen Van Tan
 *
 * October 16, 2020
 *
 */

@Transactional
@Repository
public class CustomerDAOImpl implements CustomerDAO{
	@Autowired
	SessionFactory factory;
	
	@Override
	public Customer findById(String id) {
		Session session = factory.getCurrentSession();
		Customer entity = session.find(Customer.class, id);
		return entity;
	}

	@Override
	public List<Customer> findAll() {
		String hql = "FROM Customer";
		Session session = factory.getCurrentSession();
		TypedQuery<Customer> query = session.createQuery(hql,Customer.class);
		List<Customer> list = query.getResultList();
		return list;
	}

	@Override
	public Customer create(Customer entity) {
		Session session = factory.getCurrentSession();
		session.save(entity);
		return entity;
	}

	@Override
	public void update(Customer entity) {
		Session session = factory.getCurrentSession();
		session.update(entity);
		
	}

	@Override
	public Customer delete(String id) {
		Session session = factory.getCurrentSession();
		Customer entity = session.find(Customer.class, id);
		session.delete(entity);
		return entity;
	}

	@Override
	public long getPageCount(int pageSize) {
		String hql = "SELECT count(c) FROM Customer c";
		Session session = factory.getCurrentSession();
		TypedQuery<Long> query = session.createQuery(hql,Long.class);
		Long rowCount = query.getSingleResult();
		long pageCount = (long) Math.ceil(1.0*rowCount/pageSize);
		return pageCount;
	}

	@Override
	public List<Customer> getPage(int pageNo, int pageSize) {
		String hql = "FROM Customer";
		Session session = factory.getCurrentSession();
		TypedQuery<Customer> query = session.createQuery(hql,Customer.class);
		query.setFirstResult(pageNo * pageSize);
		query.setMaxResults(pageSize);
		List<Customer> list = query.getResultList();
		return list;
	}
}
