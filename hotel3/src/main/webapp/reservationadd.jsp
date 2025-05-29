<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <title>Add Reservation</title>
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;600&display=swap" rel="stylesheet" />
    <style>
        :root {
            --prussian-blue: #003153;
            --mustard-yellow: #d4a017;
            --card-bg: rgba(255, 255, 255, 0.95);
            --text-prussian: #003153;
            --input-border: #bbb;
            --input-focus: #d4a017;
            --btn-bg: #d4a017;
            --btn-bg-hover: #b38e0d;
        }

        body {
            font-family: 'Roboto', sans-serif;
            background-color: var(--prussian-blue);
            margin: 0;
            padding: 40px 20px;
            min-height: 100vh;
            color: var(--text-prussian);
            display: flex;
            flex-direction: column;
            align-items: center;
        }

        h2 {
            font-size: 2.4em;
            margin-bottom: 30px;
            font-weight: 700;
            color: var(--mustard-yellow);
            user-select: none;
        }

        .form-container {
            background-color: var(--card-bg);
            max-width: 500px;
            width: 100%;
            padding: 35px 40px;
            border-radius: 15px;
            box-shadow: 0 6px 20px rgba(0, 0, 0, 0.15);
            user-select: none;
        }

        form {
            display: flex;
            flex-direction: column;
        }

        label {
            margin-top: 15px;
            margin-bottom: 5px;
            font-weight: 600;
            color: var(--prussian-blue);
        }

        input[type="text"],
        input[type="number"],
        input[type="date"] {
            padding: 10px;
            font-size: 1em;
            border: 1px solid var(--input-border);
            border-radius: 6px;
            outline: none;
            color: var(--prussian-blue);
            transition: border-color 0.3s ease;
        }

        input[type="text"]:focus,
        input[type="number"]:focus,
        input[type="date"]:focus {
            border-color: var(--input-focus);
            box-shadow: 0 0 5px var(--input-focus);
        }

        input[type="submit"] {
            margin-top: 30px;
            padding: 14px;
            font-size: 1.1em;
            background-color: var(--btn-bg);
            border: none;
            color: white;
            font-weight: 700;
            border-radius: 8px;
            cursor: pointer;
            transition: background-color 0.3s ease;
            user-select: none;
        }

        input[type="submit"]:hover {
            background-color: var(--btn-bg-hover);
        }

        .back-home {
            margin-top: 35px;
            user-select: none;
        }

        .back-home a {
            color: var(--mustard-yellow);
            font-weight: 700;
            font-size: 1.1em;
            text-decoration: none;
            transition: color 0.3s ease;
        }

        .back-home a:hover {
            color: #b38e0d;
            text-decoration: underline;
        }

        @media (max-width: 600px) {
            body {
                padding: 25px 15px;
            }
            h2 {
                font-size: 1.8em;
            }
            .form-container {
                padding: 25px 30px;
            }
            input[type="submit"] {
                font-size: 1em;
                padding: 12px;
            }
            .back-home a {
                font-size: 1em;
            }
        }
    </style>
</head>
<body>

<h2>Add Reservation</h2>

<div class="form-container">
    <form action="AddReservationServlet" method="post">
        <label for="reservationId">Reservation ID:</label>
        <input type="number" name="reservationId" id="reservationId" required />

        <label for="customerName">Customer Name:</label>
        <input type="text" name="customerName" id="customerName" required />

        <label for="roomNumber">Room Number:</label>
        <input type="text" name="roomNumber" id="roomNumber" required />

        <label for="checkIn">Check-In Date:</label>
        <input type="date" name="checkIn" id="checkIn" required />

        <label for="checkOut">Check-Out Date:</label>
        <input type="date" name="checkOut" id="checkOut" required />

        <label for="totalAmount">Total Amount:</label>
        <input type="number" step="0.01" name="totalAmount" id="totalAmount" required />

        <input type="submit" value="Add Reservation" />
    </form>
</div>

<div class="back-home">
    <a href="index.jsp">← Back to Home</a>
</div>

</body>
</html>
