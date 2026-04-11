<%--
    Login page JSP
    This form sends user data to LoginServlet
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    String errorMsg = (String) request.getAttribute("error");
    if(errorMsg==null){
        errorMsg="";
    }
%>
<p style="color: red"><%= errorMsg %></p>
<form action="login" method="post">
    <label>Email</label>
    <input type="text" name="email">
    <label>Password</label>
    <input type="text" name="password">
    <button>Submit</button>
</form>
</body>
</html>