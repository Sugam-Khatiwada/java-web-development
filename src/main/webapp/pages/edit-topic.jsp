<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="components/header.jsp" />
<html>
<head>
    <title>Edit Topic</title>
</head>
<body>
<h2>Edit Topic</h2>
    <form method="post" action="topic">
    <input type="text" value="edit" name="action"/>
    <input type="text" value="${topic.getId()}" name="id"/>
    <input type="text" value="${topic.getName()}" name="title"/>
    <button type="submit">Update Topic</button>
    </form>
</body>
</html>
<jsp:include page="components/footer.jsp" />