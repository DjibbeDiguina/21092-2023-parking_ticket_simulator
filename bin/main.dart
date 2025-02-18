import '../lib/parking_ticket_simulator.dart';

void main() {
  // Create a parked car
  ParkedCar car = ParkedCar('Toyota', 'Corolla', 'Blue', 'ABC-123', 90);

  // Create a parking meter with 60 minutes purchased
  ParkingMeter meter = ParkingMeter(60);

  // Create a police officer
  PoliceOfficer officer = PoliceOfficer('John Doe', '5678');

  // Officer examines the car
  ParkingTicket? ticket = officer.examineCar(car, meter);

  // Display result
  if (ticket != null) {
    print(ticket);
  } else {
    print('No ticket issued. Parking is valid.');
  }
}
