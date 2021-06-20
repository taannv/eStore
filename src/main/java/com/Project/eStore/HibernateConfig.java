package com.Project.eStore;

import java.util.Properties;

import javax.sql.DataSource;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.PropertySource;
import org.springframework.core.env.Environment;
import org.springframework.jdbc.datasource.DriverManagerDataSource;
import org.springframework.orm.hibernate5.HibernateTransactionManager;
import org.springframework.orm.hibernate5.LocalSessionFactoryBean;

/**
 *
 * @author: Nguyen Van Tan
 *
 * October 16, 2020
 *
 */

@Configuration
@PropertySource("classpath:datasource.properties")
public class HibernateConfig {
	  @Autowired
	   Environment env;
	 
	    @Bean
	    public DataSource getDataSource() {
	        DriverManagerDataSource dataSource = new DriverManagerDataSource();
	 
	        // See: application.properties
	        dataSource.setDriverClassName(env.getProperty("db.driver"));
	        dataSource.setUrl(env.getProperty("db.url"));
	        dataSource.setUsername(env.getProperty("db.username"));
	        dataSource.setPassword(env.getProperty("db.password"));
	 
	        System.out.println("## getDataSource: " + dataSource);
	 
	        return dataSource;
	    }
	 
	    @Autowired
	    @Bean
	    public SessionFactory getSessionFactory(DataSource dataSource) throws Exception {
	    	 LocalSessionFactoryBean factoryBean = new LocalSessionFactoryBean();
	    	 factoryBean.setPackagesToScan(new String[] { "com.Project.eStore.entity" });
	    	 factoryBean.setDataSource(dataSource);
	         Properties props = factoryBean.getHibernateProperties();
	        props.put("hibernate.dialect", env.getProperty("hb.dialect"));
	        props.put("hibernate.show_sql", env.getProperty("hb.show-sql"));
	        props.put("current_session_context_class", env.getProperty("hb.session"));
	        factoryBean.afterPropertiesSet();
	        SessionFactory sf = factoryBean.getObject();
	        return sf;
	    }
	 
	    @Autowired
	    @Bean
	    public HibernateTransactionManager getTransactionManager(SessionFactory sessionFactory) {
	        HibernateTransactionManager transactionManager = new HibernateTransactionManager(sessionFactory);
	 
	        return transactionManager;
	    }
}
