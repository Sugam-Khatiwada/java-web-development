<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="../components/header.jsp" />

<div style="background: white; padding: 30px; border-radius: 8px; box-shadow: 0 4px 12px rgba(0,0,0,0.1); max-width: 800px; margin: 40px auto;">
    <div style="display: flex; justify-content: space-between; align-items: center; margin-bottom: 20px;">
        <h2 style="color: #500073; margin: 0;">My Topics</h2>
        <a href="topic" style="background-color: #500073; color: white; padding: 10px 20px; text-decoration: none; border-radius: 5px; font-weight: bold; transition: background-color 0.3s; font-size: 14px;">+ Add Topic</a>
    </div>

    <table style="width: 100%; border-collapse: collapse; margin-top: 20px;">
        <thead>
            <tr style="background-color: #500073; color: white; text-align: left;">
                <th style="padding: 12px; border: 1px solid #ddd;">Id</th>
                <th style="padding: 12px; border: 1px solid #ddd;">Name</th>
                <th style="padding: 12px; border: 1px solid #ddd;">Created Date</th>
                <th style="padding: 12px; border: 1px solid #ddd; text-align: center;">Action</th>
            </tr>
        </thead>
        <tbody>
        <c:forEach var="obj" items="${topics}">
            <tr style="border-bottom: 1px solid #ddd;">
                <td style="padding: 12px; border: 1px solid #ddd;">${obj.getId()}</td>
                <td style="padding: 12px; border: 1px solid #ddd;">${obj.getName()}</td>
                <td style="padding: 12px; border: 1px solid #ddd;">${obj.getCreatedAt()}</td>
                <td style="padding: 12px; border: 1px solid #ddd; text-align: center;">
                    <a href="topic?page=edit&id=${obj.getId()}" style="color: #500073; text-decoration: none; font-weight: bold; margin-right: 10px;">Edit</a> |
                    <a href="delete-topic?id=${obj.getId()}" style="color: #F14A00; text-decoration: none; font-weight: bold; margin-left: 10px;" onclick="return confirm('Are you sure you want to delete this topic?');">Delete</a>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>

<jsp:include page="../components/footer.jsp" />
