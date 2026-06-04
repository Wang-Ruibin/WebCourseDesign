package com.hhu.student.servlet.admin;

import com.hhu.student.dao.UserDAO;
import com.hhu.student.dao.UserDAOImpl;
import com.hhu.student.model.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/admin/user_management")
public class UserManagementServlet extends HttpServlet {
    private UserDAO userDAO;
    private static final int PAGE_SIZE = 10; // 每页显示10条记录

    @Override
    public void init() throws ServletException {
        userDAO = new UserDAOImpl();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String pageStr = req.getParameter("page");
        int page = (pageStr == null) ? 1 : Integer.parseInt(pageStr);

        List<User> userList = userDAO.getAllUsers(page, PAGE_SIZE);
        int totalUsers = userDAO.getUserCount();
        int totalPages = (int) Math.ceil((double) totalUsers / PAGE_SIZE);

        req.setAttribute("userList", userList);
        req.setAttribute("currentPage", page);
        req.setAttribute("totalPages", totalPages);
        req.getRequestDispatcher("/admin/user_management.jsp").forward(req, resp);
    }
}