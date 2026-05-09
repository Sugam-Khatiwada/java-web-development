<%@ page import="com.learninglog.learninglogproject.user.model.User" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<jsp:include page="../components/header.jsp" />

<%
    User user = (User) session.getAttribute("user");
    if (user == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>

<div style="background: white; padding: 30px; border-radius: 8px; box-shadow: 0 4px 12px rgba(0,0,0,0.1); max-width: 600px; margin: 40px auto; text-align: center;">
    <h1 style="color: #500073; margin-bottom: 20px;">Welcome to your Dashboard</h1>
    
    <div style="background-color: #f8f9fa; padding: 20px; border-radius: 6px; margin-bottom: 30px;">
        <h2 style="margin: 0; color: #333; font-size: 24px;"><%= user.getName() %></h2>
        <p style="color: #666; margin-top: 5px;">User ID: <%= user.getId() %></p>
    </div>

    <div style="display: flex; justify-content: center; gap: 15px;">
        <a href="topic" style="background-color: #500073; color: white; padding: 12px 25px; text-decoration: none; border-radius: 5px; font-weight: bold; transition: background-color 0.3s;">Add New Topic</a>
        <a href="topic?page=list" style="background-color: #F14A00; color: white; padding: 12px 25px; text-decoration: none; border-radius: 5px; font-weight: bold; transition: background-color 0.3s;">View My Topics</a>
    </div>
</div>

<jsp:include page="../components/footer.jsp" />