<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <title>Delete Reservation</title>
    <style>
        body { font-family: Arial, sans-serif; margin: 20px; }
        label { font-weight: bold; display: block; margin-top: 10px; }
        input[type="number"] {
            padding: 8px;
            width: 150px;
            margin-top: 5px;
            box-sizing: border-box;
        }
        input[type="submit"] {
            margin-top: 15px;
            padding: 10px 20px;
            font-size: 16px;
            cursor: pointer;
            background-color: #dc3545;
            color: white;
            border: none;
            border-radius: 4px;
        }
        input[type="submit"]:hover {
            background-color: #c82333;
        }
        a {
            display: inline-block;
            margin-top: 20px;
            color: #007BFF;
            text-decoration: none;
        }
        a:hover, a:focus {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <h2>Delete Reservation</h2>
    <form action="DeleteReservationServlet" method="post">
        <label for="reservationID">Reservation ID to delete:</label>
        <input type="number" id="reservationID" name="reservationID" required min="1" step="1" />

        <input type="submit" value="Delete Reservation">
    </form>
    <a href="DisplayReservationsServlet">Back to Reservation List</a>
</body>
</html>
