<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>发布新新闻 - 学生管理系统</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
</head>
<body>
    <jsp:include page="../header.jsp" />

    <div class="main-container">
        <div class="form-container">
            <h2>发布新新闻</h2>
            <form action="add_news" method="post">
                <table>
                    <tr>
                        <td><label for="title">标题:</label></td>
                    </tr>
                    <tr>
                        <td><input type="text" id="title" name="title" size="50" required /></td>
                    </tr>
                    <tr>
                        <td><label for="author">作者:</label></td>
                    </tr>
                    <tr>
                        <td><input type="text" id="author" name="author" required /></td>
                    </tr>
                    <tr>
                        <td valign="top"><label for="content">内容:</label></td>
                    </tr>
                    <tr>
                        <td><textarea id="content" name="content" rows="15" cols="50" required></textarea></td>
                    </tr>
                    <tr>
                        <td><input type="submit" value="发布新闻" /></td>
                    </tr>
                </table>
            </form>
            <br>
            <a href="${pageContext.request.contextPath}/admin/news_management" class="back-link">&laquo; 返回新闻管理</a>
        </div>
    </div>

</body>
</html>