package com.learninglog.learninglogproject.image.controller;

import java.io.IOException;

import com.learninglog.learninglogproject.image.model.dao.ImageDao;
import com.learninglog.learninglogproject.utils.imageUtils;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

@WebServlet("/add-image")
@MultipartConfig
public class imageServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("pages/image-upload.jsp").forward(req, resp);

    }
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String name = req.getParameter("name");
        Part imagePart = req.getPart("image");
        try{
            String filePath = imageUtils.writeImage(imagePart);
            boolean result = ImageDao.insertImageDetails(name, filePath);
            if(result){
                req.setAttribute("success", "Image uploaded successfully!");
            }else{
                req.setAttribute("error", "Failed to upload image");
            }

        }catch(Exception e){
            req.setAttribute("error", "Failed to upload image: " + e.getMessage());
        }
        req.getRequestDispatcher("pages/image-upload.jsp").forward(req, resp);
    }
}
