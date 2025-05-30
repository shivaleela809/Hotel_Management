package servlet;

import dao.ReservationDAO;
import model.Reservation;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.sql.Date;
import java.util.*;

@WebServlet("/ReportServlet")
public class ReportServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String reportType = request.getParameter("reportType");
        ReservationDAO dao = new ReservationDAO();

        try {
            // Parse common date inputs
            Date startDate = Date.valueOf(request.getParameter("startDate"));
            Date endDate = Date.valueOf(request.getParameter("endDate"));

            switch (reportType) {
                case "dateRange": {
                    List<Reservation> reservations = dao.getReservationsBetween(startDate, endDate);
                    request.setAttribute("reservations", reservations);
                    break;
                }

                case "mostBookedRooms": {
                    List<Map<String, Object>> roomStats = dao.getMostFrequentRooms(startDate, endDate);
                    request.setAttribute("roomStats", roomStats);
                    break;
                }

                case "totalRevenue": {
                    double revenue = dao.getTotalRevenue(startDate, endDate);
                    request.setAttribute("totalRevenue", revenue);
                    break;
                }

                default:
                    request.setAttribute("error", "Invalid report type.");
                    request.getRequestDispatcher("report_form.jsp").forward(request, response);
                    return;
            }

            // Forward to results JSP
            request.getRequestDispatcher("report_result.jsp").forward(request, response);

        } catch (Exception e) {
            // Handle input or DAO errors
            request.setAttribute("error", "Error: " + e.getMessage());
            request.getRequestDispatcher("report_form.jsp").forward(request, response);
        }
    }
}
