package com.learninglog.learninglogproject.filter;

import java.io.IOException;

import jakarta.servlet.Filter;
import jakarta.servlet.FilterChain;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebFilter("/*")
public class AuthFilter implements Filter{
    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {
        HttpServletRequest httpRequest = (HttpServletRequest) request;
        HttpServletResponse httpResponse = (HttpServletResponse) response;

        HttpSession session = httpRequest.getSession(false);
        boolean isLoggedIn = (session != null && session.getAttribute("user") != null);

        String uri = httpRequest.getRequestURI();

        boolean isLoginPageOrRegisterPage = uri.contains("login") || uri.contains("register");

        boolean isStaticFile = uri.contains("/images/") || uri.contains("/css/") || uri.contains("/js/");
        if(isLoggedIn && isLoginPageOrRegisterPage){
            httpResponse.sendRedirect("/");
            return;
        }
        if(isLoggedIn || isLoginPageOrRegisterPage || isStaticFile){
            chain.doFilter(request, response);
        }else {
            httpResponse.sendRedirect("/login");
        }
    }


}
