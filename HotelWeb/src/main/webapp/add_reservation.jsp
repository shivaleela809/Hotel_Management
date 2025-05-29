<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    String method = request.getMethod();
    if ("POST".equalsIgnoreCase(method)) {
        // In a real app, you'd validate and save reservation here
        out.println("<h2>Reservation added successfully!</h2>");
    } else {
%>
<form method="post" action="AddReservation.jsp">
    Name: <input type="text" name="name" required><br>
    Date: <input type="date" name="date" required><br>
    <input type="submit" value="Add Reservation">
</form>
<%
    }
%>
