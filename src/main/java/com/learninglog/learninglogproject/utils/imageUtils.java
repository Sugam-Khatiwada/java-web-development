package com.learninglog.learninglogproject.utils;

import java.io.File;
import java.io.IOException;

import jakarta.servlet.http.Part;

public class imageUtils {
    /**
     * Writes the uploaded image part to the target directory and returns the relative path.
     */
    public static String writeImage(Part imagePart) throws IOException {
        String uploadDir = "C:\\Users\\Acer\\Random projects\\learninglog\\src\\main\\webapp\\images";
        
        File imagesPath = new File(uploadDir);
        if (!imagesPath.exists()) {
            imagesPath.mkdirs();
        }
        
        String fileName = imagePart.getSubmittedFileName();
        imagePart.write( uploadDir + File.separator + fileName);
        return "images" + File.separator + fileName;
    }

    
}
