<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>管理后台 - 学生管理系统</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
    <style>
        .admin-menu {
            list-style: none;
            padding: 0;
        }
        .admin-menu li {
            margin: 15px 0;
        }
        .admin-menu a {
            display: block;
            padding: 15px;
            background-color: #0a2a5c;
            color: white;
            text-decoration: none;
            border-radius: 5px;
            transition: background-color 0.3s;
        }
        .admin-menu a:hover {
            background-color: #d93a3e;
        }
    </style>
</head>
<body>
    <jsp:include page="../header.jsp" />

    <div class="main-container">
        <h2>管理后台</h2>
        <p>欢迎, ${sessionScope.user.username}!</p>
        <ul class="admin-menu">
            <li><a href="${pageContext.request.contextPath}/admin/user_management">用户管理</a></li>
            <li><a href="${pageContext.request.contextPath}/admin/news_management">新闻管理</a></li>
        </ul>
    </div>

</body>
</html>