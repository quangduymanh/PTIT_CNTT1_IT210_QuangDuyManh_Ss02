# Security Report - JSTL, EL và phòng thủ XSS

## 1) XSS là gì?
XSS (Cross-Site Scripting) là lỗ hổng cho phép kẻ tấn công chèn mã JavaScript độc hại vào dữ liệu đầu vào và hiển thị lại trên trình duyệt người dùng.

Ví dụ input:
<script>alert(1)</script>

Nếu hiển thị trực tiếp bằng `${keyword}`, trình duyệt có thể thực thi script.

Dùng:

<c:out value="${keyword}" />

sẽ tự động escape thành:

&lt;script&gt;alert(1)&lt;/script&gt;

nên trình duyệt chỉ hiển thị text, không chạy popup.

---

## 2) Khác nhau giữa `<c:if>` và `<c:choose>`
- `<c:if>`: dùng cho điều kiện đơn lẻ
- `<c:choose>`: dùng cho nhiều nhánh if / else if / else

Trong bài này:
- Giá vé: nên dùng `<c:choose>` vì có 2 nhánh
- Vé còn lại: nên dùng `<c:choose>` vì có nhiều mức
    - hết vé
    - sắp hết
    - còn nhiều

---

## 3) `<c:url>` giải quyết vấn đề gì?
`<c:url>` tự động thêm đúng context path của project.

Ví dụ:

<c:url value="/events/${event.id}/book"/>

Nếu deploy ở:

/ticketing

thì link tự thành:

/ticketing/events/1/book

Nếu hardcode:

href="/events/1/book"

thì khi deploy khác context path sẽ bị lỗi 404.