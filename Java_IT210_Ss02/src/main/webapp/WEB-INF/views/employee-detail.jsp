<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<%@ include file="header.jsp" %>

<c:url var="employeesUrl" value="/employees" />

<h2>Chi tiet nhan vien</h2>

<div class="detail-grid">
    <div>Ma NV</div>
    <div><c:out value="${emp.code}" /></div>

    <div>Ho ten</div>
    <div><c:out value="${emp.name}" /></div>

    <div>Phong ban</div>
    <div><c:out value="${emp.department}" /></div>

    <div>Luong</div>
    <div>
        <c:choose>
            <c:when test="${sessionScope.role == 'hr_manager'}">
                <fmt:formatNumber value="${emp.salary}" type="number" groupingUsed="true" /> VND
            </c:when>
            <c:otherwise>
                <c:out value="***" />
            </c:otherwise>
        </c:choose>
    </div>

    <div>Ngay vao lam</div>
    <div><fmt:formatDate value="${emp.joinDate}" pattern="dd/MM/yyyy" /></div>

    <div>Trang thai</div>
    <div><c:out value="${emp.status}" /></div>
</div>

<div class="actions">
    <a class="button" href="${employeesUrl}">Quay lai</a>
</div>

<%@ include file="footer.jsp" %>
