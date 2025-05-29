package com.hotel.servlet;

import com.hotel.dao.ReservationDAO;
import com.hotel.model.Reservation;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.time.LocalDate;
import java.util.List;

@WebServlet("/ReportServlet")
public class ReportServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            LocalDate start = LocalDate.parse(request.getParameter("startDate"));
            LocalDate end = LocalDate.parse(request.getParameter("endDate"));

            if (start.isAfter(end)) {
                throw new ServletException("Start date must be before or equal to end date.");
            }

            ReservationDAO dao = new ReservationDAO();
            List<Reservation> reportList = dao.getReservationsBetween(start, end);

            request.setAttribute("reportList", reportList);
            RequestDispatcher dispatcher = request.getRequestDispatcher("report_result.jsp");
            dispatcher.forward(request, response);

        } catch (Exception e) {
            throw new ServletException("Error generating report", e);
        }
    }
}
