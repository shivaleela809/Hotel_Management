package dao;

import model.Reservation;
import java.sql.*;
import java.util.*;

public class ReservationDAO {
    private final String URL = "jdbc:mysql://localhost:3306/hotel_db";
    private final String USER = "root";
    private final String PASS = "";

    public void addReservation(Reservation res) throws Exception {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection conn = DriverManager.getConnection(URL, USER, PASS);
        String sql = "INSERT INTO Reservations VALUES (?, ?, ?, ?, ?, ?)";
        PreparedStatement ps = conn.prepareStatement(sql);
        ps.setInt(1, res.getReservationId());
        ps.setString(2, res.getCustomerName());
        ps.setString(3, res.getRoomNumber());
        ps.setDate(4, res.getCheckIn());
        ps.setDate(5, res.getCheckOut());
        ps.setDouble(6, res.getTotalAmount());
        ps.executeUpdate();
        conn.close();
    }

    public void updateReservation(Reservation res) throws Exception {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection conn = DriverManager.getConnection(URL, USER, PASS);
        String sql = "UPDATE Reservations SET CustomerName=?, RoomNumber=?, CheckIn=?, CheckOut=?, TotalAmount=? WHERE ReservationID=?";
        PreparedStatement ps = conn.prepareStatement(sql);
        ps.setString(1, res.getCustomerName());
        ps.setString(2, res.getRoomNumber());
        ps.setDate(3, res.getCheckIn());
        ps.setDate(4, res.getCheckOut());
        ps.setDouble(5, res.getTotalAmount());
        ps.setInt(6, res.getReservationId());
        ps.executeUpdate();
        conn.close();
    }

    public void deleteReservation(int id) throws Exception {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection conn = DriverManager.getConnection(URL, USER, PASS);
        PreparedStatement ps = conn.prepareStatement("DELETE FROM Reservations WHERE ReservationID=?");
        ps.setInt(1, id);
        ps.executeUpdate();
        conn.close();
    }

    public List<Reservation> getAllReservations() throws Exception {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection conn = DriverManager.getConnection(URL, USER, PASS);
        List<Reservation> list = new ArrayList<>();
        Statement stmt = conn.createStatement();
        ResultSet rs = stmt.executeQuery("SELECT * FROM Reservations");
        while (rs.next()) {
            Reservation res = new Reservation();
            res.setReservationId(rs.getInt(1));
            res.setCustomerName(rs.getString(2));
            res.setRoomNumber(rs.getString(3));
            res.setCheckIn(rs.getDate(4));
            res.setCheckOut(rs.getDate(5));
            res.setTotalAmount(rs.getDouble(6));
            list.add(res);
        }
        conn.close();
        return list;
    }

    public List<Reservation> getReservationsBetween(java.sql.Date startDate, java.sql.Date endDate) throws Exception {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection conn = DriverManager.getConnection(URL, USER, PASS);
        List<Reservation> list = new ArrayList<>();
        String sql = "SELECT * FROM Reservations WHERE CheckIn >= ? AND CheckOut <= ?";
        PreparedStatement ps = conn.prepareStatement(sql);
        ps.setDate(1, startDate);
        ps.setDate(2, endDate);
        ResultSet rs = ps.executeQuery();
        while (rs.next()) {
            Reservation res = new Reservation();
            res.setReservationId(rs.getInt("ReservationID"));
            res.setCustomerName(rs.getString("CustomerName"));
            res.setRoomNumber(rs.getString("RoomNumber"));
            res.setCheckIn(rs.getDate("CheckIn"));
            res.setCheckOut(rs.getDate("CheckOut"));
            res.setTotalAmount(rs.getDouble("TotalAmount"));
            list.add(res);
        }
        conn.close();
        return list;
    }

    public List<Map<String, Object>> getMostFrequentRooms(java.sql.Date startDate, java.sql.Date endDate) throws Exception {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection conn = DriverManager.getConnection(URL, USER, PASS);
        List<Map<String, Object>> list = new ArrayList<>();
        String sql = "SELECT RoomNumber, COUNT(*) AS BookingCount FROM Reservations " +
                     "WHERE CheckIn >= ? AND CheckOut <= ? GROUP BY RoomNumber ORDER BY BookingCount DESC";
        PreparedStatement ps = conn.prepareStatement(sql);
        ps.setDate(1, startDate);
        ps.setDate(2, endDate);
        ResultSet rs = ps.executeQuery();
        while (rs.next()) {
            Map<String, Object> map = new HashMap<>();
            map.put("RoomNumber", rs.getString("RoomNumber"));
            map.put("BookingCount", rs.getInt("BookingCount"));
            list.add(map);
        }
        conn.close();
        return list;
    }

    public double getTotalRevenue(java.sql.Date startDate, java.sql.Date endDate) throws Exception {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection conn = DriverManager.getConnection(URL, USER, PASS);
        String sql = "SELECT SUM(TotalAmount) AS Total FROM Reservations WHERE CheckIn >= ? AND CheckOut <= ?";
        PreparedStatement ps = conn.prepareStatement(sql);
        ps.setDate(1, startDate);
        ps.setDate(2, endDate);
        ResultSet rs = ps.executeQuery();
        double total = 0.0;
        if (rs.next()) {
            total = rs.getDouble("Total");
        }
        conn.close();
        return total;
    }
}