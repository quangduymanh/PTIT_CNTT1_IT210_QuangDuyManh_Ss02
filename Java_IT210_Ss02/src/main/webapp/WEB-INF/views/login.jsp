<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ include file="header.jsp" %>

<c:url var="loginUrl" value="/login" />

<h2>Dang nhap</h2>

<c:if test="${not empty errorMessage}">
    <p class="error"><c:out value="${errorMessage}" /></p>
</c:if>

<form action="${loginUrl}" method="post">
    <div class="field">
        <label for="username">Username</label>
        <input id="username" type="text" name="username" required>
    </div>
    <div class="field">
        <label for="password">Password</label>
        <input id="password" type="password" name="password" required>
    </div>
    <button class="button" type="submit">Dang nhap</button>
</form>

<%@ include file="footer.jsp" %>
