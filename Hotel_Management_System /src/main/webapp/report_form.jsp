<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <title>Reservation Report Form</title>
    <link
        rel="stylesheet"
        href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css"
        crossorigin="anonymous"
    />
    <style>
        :root {
            --prussian-blue: #003153;
            --mustard-yellow: #d4a017;
            --bg-light: #f5f5dc;
            --card-light: rgba(255, 255, 255, 0.95);
            --text-light: #2f2f2f;
            --bg-dark: #1b263b;
            --card-dark: rgba(10, 30, 60, 0.85);
            --text-dark: #e1e1e1;
        }

        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            margin: 0;
            padding: 0;
            min-height: 100vh;
            background: var(--prussian-blue);
            display: flex;
            justify-content: center;
            align-items: center;
            color: var(--text-light);
        }

        .container {
            width: 100%;
            max-width: 700px;
            background-color: var(--card-light);
            padding: 50px;
            box-shadow: 0 10px 25px rgba(0,0,0,0.15);
            border-radius: 15px;
            font-size: 1.2em;
            color: var(--prussian-blue);
        }

        h2 {
            text-align: center;
            color: var(--prussian-blue);
            margin-bottom: 40px;
            font-size: 2em;
        }

        label {
            display: block;
            margin: 25px 0 10px;
            font-weight: 600;
            font-size: 1.2em;
        }

        form {
            display: flex;
            flex-direction: column;
            align-items: center;
        }

        .input-group {
            position: relative;
            width: 100%;
            max-width: 400px;
            margin-bottom: 25px;
        }

        .input-group i {
            position: absolute;
            top: 14px;
            left: 12px;
            color: var(--mustard-yellow);
            font-size: 1.2em;
        }

        select,
        input[type="date"] {
            width: 100%;
            padding: 14px 15px 14px 45px;
            border-radius: 8px;
            border: 1px solid var(--prussian-blue);
            font-size: 1.1em;
            background-color: #fff;
            color: var(--prussian-blue);
            font-weight: 600;
        }

        select:focus,
        input[type="date"]:focus {
            border-color: var(--mustard-yellow);
            outline: none;
            box-shadow: 0 0 6px var(--mustard-yellow);
        }

        input[type="submit"] {
            width: 100%;
            max-width: 400px;
            background-color: var(--mustard-yellow);
            border: none;
            color: var(--prussian-blue);
            font-weight: 700;
            padding: 16px 0;
            margin-top: 30px;
            border-radius: 10px;
            cursor: pointer;
            font-size: 1.3em;
        }

        input[type="submit"]:hover {
            background-color: #b38e0d;
        }

        .error {
            color: red;
            text-align: center;
            margin-top: 20px;
            font-weight: 700;
        }

        @media (max-width: 768px) {
            .container {
                padding: 30px;
                margin: 20px;
            }

            .input-group,
            input[type="submit"] {
                max-width: 100%;
            }
        }
    </style>
</head>
<body>

<div class="container">
    <h2><i class="fas fa-chart-line"></i> Generate Reservation Report</h2>

    <form action="ReportServlet" method="post">
        <label for="reportType">Select Report Type:</label>
        <div class="input-group">
            <i class="fas fa-file-alt"></i>
            <select name="reportType" id="reportType" required>
                <option value="dateRange">Reservations in Date Range</option>
                <option value="mostBookedRooms">Most Frequently Booked Rooms</option>
                <option value="totalRevenue">Total Revenue</option>
            </select>
        </div>

        <label for="startDate">Start Date:</label>
        <div class="input-group">
            <i class="fas fa-calendar-alt"></i>
            <input type="date" name="startDate" id="startDate" required />
        </div>

        <label for="endDate">End Date:</label>
        <div class="input-group">
            <i class="fas fa-calendar-check"></i>
            <input type="date" name="endDate" id="endDate" required />
        </div>

        <input type="submit" value="Generate Report" />
    </form>

    <c:if test="${not empty error}">
        <p class="error">${error}</p>
    </c:if>
</div>

</body>
</html>
