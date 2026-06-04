package com.hhu.student.servlet;

import com.hhu.student.dao.NewsDAO;
import com.hhu.student.dao.NewsDAOImpl;
import com.hhu.student.model.News;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/home")
public class HomeServlet extends HttpServlet {
    private NewsDAO newsDAO;
    private static final int LATEST_NEWS_COUNT = 3; // 在首页显示3条最新新闻

    @Override
    public void init() throws ServletException {
        newsDAO = new NewsDAOImpl();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // 获取最新的新闻
        List<News> latestNews = newsDAO.getAllNews(1, LATEST_NEWS_COUNT);
        req.setAttribute("latestNews", latestNews);
        
        // 转发到 index.jsp 进行展示
        req.getRequestDispatcher("/index.jsp").forward(req, resp);
    }
}