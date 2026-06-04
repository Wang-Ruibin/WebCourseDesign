# 🎓 学生管理系统

> 河海大学 信息管理与信息系统专业 2023级 Web技术课程设计

一个基于 Java Servlet + JSP + MySQL 的学生信息管理与新闻发布系统。

---

## ✨ 功能特性

### 前台功能
- 🏠 **首页展示** — 欢迎页面 + 最新新闻预览
- 📰 **新闻浏览** — 新闻列表（分页）、新闻详情查看
- 👤 **用户系统** — 用户注册、登录、退出登录

### 后台管理（需登录）
- 👥 **用户管理** — 查看、编辑、删除用户
- 📝 **新闻管理** — 新闻的增删改查
- 🔒 **权限控制** — 未登录用户自动跳转至登录页

### 安全特性
- 🛡️ HTTP 安全头（`X-Content-Type-Options: nosniff`）
- 🔐 基于 Session 的身份认证
- 🚫 未授权访问拦截（SecurityFilter）

---

## 🛠️ 技术栈

| 层次 | 技术 |
|------|------|
| **前端** | JSP + JSTL + CSS |
| **后端** | Java Servlet (JDK 8) |
| **数据库** | MySQL 8.0 |
| **构建工具** | Maven |
| **服务器** | Tomcat (Servlet 3.1) |

---

## 📁 项目结构

```
student-management-system/
├── src/main/
│   ├── java/com/hhu/student/
│   │   ├── dao/                  # 数据访问层
│   │   │   ├── UserDAO.java
│   │   │   ├── UserDAOImpl.java
│   │   │   ├── NewsDAO.java
│   │   │   └── NewsDAOImpl.java
│   │   ├── model/                # 实体类
│   │   │   ├── User.java
│   │   │   └── News.java
│   │   ├── servlet/              # Servlet 控制器
│   │   │   ├── LoginServlet.java
│   │   │   ├── RegisterServlet.java
│   │   │   ├── LogoutServlet.java
│   │   │   ├── HomeServlet.java
│   │   │   ├── NewsListServlet.java
│   │   │   ├── NewsDetailServlet.java
│   │   │   └── admin/            # 后台管理 Servlet
│   │   │       ├── UserManagementServlet.java
│   │   │       ├── NewsManagementServlet.java
│   │   │       ├── AddNewsServlet.java
│   │   │       ├── EditNewsServlet.java
│   │   │       ├── DeleteNewsServlet.java
│   │   │       ├── EditUserServlet.java
│   │   │       └── DeleteUserServlet.java
│   │   ├── filter/               # 过滤器
│   │   │   └── SecurityFilter.java
│   │   └── util/                 # 工具类
│   │       └── DBUtil.java
│   └── webapp/                   # Web 资源
│       ├── css/                  # 样式文件
│       ├── admin/                # 后台管理页面
│       ├── header.jsp
│       ├── index.jsp
│       ├── login.jsp
│       ├── register.jsp
│       ├── news_list.jsp
│       ├── news_detail.jsp
│       ├── pagination.jsp
│       └── WEB-INF/web.xml
├── database.sql                  # 数据库初始化脚本
└── pom.xml                       # Maven 配置
```

---

## 🚀 快速开始

### 环境要求

- JDK 8+
- Maven 3.6+
- MySQL 8.0+
- Tomcat 8.5+ / 9.x

### 1. 初始化数据库

```bash
mysql -u root -p < database.sql
```

### 2. 修改数据库配置

编辑 `DBUtil.java`，修改数据库连接信息：

```java
// src/main/java/com/hhu/student/util/DBUtil.java
private static final String URL = "jdbc:mysql://localhost:3306/student_db";
private static final String USERNAME = "your_username";
private static final String PASSWORD = "your_password";
```

### 3. 构建项目

```bash
cd student-management-system
mvn clean package
```

### 4. 部署运行

将 `target/student-management-system.war` 复制到 Tomcat 的 `webapps/` 目录，启动 Tomcat 后访问：

```
http://localhost:8080/student-management-system/
```

---

## 📸 页面预览

| 页面 | 说明 |
|------|------|
| 首页 | 欢迎页面 + 最新新闻 |
| 登录/注册 | 用户认证 |
| 新闻列表 | 分页展示所有新闻 |
| 管理后台 | 用户管理 + 新闻管理 |

## 🎬 演示视频

项目根目录下附有演示视频 `演示视频.mp4`，展示了系统的主要功能和操作流程，包括：

- 用户注册与登录
- 新闻浏览与详情查看
- 后台管理（用户管理、新闻增删改查）

可直接播放观看完整演示。

---

## 📄 数据库设计

### users 表

| 字段 | 类型 | 说明 |
|------|------|------|
| id | INT | 主键，自增 |
| username | VARCHAR(50) | 用户名，唯一 |
| password | VARCHAR(50) | 密码 |

### news 表

| 字段 | 类型 | 说明 |
|------|------|------|
| id | INT | 主键，自增 |
| title | VARCHAR(255) | 新闻标题 |
| content | TEXT | 新闻内容 |
| publish_date | DATETIME | 发布时间 |
| author | VARCHAR(50) | 作者 |

---

## ⚠️ 注意事项

- 本项目为课程设计作品，仅供学习参考
- 密码存储采用明文方式，实际生产环境请使用加密存储（如 BCrypt）
- 默认数据库配置需根据实际环境修改

---

## 📜 开源协议

本项目仅供学习交流使用。

---

<div align="center">

**⭐ 如果这个项目对你有帮助，就点个 Star 支持一下吧~ ⭐**

*你的每一个 Star 都是对我最大的鼓励 (ﾉ◕ヮ◕)ﾉ*:･ﾟ✧

</div>
