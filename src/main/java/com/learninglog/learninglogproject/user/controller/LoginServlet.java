package com.learninglog.learninglogproject.user.controller;

import com.learninglog.learninglogproject.user.model.dao.UserDao;
import com.learninglog.learninglogproject.user.model.User;
import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException{
        req.getRequestDispatcher("pages/login.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException{
        // Handle form submission from login.jsp here
        String email = req.getParameter("email");
        String password = req.getParameter("password");
        if(email.isEmpty() || password.isEmpty()){
            req.setAttribute("error","Please fill the all fields");
            req.getRequestDispatcher("pages/login.jsp").forward(req, resp);
        }

        try{
            // Call userdao's loginUser method
            UserDao dao = new UserDao();
            User userObj = dao.loginUser(email, password);
            if(userObj == null){
                req.setAttribute("error","Invalid email or password");
                req.getRequestDispatcher("pages/login.jsp").forward(req, resp);
            }
            else{
                // Login successful
                HttpSession session = req.getSession();
                session.setAttribute("user", userObj);
                resp.sendRedirect("dashboard");
                
            }
        }
        catch(Exception e){

        }

    }
}
