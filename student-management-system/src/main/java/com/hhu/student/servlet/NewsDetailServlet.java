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

@WebServlet("/news_detail")
public class NewsDetailServlet extends HttpServlet {
    private NewsDAO newsDAO;

    @Override
    public void init() throws ServletException {
        newsDAO = new NewsDAOImpl();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int newsId = Integer.parseInt(req.getParameter("id"));
        News news = newsDAO.getNewsById(newsId);
        req.setAttribute("news", news);
        req.getRequestDispatcher("news_detail.jsp").forward(req, resp);
    }
}