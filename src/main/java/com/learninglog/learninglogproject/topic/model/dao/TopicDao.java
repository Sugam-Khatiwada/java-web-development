package com.learninglog.learninglogproject.topic.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Timestamp;
import com.learninglog.learninglogproject.utils.DbConnection;

public class TopicDao {
    public boolean insertTopic(String name, int userId, Timestamp createdAt) throws SQLException{
        String query = "INSERT INTO topics (name, user_id, created_at) VALUES (?, ?, ?)";
        try(Connection conn = DbConnection.getConnection();
            PreparedStatement st = conn.prepareStatement(query)){
                st.setString(1, name);
                st.setInt(2, userId);
                st.setTimestamp(3, createdAt);
            int insertedRows = st.executeUpdate();
            if(insertedRows > 0){
                return true;
            }
            else{
                return false;
            }
            }
        
    }
}
