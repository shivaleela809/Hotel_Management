package com.hotel.model;

import java.time.LocalDate;

public class Reservation {
    private int reservationID;
    private String customerName;
    private String roomNumber;
    private LocalDate checkIn;
    private LocalDate checkOut;
    private double totalAmount;

    public Reservation() {}

    public Reservation(int reservationID, String customerName, String roomNumber,
                       LocalDate checkIn, LocalDate checkOut, double totalAmount) {
        this.reservationID = reservationID;
        this.customerName = customerName;
        this.roomNumber = roomNumber;
        this.checkIn = checkIn;
        this.checkOut = checkOut;
        this.totalAmount = totalAmount;
    }

    // Getters and setters for all fields

    public int getReservationID() { return reservationID; }
    public void setReservationID(int reservationID) { this.reservationID = reservationID; }

    public String getCustomerName() { return customerName; }
    public void setCustomerName(String customerName) { this.customerName = customerName; }

    public String getRoomNumber() { return roomNumber; }
    public void setRoomNumber(String roomNumber) { this.roomNumber = roomNumber; }

    public LocalDate getCheckIn() { return checkIn; }
    public void setCheckIn(LocalDate checkIn) { this.checkIn = checkIn; }

    public LocalDate getCheckOut() { return checkOut; }
    public void setCheckOut(LocalDate checkOut) { this.checkOut = checkOut; }

    public double getTotalAmount() { return totalAmount; }
    public void setTotalAmount(double totalAmount) { this.totalAmount = totalAmount; }
}
