package com.Project.eStore.dao;

import java.util.List;

import javax.persistence.TypedQuery;
import javax.transaction.Transactional;

import com.Project.eStore.entity.Customer;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.Project.eStore.entity.Product;

/**
 *
 * @author: Nguyen Van Tan
 *
 * October 16, 2020
 *
 */

@Transactional
@Repository
public class ProductDAOImpl implements ProductDAO{
	@Autowired
	SessionFactory factory;
	
	@Override
	public Product findById(Integer id) {
		Session session = factory.getCurrentSession();
		Product entity = session.find(Product.class, id);
		return entity;
	}

	@Override
	public List<Product> findAll() {
		String hql = "FROM Product";
		Session session = factory.getCurrentSession();
		TypedQuery<Product> query = session.createQuery(hql,Product.class);
		List<Product> list = query.getResultList();
		return list;
	}

	@Override
	public Product create(Product entity) {
		Session session = factory.getCurrentSession();
		session.save(entity);
		return entity;
	}

	@Override
	public void update(Product entity) {
		Session session = factory.getCurrentSession();
		session.update(entity);
	}

	@Override
	public Product delete(Integer id) {
		Session session = factory.getCurrentSession();
		Product entity = session.find(Product.class, id);
		session.delete(entity);
		return entity;
	}

	@Override
	public List<Product> findByCategoryId(Integer categoryId) {
		String hql = "FROM Product p WHERE p.category.id=:cid";
		Session session = factory.getCurrentSession();
		TypedQuery<Product> query = session.createQuery(hql,Product.class);
		query.setParameter("cid", categoryId);
		List<Product> list = query.getResultList();
		return list;
	}

	@Override
	public List<Product> findByKeywords(String keywords) {
		String hql = "FROM Product p WHERE p.name LIKE :kw OR p.category.name LIKE :kw OR p.category.nameVN LIKE :kw";
		Session session = factory.getCurrentSession();
		TypedQuery<Product> query = session.createQuery(hql,Product.class);
		query.setParameter("kw","%"+keywords+"%");
		List<Product> list = query.getResultList();
		return list;
	}

	@Override
	public List<Product> findByIds(String ids) {
		String hql = "FROM Product p WHERE p.id IN("+ids+")";
		Session session = factory.getCurrentSession();
		TypedQuery<Product> query = session.createQuery(hql,Product.class);
		List<Product> list = query.getResultList();
		return list;
	}

	@Override
	public List<Product> findBySpecial(Integer id) {
		Session session = factory.getCurrentSession();
		String hql ="FROM Product p";
		TypedQuery<Product> query = session.createQuery(hql,Product.class);
		switch (id) {
			case 0: //H??ng m???i
				hql = "FROM Product p ORDER BY p.productDate DESC";
				break;
			case 1: //B??n ch???y
				hql = "FROM Product p ORDER BY size(p.orderDetails) DESC";
				break;
			case 2: //Xem nhi???u
				hql = "FROM Product p ORDER BY p.viewcount DESC";
				break;
			case 3: //Gi???m gi??
				hql = "FROM Product p ORDER BY p.discount DESC";
				break;
			case 4: //?????c gi??
				hql = "FROM Product p WHERE p.specical=true";
				break;
		}
		query = session.createQuery(hql,Product.class);
		query.setMaxResults(9);
		List<Product> list = query.getResultList();
		return list;
	}

	@Override
	public List<Product> getPage(int pageNo, int pageSize) {
		String hql = "FROM Product";
		Session session = factory.getCurrentSession();
		TypedQuery<Product> query = session.createQuery(hql,Product.class);
		query.setFirstResult(pageNo * pageSize);
		query.setMaxResults(pageSize);
		List<Product> list = query.getResultList();
		return list;
	}

	@Override
	public long getPageCount(int pageSize) {
		String hql = "SELECT count(p) FROM Product p";
		Session session = factory.getCurrentSession();
		TypedQuery<Long> query = session.createQuery(hql,Long.class);
		Long rowCount = query.getSingleResult();
		long pageCount = (long) Math.ceil(1.0*rowCount/pageSize);
		return pageCount;
	}
}
