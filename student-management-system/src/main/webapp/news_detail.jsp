<%@ page import="com.hhu.student.model.News" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>新闻详情 - 学生管理系统</title>
    <link rel="stylesheet" href="css/style.css">
    <style>
        .news-detail-container {
            padding: 20px;
        }
        .news-detail-container h2 {
            color: #0a2a5c;
            border-bottom: 2px solid #f0f0f0;
            padding-bottom: 10px;
        }
        .news-meta {
            color: #666;
            font-size: 0.9em;
            margin-bottom: 20px;
        }
        .news-content {
            line-height: 1.8;
            text-align: justify;
        }
        .back-link {
            display: inline-block;
            margin-top: 30px;
            color: #d93a3e;
            text-decoration: none;
        }
        .back-link:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <jsp:include page="header.jsp" />

    <div class="main-container">
        <div class="news-detail-container">
            <%
                News news = (News) request.getAttribute("news");
                if (news != null) {
            %>
            <h2><%= news.getTitle() %></h2>
            <p class="news-meta">
                <strong>作者:</strong> <%= news.getAuthor() %> | <strong>发布日期:</strong> <%= new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm").format(news.getPublishDate()) %>
            </p>
            <div class="news-content">
                <%= news.getContent().replace("\n", "<br>") %>
            </div>
            <%
                } else {
            %>
            <p>未找到该新闻。</p>
            <%
                }
            %>
            <a href="news_list" class="back-link">&laquo; 返回新闻列表</a>
        </div>
    </div>

</body>
</html>