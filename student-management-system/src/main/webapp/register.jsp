<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>用户注册 - 学生管理系统</title>
    <link rel="stylesheet" href="css/style.css">
    <script>
        function validateForm() {
            var password = document.forms["registrationForm"]["password"].value;
            var confirmPassword = document.forms["registrationForm"]["confirmPassword"].value;
            if (password !== confirmPassword) {
                alert("两次输入的密码不一致，请重新输入。");
                return false;
            }
            return true;
        }
    </script>
</head>
<body>
    <jsp:include page="header.jsp" />

    <div class="main-container">
        <div class="form-container">
            <h2>用户注册</h2>
            <form name="registrationForm" action="register" method="post" onsubmit="return validateForm()">
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
                        <td><input type="password" id="password" name="password" autocomplete="new-password" required /></td>
                    </tr>
                    <tr>
                        <td><label for="confirmPassword">确认密码:</label></td>
                    </tr>
                    <tr>
                        <td><input type="password" id="confirmPassword" name="confirmPassword" autocomplete="new-password" required /></td>
                    </tr>
                    <tr>
                        <td><input type="submit" value="注册" /></td>
                    </tr>
                </table>
            </form>
            <div class="link">
                <p><a href="login.jsp">已有账户？点击这里登录。</a></p>
            </div>
        </div>
    </div>
</body>
</body>
</html>