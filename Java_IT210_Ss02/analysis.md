# Phân tích Scope & Implicit Objects

## 1) Vì sao lỗi đăng nhập phải lưu vào Request Scope?
Thông báo lỗi chỉ cần tồn tại trong đúng một lần trả về trang login sau khi submit sai mật khẩu.

Nếu lưu vào Request Scope:
- Chỉ hiển thị đúng 1 lần
- Refresh trang sẽ tự mất

Nếu lưu nhầm vào Session Scope:
- Thông báo lỗi sẽ tồn tại suốt phiên đăng nhập
- Dù đăng nhập đúng sau đó vẫn có thể còn hiện lỗi cũ
- Gây lẫn trạng thái giữa các request

---

## 2) Vì sao totalViewCount phải lưu vào Application Scope?
`totalViewCount` là bộ đếm dùng chung cho toàn hệ thống.

Application Scope:
- Chia sẻ cho tất cả người dùng
- Nhân viên A và B đều nhìn thấy cùng 1 giá trị

Nếu lưu vào Session Scope:
- Mỗi nhân viên có bộ đếm riêng
- A xem 2 lần thấy 2
- B mới vào chỉ thấy 1
- Không đúng yêu cầu tổng toàn hệ thống

---

## 3) Race Condition là gì?
Race Condition là lỗi xảy ra khi nhiều request cùng truy cập và cập nhật một biến dùng chung tại cùng thời điểm.

Đoạn code:

Integer count = (Integer) application.getAttribute("totalViewCount");
if (count == null) count = 0;
count++;
application.setAttribute("totalViewCount", count);

có thể bị lỗi khi 2 người cùng đọc giá trị `5`, cùng tăng lên `6`, rồi cùng ghi lại.

Kết quả:
- Đúng ra phải là `7`
- Nhưng thực tế chỉ thành `6`

## Cách phòng tránh
Dùng `AtomicInteger` hoặc synchronized để tăng an toàn trong môi trường nhiều người dùng đồng thời.