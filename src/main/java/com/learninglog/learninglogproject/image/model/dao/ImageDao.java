package com.learninglog.learninglogproject.image.model.dao;

public class ImageDao {
    public static boolean insertImageDetails(String name, String filePath){
        String query = "INSERT INTO images (name, file_path) VALUES (?, ?)";
        
        return true;
    }
}