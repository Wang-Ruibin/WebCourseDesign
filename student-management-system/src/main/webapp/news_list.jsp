<%@ page import="java.util.List" %>
<%@ page import="com.hhu.student.model.News" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>新闻列表 - 学生管理系统</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/pagination.css">
    <style>
        .news-item {
            background-color: #fff;
            border: 1px solid #ddd;
            padding: 20px;
            margin-bottom: 20px;
            border-radius: 5px;
        }
        .news-item h3 {
            margin-top: 0;
        }
        .news-item h3 a {
            color: #0a2a5c;
            text-decoration: none;
        }
        .news-item h3 a:hover {
            text-decoration: underline;
        }
        .news-meta {
            color: #666;
            font-size: 0.9em;
            margin-bottom: 10px;
        }
        .news-content-preview {
            color: #333;
            line-height: 1.6;
        }
    </style>
</head>
<body>
    <jsp:include page="header.jsp" />

    <div class="main-container">
        <h2>新闻列表</h2>
        <%
            List<News> newsList = (List<News>) request.getAttribute("newsList");
            if (newsList != null && !newsList.isEmpty()) {
                for (News news : newsList) {
        %>
        <div class="news-item">
            <h3><a href="news_detail?id=<%= news.getId() %>"><%= news.getTitle() %></a></h3>
            <p class="news-meta">
                <strong>作者:</strong> <%= news.getAuthor() %> | <strong>发布日期:</strong> <%= new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm").format(news.getPublishDate()) %>
            </p>
            <div class="news-content-preview">
                <%= news.getContent().replace("\n", "<br>") %>
            </div>
        </div>
        <%
                }
            } else {
        %>
        <p>暂无新闻。</p>
        <%
            }
        %>

        <jsp:include page="pagination.jsp" />
    </div>

</body>
</html>