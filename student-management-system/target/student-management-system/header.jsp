<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<header class="header">
    <div class="logo">
        <a href="${pageContext.request.contextPath}/" style="color: white; text-decoration: none;">学生管理系统</a>
    </div>
    <nav class="nav">
        <a href="${pageContext.request.contextPath}/">首页</a>
        <a href="${pageContext.request.contextPath}/news_list">新闻</a>
        <% if (session.getAttribute("user") != null) { %>
            <a href="${pageContext.request.contextPath}/admin/index.jsp">管理后台</a>
            <a href="${pageContext.request.contextPath}/logout">注销</a>
        <% } else { %>
            <a href="${pageContext.request.contextPath}/login.jsp">登录</a>
            <a href="${pageContext.request.contextPath}/register.jsp">注册</a>
        <% } %>
    </nav>
</header>