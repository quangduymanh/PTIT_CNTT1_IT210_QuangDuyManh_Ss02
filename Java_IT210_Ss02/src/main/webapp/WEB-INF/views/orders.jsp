<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>

<h2>Xin chào, ${sessionScope.loggedUser}! Vai trò: ${sessionScope.role}</h2>

<table border="1">
    <tr>
        <th>Mã đơn</th>
        <th>Sản phẩm</th>
        <th>Tổng tiền</th>
        <th>Ngày đặt</th>
    </tr>

    <c:forEach var="o" items="${orders}">
        <tr>
            <td>${o.code}</td>
            <td>${o.productName}</td>
            <td>
                <fmt:formatNumber value="${o.total}" type="number"/> VNĐ
            </td>
            <td>
                <fmt:formatDate value="${o.orderDate}" pattern="dd/MM/yyyy"/>
            </td>
        </tr>
    </c:forEach>
</table>

<p>
    Tổng lượt xem đơn hàng toàn hệ thống:
    ${applicationScope.totalViewCount.get()}
</p>

<a href="logout">Đăng xuất</a>