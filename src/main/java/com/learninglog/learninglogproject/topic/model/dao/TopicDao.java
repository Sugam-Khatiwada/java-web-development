package com.learninglog.learninglogproject.topic.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import com.learninglog.learninglogproject.topic.model.Topic;
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

    public static List<Topic> fetchTopics() throws SQLException{
        String query = "SELECT * FROM topics";
        try(Connection conn = DbConnection.getConnection();
            PreparedStatement st = conn.prepareStatement(query)){
            // execute query and fetch data
            // create list of topics and return
            ResultSet rs = st.executeQuery();  
            List<Topic> topicList = new ArrayList<>();
            while (rs.next()){
                int id = rs.getInt(1);
                String name = rs.getString(2);
                int userId = rs.getInt(3);
                Timestamp createdDate = rs.getTimestamp(4);
                Topic obj = new Topic(id, name, userId, createdDate);
                topicList.add(obj);
            }
            return topicList;
        }
    }
}

