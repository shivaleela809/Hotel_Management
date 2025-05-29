package com.hotel.servlet;

import com.hotel.dao.ReservationDAO;
import com.hotel.model.Reservation;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;

@WebServlet("/DisplayReservationsServlet")
public class DisplayReservationsServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            ReservationDAO dao = new ReservationDAO();
            List<Reservation> reservations = dao.getAllReservations();

            request.setAttribute("reservations", reservations);
            RequestDispatcher dispatcher = request.getRequestDispatcher("display_reservations.jsp");
            dispatcher.forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("<h3>Error displaying reservations: " + e.getMessage() + "</h3>");
        }
    }
}
