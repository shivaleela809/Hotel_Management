<%@ page import="com.hotel.dao.ReservationDAO" %>
<%@ page import="com.hotel.model.Reservation" %>
<%@ page import="java.time.format.DateTimeFormatter" %>
<%
    String idStr = request.getParameter("reservationID");
    if (idStr == null) {
        response.sendRedirect("DisplayReservationsServlet");
        return;
    }
    int id = Integer.parseInt(idStr);
    ReservationDAO dao = new ReservationDAO();
    Reservation r = dao.getReservationById(id);
    if (r == null) {
        out.println("<h3>Reservation not found</h3>");
        return;
    }
    DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
%>

<!DOCTYPE html>
<html>
<head><title>Edit Reservation</title></head>
<body>
<h2>Edit Reservation</h2>
<form method="post" action="UpdateReservationServlet">
    <input type="hidden" name="reservationID" value="<%=r.getReservationID()%>"/>
    Customer Name: <input type="text" name="customerName" value="<%=r.getCustomerName()%>" required/><br/>
    Room Number: <input type="text" name="roomNumber" value="<%=r.getRoomNumber()%>" required/><br/>
    Check-In Date: <input type="date" name="checkIn" value="<%=r.getCheckIn().format(formatter)%>" required/><br/>
    Check-Out Date: <input type="date" name="checkOut" value="<%=r.getCheckOut().format(formatter)%>" required/><br/>
    Total Amount: <input type="number" step="0.01" name="totalAmount" value="<%=r.getTotalAmount()%>" required/><br/>
    <input type="submit" value="Update Reservation"/>
</form>
<a href="DisplayReservationsServlet">Back to list</a>
</body>
</html>
