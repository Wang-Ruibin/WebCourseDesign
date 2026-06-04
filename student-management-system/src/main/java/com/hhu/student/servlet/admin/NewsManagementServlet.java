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
import java.util.List;

@WebServlet("/admin/news_management")
public class NewsManagementServlet extends HttpServlet {
    private NewsDAO newsDAO;
    private static final int PAGE_SIZE = 10;

    @Override
    public void init() throws ServletException {
        newsDAO = new NewsDAOImpl();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String pageStr = req.getParameter("page");
        int page = (pageStr == null) ? 1 : Integer.parseInt(pageStr);

        List<News> newsList = newsDAO.getAllNews(page, PAGE_SIZE);
        int totalNews = newsDAO.getNewsCount();
        int totalPages = (int) Math.ceil((double) totalNews / PAGE_SIZE);

        req.setAttribute("newsList", newsList);
        req.setAttribute("currentPage", page);
        req.setAttribute("totalPages", totalPages);
        req.getRequestDispatcher("/admin/news_management.jsp").forward(req, resp);
    }
}