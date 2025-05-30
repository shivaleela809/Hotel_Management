<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <title>Delete Reservation</title>
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;600&display=swap" rel="stylesheet" />
    <style>
        :root {
            --prussian-blue: #003153;
            --mustard-yellow: #d4a017;
            --card-bg: rgba(255, 255, 255, 0.95);
            --text-prussian: #003153;
            --input-border: #bbb;
            --input-focus: #d4a017;
            --btn-danger-bg: #b71c1c;
            --btn-danger-bg-hover: #8a1414;
        }

        body {
            font-family: 'Roboto', sans-serif;
            background-color: var(--prussian-blue);
            margin: 0;
            padding: 50px 20px;
            color: var(--text-prussian);
            display: flex;
            flex-direction: column;
            align-items: center;
            min-height: 100vh;
            user-select: none;
        }

        h2 {
            font-size: 2.4em;
            margin-bottom: 40px;
            font-weight: 700;
            color: var(--mustard-yellow);
        }

        .form-container {
            background-color: var(--card-bg);
            max-width: 480px;
            width: 100%;
            padding: 35px 40px;
            border-radius: 15px;
            box-shadow: 0 6px 20px rgba(0, 0, 0, 0.15);
        }

        form {
            display: flex;
            flex-direction: column;
        }

        label {
            margin-bottom: 10px;
            font-weight: 600;
            font-size: 1.1rem;
            color: var(--prussian-blue);
        }

        input[type="number"] {
            padding: 12px;
            font-size: 1rem;
            border: 1px solid var(--input-border);
            border-radius: 6px;
            margin-bottom: 25px;
            color: var(--prussian-blue);
            transition: border-color 0.3s ease;
            outline: none;
        }

        input[type="number"]:focus {
            border-color: var(--input-focus);
            box-shadow: 0 0 6px var(--input-focus);
        }

        input[type="submit"] {
            padding: 12px;
            font-size: 1.1rem;
            background-color: var(--btn-danger-bg);
            border: none;
            color: #fff;
            font-weight: 700;
            border-radius: 8px;
            cursor: pointer;
            transition: background-color 0.3s ease;
            user-select: none;
        }

        input[type="submit"]:hover {
            background-color: var(--btn-danger-bg-hover);
        }

        .back-home {
            margin-top: 35px;
            user-select: none;
        }

        .back-home a {
            color: var(--mustard-yellow);
            font-weight: 700;
            font-size: 1.1rem;
            text-decoration: none;
            transition: color 0.3s ease;
        }

        .back-home a:hover {
            color: #b38e0d;
            text-decoration: underline;
        }

        @media (max-width: 600px) {
            body {
                padding: 30px 15px;
            }
            h2 {
                font-size: 1.8em;
            }
            .form-container {
                padding: 25px 30px;
            }
            input[type="submit"] {
                font-size: 1rem;
                padding: 12px;
            }
            .back-home a {
                font-size: 1rem;
            }
        }
    </style>
</head>
<body>

<h2>Delete Reservation</h2>

<div class="form-container">
    <form action="DeleteReservationServlet" method="post">
        <label for="reservationId">Reservation ID to Delete:</label>
        <input type="number" name="reservationId" id="reservationId" required />
        <input type="submit" value="Confirm Delete" />
    </form>
</div>

<div class="back-home">
    <a href="index.jsp">← Back to Home</a>
</div>

</body>
</html>
