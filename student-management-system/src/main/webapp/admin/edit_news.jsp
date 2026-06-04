<%@ page import="com.hhu.student.model.News" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>编辑新闻 - 学生管理系统</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
</head>
<body>
    <jsp:include page="../header.jsp" />

    <div class="main-container">
        <div class="form-container">
            <h2>编辑新闻</h2>
            <%
                News news = (News) request.getAttribute("news");
                if (news != null) {
            %>
            <form action="edit_news" method="post">
                <input type="hidden" name="id" value="<%= news.getId() %>">
                <table>
                    <tr>
                        <td><label for="title">标题:</label></td>
                    </tr>
                    <tr>
                        <td><input type="text" id="title" name="title" size="50" value="<%= news.getTitle() %>" required /></td>
                    </tr>
                    <tr>
                        <td><label for="author">作者:</label></td>
                    </tr>
                    <tr>
                        <td><input type="text" id="author" name="author" value="<%= news.getAuthor() %>" required /></td>
                    </tr>
                    <tr>
                        <td valign="top"><label for="content">内容:</label></td>
                    </tr>
                    <tr>
                        <td><textarea id="content" name="content" rows="15" cols="50" required><%= news.getContent() %></textarea></td>
                    </tr>
                    <tr>
                        <td><input type="submit" value="更新新闻" /></td>
                    </tr>
                </table>
            </form>
            <%
                } else {
            %>
            <p>未找到该新闻。</p>
            <%
                }
            %>
            <br>
            <a href="${pageContext.request.contextPath}/admin/news_management" class="back-link">&laquo; 返回新闻管理</a>
        </div>
    </div>

</body>
</html>