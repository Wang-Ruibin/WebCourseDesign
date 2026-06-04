package com.hhu.student.servlet.admin;

import com.hhu.student.dao.NewsDAO;
import com.hhu.student.dao.NewsDAOImpl;
import com.hhu.student.model.News;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Date;

@WebServlet("/admin/add_news")
public class AddNewsServlet extends HttpServlet {
    private NewsDAO newsDAO;

    @Override
    public void init() throws ServletException {
        newsDAO = new NewsDAOImpl();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("/admin/add_news.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        String title = req.getParameter("title");
        String content = req.getParameter("content");
        String author = req.getParameter("author");

        News news = new News();
        news.setTitle(title);
        news.setContent(content);
        news.setAuthor(author);
        news.setPublishDate(new Date());

        newsDAO.addNews(news);
        resp.sendRedirect("news_management");
    }
}