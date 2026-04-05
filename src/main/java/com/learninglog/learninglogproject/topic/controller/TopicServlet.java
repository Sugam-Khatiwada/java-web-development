package com.learninglog.learninglogproject.topic.controller;

import com.learninglog.learninglogproject.topic.model.dao.TopicDao;

import java.io.IOException;
import java.sql.Timestamp;
import java.sql.Time;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/topic")
public class TopicServlet extends  HttpServlet{
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("pages/add-topic.jsp").forward(req, resp);
    }
@Override
protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    String action = req.getParameter("action");
    if(action.equals("add")){
        String topicName = req.getParameter("topic-name");
        int userId = Integer.parseInt(req.getParameter("user-id"));
        Timestamp createdAt = new Timestamp(System.currentTimeMillis());

        try{
            TopicDao topicDao = new TopicDao();
            boolean result = topicDao.insertTopic(topicName, userId, createdAt);
            if(result){
                resp.sendRedirect("dashboard");
            }
            else{
                req.setAttribute("error", "Something went wrong");
                req.getRequestDispatcher("pages/add-topic.jsp").forward(req, resp);
            }
        }
        catch(Exception e){
            req.setAttribute("error", e.getMessage());
            req.getRequestDispatcher("pages/add-topic.jsp").forward(req, resp);
        }

}
else if(action.equals("edit")){
}
}
}