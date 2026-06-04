<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login - 学生管理系统</title>
    <link rel="stylesheet" href="css/style.css">
</head>
<body>
    <jsp:include page="header.jsp" />

    <div class="main-container">
        <div class="form-container">
            <h2>用户登录</h2>
            <%
                String errorMessage = (String) request.getAttribute("errorMessage");
                if (errorMessage != null) {
            %>
                <p class="error-message"><%= errorMessage %></p>
            <%
                }
            %>
            <form action="login" method="post">
                <table>
                    <tr>
                        <td><label for="username">用户名:</label></td>
                    </tr>
                    <tr>
                        <td><input type="text" id="username" name="username" autocomplete="username" required /></td>
                    </tr>
                    <tr>
                        <td><label for="password">密码:</label></td>
                    </tr>
                    <tr>
                        <td><input type="password" id="password" name="password" autocomplete="current-password" required /></td>
                    </tr>
                    <tr>
                        <td><input type="submit" value="登录" /></td>
                    </tr>
                </table>
            </form>
            <div class="link">
                <p><a href="register.jsp">还没有账户？点击这里注册。</a></p>
            </div>
        </div>
    </div>

</body>
</html>