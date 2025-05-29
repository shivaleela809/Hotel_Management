<!DOCTYPE html>
<html>
<head><title>Reservations List</title></head>
<body>
<h2>Reservations</h2>
<a href="add_reservation.jsp">Add New Reservation</a><br/><br/>
<table border="1" cellpadding="5">
    <tr>
        <th>ID</th>
        <th>Customer</th>
        <th>Room</th>
        <th>Check-In</th>
        <th>Check-Out</th>
        <th>Total</th>
        <th>Actions</th>
    </tr>
    <c:forEach var="r" items="${reservations}">
        <tr>
            <td>${r.reservationID}</td>
            <td>${r.customerName}</td>
            <td>${r.roomNumber}</td>
            <td>${r.checkIn}</td>
            <td>${r.checkOut}</td>
            <td>${r.totalAmount}</td>
            <td>
                <form method="post" action="DeleteReservationServlet" style="display:inline;">
                    <input type="hidden" name="reservationID" value="${r.reservationID}"/>
                    <input type="submit" value="Delete" onclick="return confirm('Are you sure?')"/>
                </form>
                <form method="get" action="edit_reservation.jsp" style="display:inline;">
                    <input type="hidden" name="reservationID" value="${r.reservationID}"/>
                    <input type="submit" value="Edit"/>
                </form>
            </td>
        </tr>
    </c:forEach>
</table>
<br/>
<a href="report_form.jsp">Generate Report</a>
</body>
</html>
