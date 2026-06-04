<%@ page import="com.hhu.student.model.User" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>编辑用户 - 学生管理系统</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
</head>
<body>
    <jsp:include page="../header.jsp" />

    <div class="main-container">
        <div class="form-container">
            <h2>编辑用户</h2>
            <%
                User user = (User) request.getAttribute("user");
                if (user != null) {
            %>
            <form action="edit_user" method="post">
                <input type="hidden" name="id" value="<%= user.getId() %>">
                <table>
                    <tr>
                        <td><label for="username">用户名:</label></td>
                    </tr>
                    <tr>
                        <td><input type="text" id="username" name="username" value="<%= user.getUsername() %>" autocomplete="username" required /></td>
                    </tr>
                    <tr>
                        <td><label for="password">新密码 (留空则不修改):</label></td>
                    </tr>
                    <tr>
                        <td><input type="password" id="password" name="password" autocomplete="new-password" /></td>
                    </tr>
                    <tr>
                        <td><input type="submit" value="更新用户" /></td>
                    </tr>
                </table>
            </form>
            <%
                } else {
            %>
            <p>未找到该用户。</p>
            <%
                }
            %>
            <br>
            <a href="${pageContext.request.contextPath}/admin/user_management" class="back-link">&laquo; 返回用户管理</a>
        </div>
    </div>

</body>
</html>