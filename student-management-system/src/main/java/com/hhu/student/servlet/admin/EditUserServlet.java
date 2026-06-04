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

@WebServlet("/admin/edit_user")
public class EditUserServlet extends HttpServlet {
    private UserDAO userDAO;

    @Override
    public void init() throws ServletException {
        userDAO = new UserDAOImpl();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int userId = Integer.parseInt(req.getParameter("id"));
        User user = userDAO.getUserById(userId);
        req.setAttribute("user", user);
        req.getRequestDispatcher("/admin/edit_user.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int userId = Integer.parseInt(req.getParameter("id"));
        String username = req.getParameter("username");
        String password = req.getParameter("password");

        User user = userDAO.getUserById(userId);
        user.setUsername(username);
        if (password != null && !password.isEmpty()) {
            user.setPassword(password); // 在实际应用中，密码应该被加密
        }

        userDAO.updateUser(user);
        resp.sendRedirect("user_management");
    }
}