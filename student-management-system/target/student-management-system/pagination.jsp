<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:if test="${totalPages > 1}">
    <ul class="pagination">
        <%-- Previous Page Link --%>
        <li class="${currentPage == 1 ? 'disabled' : ''}">
            <a href="?page=${currentPage - 1}">&laquo;</a>
        </li>

        <%-- Page Number Links --%>
        <c:forEach begin="1" end="${totalPages}" var="i">
            <li class="${currentPage == i ? 'active' : ''}">
                <a href="?page=${i}">${i}</a>
            </li>
        </c:forEach>

        <%-- Next Page Link --%>
        <li class="${currentPage == totalPages ? 'disabled' : ''}">
            <a href="?page=${currentPage + 1}">&raquo;</a>
        </li>
    </ul>
</c:if>