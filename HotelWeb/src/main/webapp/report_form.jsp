<!DOCTYPE html>
<html>
<head><title>Generate Report</title></head>
<body>
<h2>Generate Reservation Report</h2>
<form method="post" action="ReportServlet">
    Start Date: <input type="date" name="startDate" required/><br/>
    End Date: <input type="date" name="endDate" required/><br/>
    <input type="submit" value="Generate Report"/>
</form>
<a href="DisplayReservationsServlet">Back to list</a>
</body>
</html>
