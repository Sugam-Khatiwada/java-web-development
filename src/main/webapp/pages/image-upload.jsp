<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="components/header.jsp" />
<html>
<head>
    <title>Image Upload</title>
</head>
<body>

<h2>Image Upload</h2>
<p style="color: red;">${error}    </p>
<p style="color: green;"> ${success}   </p>
<form action="add-image" method="post" enctype="multipart/form-data">
Name: <input type="text" name="name">
Image: <input type="file" name="image">
<button type="submit">Upload</button>
</form>

</body>
</html>

<jsp:include page="components/footer.jsp" />