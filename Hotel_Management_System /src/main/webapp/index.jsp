<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <title>Hotel Reservation System</title>
    <link
        rel="stylesheet"
        href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css"
        crossorigin="anonymous"
    />
    <link
        href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;600&display=swap"
        rel="stylesheet"
    />
    <style>
        :root {
            /* Light Mode Colors */
            --prussian-blue: #003153;
            --mustard-yellow: #d4a017; /* Mustard Yellow */
            --bg-light: linear-gradient(135deg, #f5f5dc, #e8e8e0); /* Soft beige */
            --text-light: #2f2f2f;
            --card-light: rgba(255, 255, 255, 0.95);

            /* Dark Mode Colors */
            --prussian-blue-dark: #0b2242;
            --bg-dark: #1b263b;
            --text-dark: #e1e1e1;
            --card-dark: rgba(10, 30, 60, 0.85);
        }

        body {
            font-family: 'Roboto', sans-serif;
            margin: 0;
            padding: 0;
            min-height: 100vh;
            display: flex;
            flex-direction: column;
            background: var(--bg-light);
            color: var(--text-light);
            transition: all 0.3s ease;
        }

        body.dark {
            background: var(--bg-dark);
            color: var(--text-dark);
        }

        header {
            background: var(--prussian-blue);
            padding: 30px 40px;
            text-align: center;
            color: white;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.2);
            position: relative;
            font-weight: 700;
            font-size: 2.2em;
            user-select: none;
            transition: background 0.3s ease;
        }

        body.dark header {
            background: var(--prussian-blue-dark);
        }

        .dark-toggle {
            position: absolute;
            top: 20px;
            right: 30px;
            font-size: 1.5em;
            cursor: pointer;
            color: #fff;
            transition: transform 0.3s ease;
        }

        .dark-toggle:hover {
            transform: scale(1.2);
            color: var(--mustard-yellow);
        }

        main {
            flex-grow: 1;
            display: flex;
            justify-content: center;
            align-items: center;
            padding: 50px 20px;
        }

        .dashboard-container {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(230px, 1fr));
            gap: 30px;
            width: 100%;
            max-width: 1100px;
        }

        .dashboard-item {
            background: var(--card-light);
            border-radius: 15px;
            padding: 35px 25px;
            text-align: center;
            text-decoration: none;
            color: var(--prussian-blue);
            box-shadow: 0 6px 18px rgba(0, 0, 0, 0.1);
            transition: transform 0.3s ease, box-shadow 0.3s ease, background 0.3s ease, color 0.3s ease;
            backdrop-filter: saturate(180%) blur(12px);
            cursor: pointer;
            font-weight: 600;
        }

        body.dark .dashboard-item {
            background: var(--card-dark);
            color: var(--text-dark);
            box-shadow: 0 6px 18px rgba(255, 255, 255, 0.1);
        }

        .dashboard-item:hover {
            transform: translateY(-8px);
            box-shadow: 0 10px 24px rgba(0, 0, 0, 0.25);
            color: var(--mustard-yellow);
        }

        .dashboard-item i {
            font-size: 2.7em;
            margin-bottom: 15px;
            animation: pulse 2s infinite;
            color: var(--prussian-blue);
            transition: color 0.3s ease;
        }

        .dashboard-item:hover i {
            color: var(--mustard-yellow);
        }

        body.dark .dashboard-item i {
            color: var(--text-dark);
        }

        body.dark .dashboard-item:hover i {
            color: var(--mustard-yellow);
        }

        footer {
            background-color: rgba(0, 49, 83, 0.15);
            color: var(--prussian-blue);
            text-align: center;
            padding: 20px;
            font-size: 0.95em;
            user-select: none;
            transition: background-color 0.3s ease, color 0.3s ease;
        }

        body.dark footer {
            background-color: rgba(11, 34, 66, 0.3);
            color: var(--text-dark);
        }

        @keyframes pulse {
            0% {
                transform: scale(1);
            }
            50% {
                transform: scale(1.07);
            }
            100% {
                transform: scale(1);
            }
        }

        @media (max-width: 600px) {
            .dashboard-item {
                padding: 25px 15px;
            }

            .dashboard-item i {
                font-size: 2.2em;
            }

            .dashboard-item span {
                font-size: 1em;
            }
        }
    </style>
</head>
<body>
    <header>
        Hotel Reservation System
        <i
            class="fas fa-moon dark-toggle"
            onclick="toggleDarkMode()"
            title="Toggle Dark Mode"
        ></i>
    </header>

    <main>
        <div class="dashboard-container">
            <a href="reservationadd.jsp" class="dashboard-item">
                <i class="fas fa-plus-circle"></i>
                <span>Add Reservation</span>
            </a>
            <a href="reservationupdate.jsp" class="dashboard-item">
                <i class="fas fa-edit"></i>
                <span>Update Reservation</span>
            </a>
            <a href="reservationdelete.jsp" class="dashboard-item">
                <i class="fas fa-trash-alt"></i>
                <span>Delete Reservation</span>
            </a>
            <a href="DisplayReservationsServlet" class="dashboard-item">
                <i class="fas fa-list"></i>
                <span>View Reservations</span>
            </a>
            <a href="reports.jsp" class="dashboard-item">
                <i class="fas fa-chart-bar"></i>
                <span>Reports</span>
            </a>
            <a href="report_form.jsp" class="dashboard-item">
                <i class="fas fa-file-alt"></i>
                <span>Report Form</span>
            </a>
        </div>
    </main>

    <footer>
        &copy; 2025 Hotel Reservation System. All rights reserved.
    </footer>

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
