<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Reservation List</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" crossorigin="anonymous" />
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;600&display=swap" rel="stylesheet" />
    <style>
        :root {
            --prussian-blue: #003153;
            --mustard-yellow: #d4a017;
            --bg-light: linear-gradient(135deg, #f5f5dc, #e8e8e0);
            --text-light: #2f2f2f;
            --card-light: rgba(255, 255, 255, 0.95);

            --prussian-blue-dark: #0b2242;
            --bg-dark: #1b263b;
            --text-dark: #e1e1e1;
            --card-dark: rgba(10, 30, 60, 0.85);
        }

        body {
            font-family: 'Roboto', sans-serif;
            margin: 0;
            padding: 30px 20px;
            background: var(--bg-light);
            color: var(--text-light);
            transition: all 0.3s ease;
        }

        body.dark {
            background: var(--bg-dark);
            color: var(--text-dark);
        }

        h2 {
            text-align: center;
            margin-bottom: 30px;
            font-size: 2em;
            color: var(--prussian-blue);
        }

        body.dark h2 {
            color: var(--text-dark);
        }

        table {
            border-collapse: collapse;
            width: 95%;
            margin: 0 auto 30px;
            background: var(--card-light);
            box-shadow: 0 6px 18px rgba(0, 0, 0, 0.1);
            border-radius: 12px;
            overflow: hidden;
        }

        body.dark table {
            background: var(--card-dark);
            box-shadow: 0 6px 18px rgba(255, 255, 255, 0.1);
        }

        th, td {
            padding: 12px 16px;
            text-align: center;
            border-bottom: 1px solid #ccc;
        }

        th {
            background-color: var(--prussian-blue);
            color: white;
            font-weight: 600;
        }

        body.dark th {
            background-color: var(--prussian-blue-dark);
        }

        tr:hover {
            background-color: #f1f1f1;
        }

        body.dark tr:hover {
            background-color: #2c3e50;
        }

        .actions a {
            margin: 0 5px;
            padding: 6px 12px;
            border-radius: 5px;
            font-size: 0.9em;
            text-decoration: none;
            font-weight: bold;
            transition: background 0.3s;
        }

        .actions a[href*="update"] {
            background-color: #4caf50;
            color: white;
        }

        .actions a[href*="delete"] {
            background-color: #f44336;
            color: white;
        }

        .actions a:hover {
            opacity: 0.85;
        }

        .nav-links {
            text-align: center;
            margin-top: 20px;
        }

        .nav-links a {
            text-decoration: none;
            margin: 0 10px;
            padding: 10px 16px;
            background-color: var(--prussian-blue);
            color: white;
            border-radius: 8px;
            font-weight: 600;
            transition: background 0.3s ease;
        }

        body.dark .nav-links a {
            background-color: var(--prussian-blue-dark);
        }

        .nav-links a:hover {
            background-color: var(--mustard-yellow);
            color: black;
        }

        .dark-toggle {
            position: fixed;
            top: 20px;
            right: 30px;
            font-size: 1.5em;
            cursor: pointer;
            color: var(--prussian-blue);
        }

        body.dark .dark-toggle {
            color: var(--text-dark);
        }

        .dark-toggle:hover {
            transform: scale(1.2);
            color: var(--mustard-yellow);
        }

        @media (max-width: 600px) {
            th, td {
                font-size: 0.85em;
                padding: 10px;
            }

            .actions a {
                padding: 4px 8px;
            }
        }
    </style>
</head>
<body>

<i class="fas fa-moon dark-toggle" onclick="toggleDarkMode()" title="Toggle Dark Mode"></i>

<h2>All Reservations</h2>

<table>
    <thead>
        <tr>
            <th>Reservation ID</th>
            <th>Customer Name</th>
            <th>Room Number</th>
            <th>Check In</th>
            <th>Check Out</th>
            <th>Total Amount</th>
            <th>Actions</th>
        </tr>
    </thead>
    <tbody>
        <c:choose>
            <c:when test="${not empty reservations}">
                <c:forEach var="res" items="${reservations}">
                    <tr>
                        <td>${res.reservationId}</td>
                        <td>${res.customerName}</td>
                        <td>${res.roomNumber}</td>
                        <td><fmt:formatDate value="${res.checkIn}" pattern="yyyy-MM-dd" /></td>
                        <td><fmt:formatDate value="${res.checkOut}" pattern="yyyy-MM-dd" /></td>
                        <td>Rs. ${res.totalAmount}</td>
                        <td class="actions">
                            <a href="reservationupdate.jsp?reservationId=${res.reservationId}">Edit</a>
                            <a href="reservationdelete.jsp?reservationId=${res.reservationId}" 
                               onclick="return confirm('Are you sure you want to delete this reservation?');">Delete</a>
                        </td>
                    </tr>
                </c:forEach>
            </c:when>
            <c:otherwise>
                <tr><td colspan="7">No reservations found.</td></tr>
            </c:otherwise>
        </c:choose>
    </tbody>
</table>

<div class="nav-links">
    <a href="reservationadd.jsp"><i class="fas fa-plus-circle"></i> Add Reservation</a>
    <a href="index.jsp"><i class="fas fa-home"></i> Home</a>
</div>

<script>
    function toggleDarkMode() {
        document.body.classList.toggle('dark');
        localStorage.setItem('darkMode', document.body.classList.contains('dark'));
    }

    window.onload = function () {
        const dark = localStorage.getItem('darkMode') === 'true';
        if (dark) document.body.classList.add('dark');
    };
</script>

</body>
</html>
