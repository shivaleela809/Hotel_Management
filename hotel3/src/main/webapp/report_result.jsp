<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <title>Report Results - Hotel Reservation System</title>
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;600&display=swap" rel="stylesheet" />
    <style>
        :root {
            --prussian-blue: #003153;
            --prussian-blue-dark: #0b2242;
            --mustard-yellow: #d4a017;
            --card-bg: rgba(255, 255, 255, 0.95);
            --text-dark: #263238;
            --text-light: #003153;
            --hover-bg: #fef6d8;
        }

        body {
            font-family: 'Roboto', sans-serif;
            background-color: var(--prussian-blue);
            color: var(--text-dark);
            margin: 0;
            padding: 40px;
            min-height: 100vh;
            display: flex;
            justify-content: center;
            align-items: flex-start;
        }

        .container {
            max-width: 1000px;
            width: 100%;
            background-color: var(--card-bg);
            padding: 30px 40px;
            border-radius: 15px;
            box-shadow: 0 12px 30px rgba(0,0,0,0.15);
            color: var(--text-light);
        }

        h2 {
            text-align: center;
            font-size: 2em;
            margin-bottom: 40px;
            color: var(--mustard-yellow);
            font-weight: 700;
        }

        h3 {
            margin-top: 40px;
            font-size: 1.5em;
            color: var(--mustard-yellow);
            font-weight: 600;
            border-bottom: 2px solid var(--mustard-yellow);
            padding-bottom: 6px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 15px;
            background-color: white;
            box-shadow: 0 4px 20px rgba(0,0,0,0.1);
            border-radius: 10px;
            overflow: hidden;
            color: var(--prussian-blue);
        }

        th, td {
            padding: 14px 20px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }

        th {
            background-color: var(--mustard-yellow);
            color: var(--prussian-blue);
            font-weight: 700;
            user-select: none;
        }

        td {
            color: var(--prussian-blue);
        }

        tr:hover {
            background-color: var(--hover-bg);
        }

        p {
            font-size: 1.3em;
            font-weight: 600;
            margin-top: 20px;
            color: var(--mustard-yellow);
        }

        a {
            display: inline-block;
            margin-top: 30px;
            font-weight: 700;
            color: var(--mustard-yellow);
            text-decoration: none;
            font-size: 1.1em;
            transition: color 0.3s ease;
            user-select: none;
        }

        a:hover {
            color: #b38e0d;
        }

        @media (max-width: 768px) {
            body {
                padding: 20px;
            }
            .container {
                padding: 20px 25px;
            }
            h2 {
                font-size: 1.6em;
            }
            h3 {
                font-size: 1.3em;
            }
            table, th, td {
                font-size: 0.9em;
            }
            a {
                font-size: 1em;
            }
        }
    </style>
</head>
<body>

<div class="container">
    <h2>Report Results</h2>

    <!-- Reservations List -->
    <c:if test="${not empty reservations}">
        <h3>Reservations:</h3>
        <table>
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Customer</th>
                    <th>Room</th>
                    <th>Check-In</th>
                    <th>Check-Out</th>
                    <th>Amount (Rs.)</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="res" items="${reservations}">
                    <tr>
                        <td>${res.reservationId}</td>
                        <td>${res.customerName}</td>
                        <td>${res.roomNumber}</td>
                        <td>${res.checkIn}</td>
                        <td>${res.checkOut}</td>
                        <td>${res.totalAmount}</td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </c:if>

    <!-- Most Booked Rooms -->
    <c:if test="${not empty roomStats}">
        <h3>Most Booked Rooms:</h3>
        <table>
            <thead>
                <tr>
                    <th>Room Number</th>
                    <th>Bookings</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="room" items="${roomStats}">
                    <tr>
                        <td>${room.RoomNumber}</td>
                        <td>${room.BookingCount}</td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </c:if>

    <!-- Total Revenue -->
    <c:if test="${not empty totalRevenue}">
        <h3>Total Revenue:</h3>
        <p>Rs. ${totalRevenue}</p>
    </c:if>

    <a href="report_form.jsp">← Back to Report Form</a>
</div>

</body>
</html>
