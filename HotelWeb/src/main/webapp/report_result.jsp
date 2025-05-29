<!DOCTYPE html>
<html>
<head><title>Report Results</title></head>
<body>
<h2>Reservation Report</h2>
<table border="1" cellpadding="5">
    <tr>
        <th>ID</th>
        <th>Customer</th>
        <th>Room</th>
        <th>Check-In</th>
        <th>Check-Out</th>
        <th>Total</th>
    </tr>
    <c:forEach var="r" items="${reportList}">
        <tr>
            <td>${r.reservationID}</td>
            <td>${r.customerName}</td>
            <td>${r.roomNumber}</td>
            <td>${r.checkIn}</td>
            <td>${r.checkOut}</td>
            <td>${r.totalAmount}</td>
        </tr>
    </c:forEach>
</table>
<a href="report_form.jsp">Back to report form</a> | <a href="DisplayReservationsServlet">Back to list</a>
</body>
</html>
