package com.spring.interceptor;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.util.StringUtils;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class MemberInterceptor extends HandlerInterceptorAdapter implements SessionNames{

	@Override
	public boolean preHandle(HttpServletRequest request
							 ,HttpServletResponse response
							 ,Object handler) throws Exception {
		
		 HttpSession session=request.getSession();
		 
		 
		 
		return true;
	}

	@Override
	public void postHandle(HttpServletRequest request
						   ,HttpServletResponse response
						   , Object handler
						   ,ModelAndView modelAndView) throws Exception {
			System.out.println("posthandle");
			String method=(String)modelAndView.getModelMap().get("method");
			System.out.println(method);

			if(method!=null) {
				System.out.println("dd");
				HttpSession session=request.getSession();
				Object user=modelAndView.getModelMap().get("user");
				
				¤©
				if(user!=null) {
					session.setAttribute(LOGIN, user);
					session.setMaxInactiveInterval(24*60*60);
				}
				
				String uri=(String)modelAndView.getModelMap().get("uri");
				if(!uri.equals("/home")) {
					System.out.println(uri);
					response.sendRedirect(uri);
				}
				
				
			}
			
			
		
		
		
	}

	
	
}
