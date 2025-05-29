package servlet;

import dao.ReservationDAO;
import model.Reservation;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.sql.Date;

@WebServlet("/AddReservationServlet")
public class AddReservationServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            Reservation res = new Reservation();
            res.setReservationId(Integer.parseInt(request.getParameter("reservationId")));
            res.setCustomerName(request.getParameter("customerName"));
            res.setRoomNumber(request.getParameter("roomNumber"));
            res.setCheckIn(Date.valueOf(request.getParameter("checkIn")));
            res.setCheckOut(Date.valueOf(request.getParameter("checkOut")));
            res.setTotalAmount(Double.parseDouble(request.getParameter("totalAmount")));

            new ReservationDAO().addReservation(res);
            response.sendRedirect("DisplayReservationsServlet");

            
        } catch (Exception e) {
            response.getWriter().println("Error: " + e.getMessage());
        }
    }
}