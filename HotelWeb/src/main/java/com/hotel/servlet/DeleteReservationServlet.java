package com.hotel.servlet;

import com.hotel.dao.ReservationDAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/DeleteReservationServlet")
public class DeleteReservationServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            int id = Integer.parseInt(request.getParameter("reservationID"));
            ReservationDAO dao = new ReservationDAO();
            dao.deleteReservation(id);

            response.sendRedirect("DisplayReservationsServlet");

        } catch (Exception e) {
            e.printStackTrace();
            response.setContentType("text/html");
            response.getWriter().println("<h3>Error deleting reservation: " + e.getMessage() + "</h3>");
        }
    }
}
