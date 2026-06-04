<%@ page import="java.util.List" %>
<%@ page import="com.hhu.student.model.News" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>新闻管理 - 学生管理系统</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/admin_table.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/pagination.css">
</head>
<body>
    <jsp:include page="../header.jsp" />

    <div class="main-container">
        <h2>新闻管理</h2>
        <p><a href="add_news.jsp" class="action-link edit" style="display: inline-block; margin-bottom: 20px;">发布新新闻</a></p>
        <table class="admin-table">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>标题</th>
                    <th>作者</th>
                    <th>发布日期</th>
                    <th>操作</th>
                </tr>
            </thead>
            <tbody>
                <%
                    List<News> newsList = (List<News>) request.getAttribute("newsList");
                    if (newsList != null && !newsList.isEmpty()) {
                        for (News news : newsList) {
                %>
                <tr>
                    <td><%= news.getId() %></td>
                    <td><%= news.getTitle() %></td>
                    <td><%= news.getAuthor() %></td>
                    <td><%= new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm").format(news.getPublishDate()) %></td>
                    <td>
                        <a href="edit_news?id=<%= news.getId() %>" class="action-link edit">编辑</a>
                        <a href="delete_news?id=<%= news.getId() %>" class="action-link delete" onclick="return confirm('您确定要删除这篇新闻吗？');">删除</a>
                    </td>
                </tr>
                <%
                        }
                    } else {
                %>
                <tr>
                    <td colspan="5">暂无新闻。</td>
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