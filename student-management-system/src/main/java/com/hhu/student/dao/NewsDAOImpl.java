package com.hhu.student.dao;

import com.hhu.student.model.News;
import com.hhu.student.util.DBUtil;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class NewsDAOImpl implements NewsDAO {

    @Override
    public void addNews(News news) {
        String sql = "INSERT INTO news (title, content, publish_date, author) VALUES (?, ?, ?, ?)";
        try (Connection conn = DBUtil.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setString(1, news.getTitle());
            pstmt.setString(2, news.getContent());
            pstmt.setTimestamp(3, new Timestamp(news.getPublishDate().getTime()));
            pstmt.setString(4, news.getAuthor());
            pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public void updateNews(News news) {
        String sql = "UPDATE news SET title = ?, content = ?, publish_date = ?, author = ? WHERE id = ?";
        try (Connection conn = DBUtil.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setString(1, news.getTitle());
            pstmt.setString(2, news.getContent());
            pstmt.setTimestamp(3, new Timestamp(news.getPublishDate().getTime()));
            pstmt.setString(4, news.getAuthor());
            pstmt.setInt(5, news.getId());
            pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public void deleteNews(int newsId) {
        String sql = "DELETE FROM news WHERE id = ?";
        try (Connection conn = DBUtil.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setInt(1, newsId);
            pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public News getNewsById(int newsId) {
        String sql = "SELECT * FROM news WHERE id = ?";
        News news = null;
        try (Connection conn = DBUtil.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setInt(1, newsId);
            ResultSet rs = pstmt.executeQuery();
            if (rs.next()) {
                news = new News();
                news.setId(rs.getInt("id"));
                news.setTitle(rs.getString("title"));
                news.setContent(rs.getString("content"));
                news.setPublishDate(rs.getTimestamp("publish_date"));
                news.setAuthor(rs.getString("author"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return news;
    }

    @Override
    public List<News> getAllNews(int page, int pageSize) {
        List<News> newsList = new ArrayList<>();
        String sql = "SELECT * FROM news ORDER BY publish_date DESC LIMIT ? OFFSET ?";
        try (Connection conn = DBUtil.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setInt(1, pageSize);
            pstmt.setInt(2, (page - 1) * pageSize);
            ResultSet rs = pstmt.executeQuery();
            while (rs.next()) {
                News news = new News();
                news.setId(rs.getInt("id"));
                news.setTitle(rs.getString("title"));
                news.setContent(rs.getString("content"));
                news.setPublishDate(rs.getTimestamp("publish_date"));
                news.setAuthor(rs.getString("author"));
                newsList.add(news);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return newsList;
    }

    @Override
    public int getNewsCount() {
        String sql = "SELECT COUNT(*) FROM news";
        try (Connection conn = DBUtil.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql);
             ResultSet rs = pstmt.executeQuery()) {
            if (rs.next()) {
                return rs.getInt(1);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return 0;
    }
}