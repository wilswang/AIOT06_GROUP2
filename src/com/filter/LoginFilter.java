package com.filter;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class LoginFilter implements Filter {
    @Override
    public void doFilter(ServletRequest request, ServletResponse response,
            FilterChain chain) throws IOException, ServletException {

        HttpServletRequest servletRequest = (HttpServletRequest) request;
        HttpServletResponse servletResponse = (HttpServletResponse) response;
        HttpSession session = servletRequest.getSession();

        String path = servletRequest.getRequestURI();
        String LogOk = (String) session.getAttribute("LogOk");

        
        // Ignore the login page

        if(path.contains("sidebar") ||path.contains("css") || path.contains("assets") ||path.endsWith("Login") || path.endsWith("Login_page.jsp") || path.contains("crawler")|| path.contains("bpminsert")) {

            chain.doFilter(servletRequest, servletResponse);
            return;
        }


        if (LogOk == null) {
            // redirect to login page if user not have auth
            //servletResponse.sendRedirect("/Login_page.jsp");
        	request.getRequestDispatcher("Login.jsp").forward(request, response);
        } else {
            chain.doFilter(request, response);
        }
    }
}