<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <title>Update Reservation</title>
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;600&display=swap" rel="stylesheet" />
    <style>
        :root {
            --prussian-blue: #003153;
            --mustard-yellow: #d4a017;
            --card-bg: rgba(255, 255, 255, 0.95);
            --input-border: #bbb;
            --input-focus: #d4a017;
            --btn-primary-bg: #00bfa5;
            --btn-primary-bg-hover: #008e76;
            --text-color: #263238;
        }

        body {
            font-family: 'Roboto', sans-serif;
            background-color: var(--prussian-blue);
            color: var(--text-color);
            margin: 0;
            padding: 40px 20px;
            display: flex;
            justify-content: center;
            align-items: flex-start;
            min-height: 100vh;
        }

        .form-container {
            background-color: var(--card-bg);
            border-radius: 15px;
            padding: 35px 40px;
            box-shadow: 0 6px 20px rgba(0, 0, 0, 0.15);
            max-width: 480px;
            width: 100%;
        }

        h2 {
            color: var(--mustard-yellow);
            text-align: center;
            margin-bottom: 30px;
            font-weight: 700;
            font-size: 2.2em;
        }

        form {
            display: flex;
            flex-direction: column;
        }

        label {
            font-weight: 600;
            margin-bottom: 6px;
            color: var(--prussian-blue);
        }

        input[type="text"],
        input[type="date"] {
            padding: 12px;
            font-size: 1rem;
            border: 1px solid var(--input-border);
            border-radius: 6px;
            margin-bottom: 20px;
            outline: none;
            transition: border-color 0.3s ease, box-shadow 0.3s ease;
            color: var(--prussian-blue);
        }

        input[type="text"]:focus,
        input[type="date"]:focus {
            border-color: var(--input-focus);
            box-shadow: 0 0 6px var(--input-focus);
        }

        input[type="submit"] {
            background-color: var(--btn-primary-bg);
            border: none;
            color: white;
            font-weight: 700;
            padding: 14px;
            font-size: 1.1rem;
            border-radius: 8px;
            cursor: pointer;
            transition: background-color 0.3s ease;
            user-select: none;
        }

        input[type="submit"]:hover {
            background-color: var(--btn-primary-bg-hover);
        }

        @media (max-width: 600px) {
            body {
                padding: 30px 15px;
            }
            .form-container {
                padding: 25px 20px;
            }
            h2 {
                font-size: 1.8em;
            }
            input[type="submit"] {
                font-size: 1rem;
                padding: 12px;
            }
        }
    </style>
</head>
<body>

<div class="form-container">
    <h2>Update Reservation</h2>
    <form action="UpdateReservationServlet" method="post">
        <label for="reservationId">Reservation ID:</label>
        <input type="text" name="reservationId" id="reservationId" required />

        <label for="customerName">Customer Name:</label>
        <input type="text" name="customerName" id="customerName" required />

        <label for="roomNumber">Room Number:</label>
        <input type="text" name="roomNumber" id="roomNumber" required />

        <label for="checkIn">Check-In Date:</label>
        <input type="date" name="checkIn" id="checkIn" required />

        <label for="checkOut">Check-Out Date:</label>
        <input type="date" name="checkOut" id="checkOut" required />

        <label for="totalAmount">Total Amount:</label>
        <input type="text" name="totalAmount" id="totalAmount" required />

        <input type="submit" value="Update Reservation" />
    </form>
</div>

</body>
</html>
