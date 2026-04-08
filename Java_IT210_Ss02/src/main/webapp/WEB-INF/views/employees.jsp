<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<%@ taglib prefix="fn" uri="jakarta.tags.functions" %>
<%@ include file="header.jsp" %>

<h2>Danh sach nhan vien</h2>
<p class="muted">Tong so nhan vien: <c:out value="${fn:length(employees)}" /></p>

<table class="table">
    <tr>
        <th>STT</th>
        <th>Ma NV</th>
        <th>Ho ten</th>
        <th>Phong ban</th>
        <th>Luong</th>
        <th>Ngay vao lam</th>
        <th>Trang thai</th>
        <th>Chi tiet</th>
    </tr>

    <c:forEach var="emp" items="${employees}" varStatus="loop">
        <c:url var="detailUrl" value="/employees/${emp.code}" />
        <tr>
            <td><c:out value="${loop.count}" /></td>
            <td><c:out value="${emp.code}" /></td>
            <td><c:out value="${emp.name}" /></td>
            <td><c:out value="${emp.department}" /></td>
            <td><fmt:formatNumber value="${emp.salary}" type="number" groupingUsed="true" /> VND</td>
            <td><fmt:formatDate value="${emp.joinDate}" pattern="dd/MM/yyyy" /></td>
            <td>
                <c:choose>
                    <c:when test="${emp.status == 'Dang lam'}">
                        <span class="badge badge-green"><c:out value="${emp.status}" /></span>
                    </c:when>
                    <c:when test="${emp.status == 'Nghi phep'}">
                        <span class="badge badge-orange"><c:out value="${emp.status}" /></span>
                    </c:when>
                    <c:otherwise>
                        <span class="badge badge-blue"><c:out value="${emp.status}" /></span>
                    </c:otherwise>
                </c:choose>
            </td>
            <td><a href="${detailUrl}">Xem chi tiet</a></td>
        </tr>
    </c:forEach>
</table>

<p class="summary">
    Tong luong phong Ky thuat:
    <fmt:formatNumber value="${techTotalSalary}" type="number" groupingUsed="true" /> VND
</p>

<%@ include file="footer.jsp" %>
