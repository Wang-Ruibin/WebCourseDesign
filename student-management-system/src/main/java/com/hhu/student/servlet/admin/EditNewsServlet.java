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

@WebServlet("/admin/edit_news")
public class EditNewsServlet extends HttpServlet {
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
        req.getRequestDispatcher("/admin/edit_news.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        int newsId = Integer.parseInt(req.getParameter("id"));
        String title = req.getParameter("title");
        String content = req.getParameter("content");
        String author = req.getParameter("author");

        News news = newsDAO.getNewsById(newsId);
        news.setTitle(title);
        news.setContent(content);
        news.setAuthor(author);
        // Optionally update the publish date upon edit, or keep the original.
        // news.setPublishDate(new Date()); 

        newsDAO.updateNews(news);
        resp.sendRedirect("news_management");
    }
}