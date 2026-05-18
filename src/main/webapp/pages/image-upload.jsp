<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="../components/header.jsp" />

<style>
    .upload-container {
        max-width: 500px;
        margin: 50px auto;
        background: white;
        padding: 30px;
        border-radius: 8px;
        box-shadow: 0 4px 6px rgba(0,0,0,0.1);
    }
    .upload-container h2 {
        color: var(--primary-color, #500073);
        margin-top: 0;
        margin-bottom: 20px;
        text-align: center;
    }
    .form-group {
        margin-bottom: 20px;
    }
    .form-group label {
        display: block;
        margin-bottom: 8px;
        font-weight: bold;
        color: #333;
    }
    .form-group input[type="text"],
    .form-group input[type="file"] {
        width: 100%;
        padding: 10px;
        border: 1px solid #ccc;
        border-radius: 4px;
        box-sizing: border-box;
    }
    .upload-btn {
        width: 100%;
        background-color: var(--accent-color, #F14A00);
        color: white;
        border: none;
        padding: 12px;
        border-radius: 4px;
        font-size: 16px;
        font-weight: bold;
        cursor: pointer;
        transition: background-color 0.3s ease;
    }
    .upload-btn:hover {
        background-color: #d14000;
    }
    .msg-error {
        color: #d9534f;
        background-color: #f2dede;
        padding: 10px;
        border-radius: 4px;
        margin-bottom: 15px;
        border: 1px solid #ebccd1;
        text-align: center;
    }
    .msg-success {
        color: #3c763d;
        background-color: #dff0d8;
        padding: 10px;
        border-radius: 4px;
        margin-bottom: 15px;
        border: 1px solid #d6e9c6;
        text-align: center;
    }
</style>

<div class="upload-container">
    <h2>Upload Image</h2>
    
    <% if (request.getAttribute("error") != null && !request.getAttribute("error").toString().isEmpty()) { %>
        <div class="msg-error">${error}</div>
    <% } %>
    
    <% if (request.getAttribute("success") != null && !request.getAttribute("success").toString().isEmpty()) { %>
        <div class="msg-success">${success}</div>
    <% } %>

    <form action="add-image" method="post" enctype="multipart/form-data">
        <div class="form-group">
            <label for="name">Image Name</label>
            <input type="text" id="name" name="name" required placeholder="Enter a name for the image">
        </div>
        <div class="form-group">
            <label for="image">File</label>
            <input type="file" id="image" name="image" required accept="image/*">
        </div>
        <button type="submit" class="upload-btn">Upload Image</button>
    </form>
</div>

<jsp:include page="../components/footer.jsp" />