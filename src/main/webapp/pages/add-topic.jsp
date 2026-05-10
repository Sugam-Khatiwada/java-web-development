<%@ page import="com.learninglog.learninglogproject.user.model.User" %><%--
  Created by IntelliJ IDEA.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add Topic - Learning Log</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #f8f9fa;
        }
        .form-container {
            max-width: 500px;
            margin: 50px auto;
            background: #ffffff;
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0 4px 6px rgba(0,0,0,0.1);
        }
    </style>
</head>
<body>

<%
    String errorMsg = (String) request.getAttribute("error");
    if(errorMsg==null){
        errorMsg="";
    }
    User userObj= (User) session.getAttribute("user");
    int userId = 0;
    if(userObj != null){
        userId=userObj.getId();
    }
%>

<div class="container">
    <div class="form-container">
        <h2 class="text-center mb-4">Add a New Topic</h2>
        
        <% if (!errorMsg.isEmpty()) { %>
            <div class="alert alert-danger" role="alert">
                <%= errorMsg %>
            </div>
        <% } %>

        <form method="post" action="topic">
            <input type="hidden" name="action" value="add">
            <input type="hidden" name="user-id" value="<%=userId%>">
            
            <div class="mb-3">
                <label for="topicName" class="form-label">Topic Name</label>
                <input type="text" class="form-control" id="topicName" name="topic-name" placeholder="Enter topic name" required>
            </div>
            
            <div class="d-grid gap-2">
                <button type="submit" class="btn btn-primary">Add Topic</button>
            </div>
        </form>
    </div>
</div>

<!-- Bootstrap Bundle JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>