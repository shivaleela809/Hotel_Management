package com.hotel.dao;

import com.hotel.model.Reservation;
import com.hotel.util.DBConnection;

import java.sql.*;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

public class ReservationDAO {

    // Add reservation
    public void addReservation(Reservation reservation) throws SQLException {
        String sql = "INSERT INTO reservations (customerName, roomNumber, checkIn, checkOut, totalAmount) VALUES (?, ?, ?, ?, ?)";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, reservation.getCustomerName());
            ps.setString(2, reservation.getRoomNumber());
            ps.setDate(3, Date.valueOf(reservation.getCheckIn()));
            ps.setDate(4, Date.valueOf(reservation.getCheckOut()));
            ps.setDouble(5, reservation.getTotalAmount());

            ps.executeUpdate();
        }
    }

    // Get all reservations
    public List<Reservation> getAllReservations() throws SQLException {
        List<Reservation> list = new ArrayList<>();
        String sql = "SELECT * FROM reservations ORDER BY checkIn";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                list.add(mapResultSetToReservation(rs));
            }
        }
        return list;
    }

    // Get reservation by ID
    public Reservation getReservationById(int id) throws SQLException {
        String sql = "SELECT * FROM reservations WHERE reservationID = ?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, id);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    return mapResultSetToReservation(rs);
                }
            }
        }
        return null;
    }

    // Update reservation
    public void updateReservation(Reservation reservation) throws SQLException {
        String sql = "UPDATE reservations SET customerName = ?, roomNumber = ?, checkIn = ?, checkOut = ?, totalAmount = ? WHERE reservationID = ?";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, reservation.getCustomerName());
            ps.setString(2, reservation.getRoomNumber());
            ps.setDate(3, Date.valueOf(reservation.getCheckIn()));
            ps.setDate(4, Date.valueOf(reservation.getCheckOut()));
            ps.setDouble(5, reservation.getTotalAmount());
            ps.setInt(6, reservation.getReservationID());

            ps.executeUpdate();
        }
    }

    // Delete reservation
    public void deleteReservation(int id) throws SQLException {
        String sql = "DELETE FROM reservations WHERE reservationID = ?";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setInt(1, id);
            ps.executeUpdate();
        }
    }

    // Get reservations between dates (for reports)
    public List<Reservation> getReservationsBetween(LocalDate start, LocalDate end) throws SQLException {
        List<Reservation> list = new ArrayList<>();
        String sql = "SELECT * FROM reservations WHERE checkIn >= ? AND checkOut <= ? ORDER BY checkIn";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setDate(1, Date.valueOf(start));
            ps.setDate(2, Date.valueOf(end));

            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    list.add(mapResultSetToReservation(rs));
                }
            }
        }
        return list;
    }

    // Helper: Map ResultSet to Reservation object
    private Reservation mapResultSetToReservation(ResultSet rs) throws SQLException {
        Reservation r = new Reservation();
        r.setReservationID(rs.getInt("reservationID"));
        r.setCustomerName(rs.getString("customerName"));
        r.setRoomNumber(rs.getString("roomNumber"));

        Date checkInDate = rs.getDate("checkIn");
        if (checkInDate != null) {
            r.setCheckIn(checkInDate.toLocalDate());
        }

        Date checkOutDate = rs.getDate("checkOut");
        if (checkOutDate != null) {
            r.setCheckOut(checkOutDate.toLocalDate());
        }

        r.setTotalAmount(rs.getDouble("totalAmount"));

        return r;
    }
}
