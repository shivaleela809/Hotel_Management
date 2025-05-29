package com.hotel.servlet;

import com.hotel.dao.ReservationDAO;
import com.hotel.model.Reservation;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.time.LocalDate;

@WebServlet("/AddReservationServlet")
public class AddReservationServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            String customerName = request.getParameter("customerName");
            String roomNumber = request.getParameter("roomNumber");
            LocalDate checkIn = LocalDate.parse(request.getParameter("checkIn"));
            LocalDate checkOut = LocalDate.parse(request.getParameter("checkOut"));
            double totalAmount = Double.parseDouble(request.getParameter("totalAmount"));

            Reservation reservation = new Reservation(0, customerName, roomNumber, checkIn, checkOut, totalAmount);

            ReservationDAO dao = new ReservationDAO();
            dao.addReservation(reservation);

            response.sendRedirect("DisplayReservationsServlet");

        } catch (Exception e) {
            e.printStackTrace();
            response.setContentType("text/html");
            response.getWriter().println("<h3>Error adding reservation: " + e.getMessage() + "</h3>");
        }
    }
}
