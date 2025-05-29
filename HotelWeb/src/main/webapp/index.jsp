<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <title>Hotel Management System - Home</title>
    <style>
        body { font-family: Arial, sans-serif; margin: 20px; }
        nav a { margin: 0 10px; font-size: 18px; text-decoration: none; color: #007BFF; }
        nav a:hover, nav a:focus { text-decoration: underline; outline: none; }
    </style>
</head>
<body>
    <h1>Welcome to Hotel Management System</h1>
    <nav aria-label="Main Navigation">
        <a href="reservationadd.jsp">Add Reservation</a> |
        <a href="DisplayReservationsServlet">View Reservations</a> |
        <a href="reports.jsp">Reports</a>
    <a href="${pageContext.request.contextPath}/reservationadd.jsp">Add Reservation</a> |
<a href="${pageContext.request.contextPath}/DisplayReservationsServlet">View Reservations</a> |
<a href="${pageContext.request.contextPath}/reports.jsp">Reports</a>
    </nav>
</body>
</html>
