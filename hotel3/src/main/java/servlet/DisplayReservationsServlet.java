package servlet;

import dao.ReservationDAO;
import model.Reservation;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.util.*;

@WebServlet("/DisplayReservationsServlet")
public class DisplayReservationsServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            List<Reservation> reservations = new ReservationDAO().getAllReservations();
            request.setAttribute("reservations", reservations);

            // ✅ Forward to the correct JSP page
            RequestDispatcher rd = request.getRequestDispatcher("reservationdisplay.jsp");
            rd.forward(request, response);

        } catch (Exception e) {
            response.getWriter().println("Error: " + e.getMessage());
        }
    }
}
