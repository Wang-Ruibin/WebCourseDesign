package com.hhu.student.dao;

import com.hhu.student.model.News;
import java.util.List;

public interface NewsDAO {
    void addNews(News news);
    void updateNews(News news);
    void deleteNews(int newsId);
    News getNewsById(int newsId);
    List<News> getAllNews(int page, int pageSize);
    int getNewsCount();
}