CREATE TABLE Reservations (
ReservationID INT PRIMARY KEY,
CustomerName VARCHAR(100),
RoomNumber VARCHAR(10),
CheckIn DATE,
CheckOut DATE,
TotalAmount DECIMAL(10,2)
);
