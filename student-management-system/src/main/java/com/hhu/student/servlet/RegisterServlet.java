package com.hhu.student.servlet;

import com.hhu.student.dao.UserDAO;
import com.hhu.student.dao.UserDAOImpl;
import com.hhu.student.model.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/register")
public class RegisterServlet extends HttpServlet {
    private UserDAO userDAO;

    @Override
    public void init() throws ServletException {
        userDAO = new UserDAOImpl();
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String username = req.getParameter("username");
        String password = req.getParameter("password");

        // 检查用户名是否已存在
        if (userDAO.getUserByUsername(username) != null) {
            req.setAttribute("errorMessage", "Username already exists. Please choose another one.");
            req.getRequestDispatcher("register.jsp").forward(req, resp);
            return;
        }

        User user = new User();
        user.setUsername(username);
        user.setPassword(password); // 在实际应用中，密码应该被加密

        userDAO.addUser(user);

        resp.sendRedirect("login.jsp");
    }
}