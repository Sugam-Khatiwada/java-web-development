package com.learninglog.learninglogproject.topic.controller;

import com.learninglog.learninglogproject.topic.model.Topic;
import com.learninglog.learninglogproject.topic.model.dao.TopicDao;

import java.io.IOException;
import java.sql.Timestamp;
import java.util.List;
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
        String page = req.getParameter("page"); // ?page=list
        if("list".equals(page)){
            // fetch data from topic dao
            try{
            List<Topic> topicList = TopicDao.fetchTopics();
            req.setAttribute("topics", topicList);

            }
            catch(Exception e){
                req.setAttribute("error", "Unable to fetch topics.");
            }

            // then send data to topic-list.jsp
            req.getRequestDispatcher("pages/topic-list.jsp").forward(req, resp);
        }
        if("edit".equals(page)){
            int topicId = Integer.parseInt(req.getParameter("id"));
            // fetch topic details from dao using topic id
            try{
                TopicDao topicDao = new TopicDao();
                Topic topic = topicDao.fetchTopicById(topicId);
                // set topic details in request attribute and forward to edit-topic.jsp
                if(topic != null){
                    req.setAttribute("topic", topic);
                    // req.getRequestDispatcher("pages/edit-topic.jsp").forward(req, resp);
                }
                else{
                    req.setAttribute("error", "Topic not found.");
                }
            }
            catch(Exception e){
                req.setAttribute("error", "Something went wrong while fetching topic details."+e.getMessage());
            }
            req.getRequestDispatcher("pages/edit-topic.jsp").forward(req, resp);
        }
    }
@Override
protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    String action = req.getParameter("action");
    if("add".equals(action)){
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
    else if("edit".equals(action)){
        int id = Integer.parseInt(req.getParameter("id"));
        String updatedName = req.getParameter("topic-name");
}
}
}
