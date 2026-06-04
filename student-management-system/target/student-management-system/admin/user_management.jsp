<%@ page import="java.util.List" %>
<%@ page import="com.hhu.student.model.User" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>用户管理 - 学生管理系统</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/admin_table.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/pagination.css">
</head>
<body>
    <jsp:include page="../header.jsp" />

    <div class="main-container">
        <h2>用户管理</h2>
        <table class="admin-table">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>用户名</th>
                    <th>操作</th>
                </tr>
            </thead>
            <tbody>
                <%
                    List<User> userList = (List<User>) request.getAttribute("userList");
                    if (userList != null && !userList.isEmpty()) {
                        for (User user : userList) {
                %>
                <tr>
                    <td><%= user.getId() %></td>
                    <td><%= user.getUsername() %></td>
                    <td>
                        <a href="edit_user?id=<%= user.getId() %>" class="action-link edit">编辑</a>
                        <a href="delete_user?id=<%= user.getId() %>" class="action-link delete" onclick="return confirm('您确定要删除这个用户吗？');">删除</a>
                    </td>
                </tr>
                <%
                        }
                    } else {
                %>
                <tr>
                    <td colspan="3">没有用户。</td>
                </tr>
                <%
                    }
                %>
            </tbody>
        </table>

        <jsp:include page="../pagination.jsp" />

        <br>
        <a href="${pageContext.request.contextPath}/admin/index.jsp" class="back-link">&laquo; 返回管理后台</a>
    </div>

</body>
</html>