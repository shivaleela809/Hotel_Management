<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <title>Hotel Reports</title>
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;600&display=swap" rel="stylesheet" />
    <style>
        :root {
            --prussian-blue: #003153;
            --mustard-yellow: #d4a017;
            --card-bg: rgba(255, 255, 255, 0.95);
            --text-dark: #263238;
            --text-prussian: #003153;
            --hover-bg: #fef6d8;
        }

        body {
            font-family: 'Roboto', sans-serif;
            background-color: var(--prussian-blue);
            margin: 0;
            padding: 40px;
            min-height: 100vh;
            display: flex;
            flex-direction: column;
            align-items: center;
            color: var(--text-prussian);
        }

        h2 {
            font-size: 2.4em;
            color: var(--mustard-yellow);
            margin-bottom: 50px;
            font-weight: 700;
            user-select: none;
        }

        .report-list {
            max-width: 700px;
            width: 100%;
            padding: 0;
            list-style: none;
            display: flex;
            flex-direction: column;
            gap: 25px;
        }

        .report-list li {
            background-color: var(--card-bg);
            border-radius: 12px;
            padding: 25px 20px;
            box-shadow: 0 6px 20px rgba(0,0,0,0.15);
            transition: transform 0.3s ease, box-shadow 0.3s ease;
            text-align: center;
            user-select: none;
        }

        .report-list li:hover {
            transform: translateY(-5px);
            box-shadow: 0 10px 30px rgba(0,0,0,0.25);
            background-color: var(--hover-bg);
        }

        .report-list li a {
            text-decoration: none;
            color: var(--mustard-yellow);
            font-size: 1.3em;
            font-weight: 700;
            transition: color 0.3s ease;
        }

        .report-list li a:hover {
            color: #b38e0d;
        }

        .back-home {
            margin-top: 60px;
            user-select: none;
        }

        .back-home a {
            font-size: 1.1em;
            color: var(--mustard-yellow);
            font-weight: 700;
            text-decoration: none;
            transition: color 0.3s ease;
        }

        .back-home a:hover {
            color: #b38e0d;
        }

        @media (max-width: 600px) {
            body {
                padding: 25px 15px;
            }
            h2 {
                font-size: 1.8em;
            }
            .report-list li a {
                font-size: 1.1em;
            }
            .back-home a {
                font-size: 1em;
            }
        }
    </style>
</head>
<body>

<h2>Hotel Reports</h2>

<ul class="report-list">
    <li><a href="report_form.jsp?reportType=dateRange">Reservations in a Date Range</a></li>
    <li><a href="report_form.jsp?reportType=mostBookedRooms">Rooms Booked Most Frequently</a></li>
    <li><a href="report_form.jsp?reportType=totalRevenue">Total Revenue Over a Period</a></li>
</ul>

<div class="back-home">
    <a href="index.jsp">← Back to Home</a>
</div>

</body>
</html>
