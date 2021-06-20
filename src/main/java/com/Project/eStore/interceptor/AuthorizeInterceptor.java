package com.Project.eStore.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Component;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.Project.eStore.entity.Customer;

/**
 *
 * @author: Nguyen Van Tan
 *
 * October 22, 2020
 *
 */

@Component
public class AuthorizeInterceptor extends HandlerInterceptorAdapter{
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		HttpSession session = request.getSession();
		Customer user = (Customer) session.getAttribute("user");
		if(user == null) {
			session.setAttribute("back-url", request.getRequestURI());
			response.sendRedirect("/account/login");
			return false;
		}
		return true;
	}
}
