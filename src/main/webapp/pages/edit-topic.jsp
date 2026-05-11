<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="../components/header.jsp" />

<style>
    .form-container {
        max-width: 500px;
        margin: 40px auto;
        background: #fff;
        padding: 30px;
        border-radius: 8px;
        box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
    }
    
    .form-container h2 {
        color: #500073;
        margin-top: 0;
        margin-bottom: 20px;
        text-align: center;
    }

    .form-group {
        margin-bottom: 15px;
    }

    .form-group label {
        display: block;
        margin-bottom: 5px;
        font-weight: bold;
        color: #333;
    }

    .form-group input[type="text"] {
        width: 100%;
        padding: 10px;
        border: 1px solid #ccc;
        border-radius: 4px;
        box-sizing: border-box; 
    }

    .form-group input[type="text"]:focus {
        border-color: #500073;
        outline: none;
        box-shadow: 0 0 5px rgba(80, 0, 115, 0.5);
    }

    .submit-btn {
        width: 100%;
        padding: 10px;
        background-color: #500073;
        color: white;
        border: none;
        border-radius: 4px;
        font-size: 16px;
        cursor: pointer;
        font-weight: bold;
        transition: background-color 0.3s ease;
    }

    .submit-btn:hover {
        background-color: #F14A00;
    }
</style>

<div class="form-container">
    <h2>Edit Topic</h2>
    <form method="post" action="topic">
        <input type="hidden" value="edit" name="action"/>
        <input type="hidden" value="${topic.getId()}" name="id"/>
        
        <div class="form-group">
            <label for="title">Topic Title</label>
            <input type="text" id="title" value="${topic.getName()}" name="title" required/>
        </div>
        
        <button type="submit" class="submit-btn">Update Topic</button>
    </form>
</div>

<jsp:include page="../components/footer.jsp" />