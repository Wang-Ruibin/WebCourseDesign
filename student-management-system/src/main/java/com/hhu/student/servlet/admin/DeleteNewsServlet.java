package com.hhu.student.servlet.admin;

import com.hhu.student.dao.NewsDAO;
import com.hhu.student.dao.NewsDAOImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/admin/delete_news")
public class DeleteNewsServlet extends HttpServlet {
    private NewsDAO newsDAO;

    @Override
    public void init() throws ServletException {
        newsDAO = new NewsDAOImpl();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int newsId = Integer.parseInt(req.getParameter("id"));
        newsDAO.deleteNews(newsId);
        resp.sendRedirect("news_management");
    }
}