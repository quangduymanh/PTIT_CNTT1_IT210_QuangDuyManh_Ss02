<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<c:url var="loginUrl" value="/login" />
<c:url var="employeesUrl" value="/employees" />
<c:url var="logoutUrl" value="/logout" />

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Mini Portal Nhan su</title>
    <style>
        body { font-family: Arial, sans-serif; margin: 0; background: #f5f7fb; color: #1f2937; }
        .shell { max-width: 1100px; margin: 0 auto; padding: 24px; }
        .panel { background: #ffffff; border: 1px solid #dbe3ee; border-radius: 12px; padding: 20px; }
        .topbar { display: flex; justify-content: space-between; align-items: center; margin-bottom: 20px; }
        .brand { font-size: 24px; font-weight: 700; margin: 0; }
        .nav { display: flex; gap: 16px; align-items: center; flex-wrap: wrap; }
        .nav a { color: #0f4c81; text-decoration: none; font-weight: 600; }
        .muted { color: #6b7280; }
        .badge { display: inline-block; padding: 4px 10px; border-radius: 999px; color: #ffffff; font-size: 12px; font-weight: 700; }
        .badge-green { background: #1f9d55; }
        .badge-orange { background: #dd6b20; }
        .badge-blue { background: #2563eb; }
        .table { width: 100%; border-collapse: collapse; margin-top: 16px; }
        .table th, .table td { border: 1px solid #dbe3ee; padding: 10px; text-align: left; vertical-align: top; }
        .table th { background: #eef4fb; }
        .error { color: #b91c1c; margin: 12px 0; font-weight: 600; }
        .actions { margin-top: 16px; display: flex; gap: 12px; }
        .button { display: inline-block; background: #0f4c81; color: #ffffff; text-decoration: none; border: none; border-radius: 8px; padding: 10px 14px; cursor: pointer; }
        .field { margin-bottom: 12px; }
        .field label { display: block; font-weight: 600; margin-bottom: 6px; }
        .field input { width: 100%; max-width: 360px; padding: 10px; border: 1px solid #cbd5e1; border-radius: 8px; }
        .summary { margin-top: 16px; font-weight: 700; }
        .detail-grid { display: grid; grid-template-columns: 180px 1fr; gap: 10px 16px; }
    </style>
</head>
<body>
<div class="shell">
    <div class="panel">
        <div class="topbar">
            <h1 class="brand">Mini Portal Nhan su</h1>
            <div class="nav">
                <c:choose>
                    <c:when test="${not empty sessionScope.loggedUser}">
                        <span>Xin chao, <c:out value="${sessionScope.loggedUser}" /></span>
                        <a href="${employeesUrl}">Danh sach nhan vien</a>
                        <c:if test="${sessionScope.role == 'hr_manager'}">
                            <span class="muted">Manager mode</span>
                        </c:if>
                        <a href="${logoutUrl}">Dang xuat</a>
                    </c:when>
                    <c:otherwise>
                        <a href="${loginUrl}">Dang nhap</a>
                    </c:otherwise>
                </c:choose>
            </div>
        </div>
