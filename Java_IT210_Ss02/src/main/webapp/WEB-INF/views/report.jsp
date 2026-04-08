<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<%-- Báo cáo điểm sinh viên --%>

<html>
<head>
    <title>Báo cáo điểm sinh viên</title>
</head>
<body>

<h2>Danh sách sinh viên</h2>

<table border="1">
    <tr>
        <th>Mã SV</th>
        <th>Họ tên</th>
        <th>Điểm</th>
        <th>Xếp loại</th>
    </tr>

    <c:forEach var="student" items="${students}">
        <tr>
            <td><c:out value="${student.id}" /></td>
            <td><c:out value="${student.name}" /></td>
            <td><c:out value="${student.score}" /></td>
            <td>
                <c:choose>
                    <c:when test="${student.score >= 8}">
                        Giỏi
                    </c:when>
                    <c:when test="${student.score >= 6.5}">
                        Khá
                    </c:when>
                    <c:otherwise>
                        Trung bình
                    </c:otherwise>
                </c:choose>
            </td>
        </tr>
    </c:forEach>
</table>

</body>
</html>