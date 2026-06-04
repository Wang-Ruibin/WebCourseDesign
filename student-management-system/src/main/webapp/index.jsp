<%@ page import="java.util.List" %>
<%@ page import="com.hhu.student.model.News" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>首页 - 学生管理系统</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
    <style>
        .welcome-section {
            text-align: center;
            padding: 50px 20px;
            background-color: #0a2a5c;
            color: white;
        }
        .welcome-section h1 {
            margin: 0;
            font-size: 2.5em;
        }
        .latest-news-section {
            padding: 40px 0;
        }
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
            overflow: hidden;
            text-overflow: ellipsis;
            display: -webkit-box;
            -webkit-line-clamp: 3; /* Show 3 lines */
            -webkit-box-orient: vertical;
        }
        .more-news-link {
            display: block;
            text-align: center;
            margin-top: 20px;
            font-weight: bold;
            color: #d93a3e;
        }
    </style>
</head>
<body>
    <jsp:include page="header.jsp" />

    <div class="welcome-section">
        <h1>欢迎来到学生管理系统</h1>
        <p>一个集成了新闻发布与学生信息管理的多功能平台。</p>
    </div>

    <div class="main-container">
        <div class="latest-news-section">
            <h2>最新新闻</h2>
            <%
                List<News> latestNews = (List<News>) request.getAttribute("latestNews");
                if (latestNews != null && !latestNews.isEmpty()) {
                    for (News news : latestNews) {
            %>
            <div class="news-item">
                <h3><a href="news_detail?id=<%= news.getId() %>"><%= news.getTitle() %></a></h3>
                <p class="news-meta">
                    <strong>作者:</strong> <%= news.getAuthor() %> | <strong>发布日期:</strong> <%= new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm").format(news.getPublishDate()) %>
                </p>
                <div class="news-content-preview">
                    <%= news.getContent() %>
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
            <a href="news_list" class="more-news-link">查看所有新闻 &raquo;</a>
        </div>
    </div>

</body>
</html>