// parking_ticket_simulator.dart

/// A class representing a parked car.
class ParkedCar {
  // Private instance variables
  String _make;
  String _model;
  String _color;
  String _licenseNumber;
  int _minutesParked;

  /// Parameterized constructor
  ParkedCar(
    this._make,
    this._model,
    this._color,
    this._licenseNumber,
    this._minutesParked,
  );

  // Getters
  String get make => _make;
  String get model => _model;
  String get color => _color;
  String get licenseNumber => _licenseNumber;
  int get minutesParked => _minutesParked;

  // Setters
  set make(String value) => _make = value;
  set model(String value) => _model = value;
  set color(String value) => _color = value;
  set licenseNumber(String value) => _licenseNumber = value;
  set minutesParked(int value) => _minutesParked = value;

  @override
  String toString() {
    return 'Car: $_make $_model ($_color), License: $_licenseNumber, Parked for: $_minutesParked min';
  }
}

/// A class representing a parking meter.
class ParkingMeter {
  // Private instance variable
  int _minutesPurchased;

  /// Parameterized constructor
  ParkingMeter(this._minutesPurchased);

  // Getter
  int get minutesPurchased => _minutesPurchased;

  // Setter
  set minutesPurchased(int value) => _minutesPurchased = value;

  @override
  String toString() {
    return 'Parking Meter: $_minutesPurchased minutes purchased';
  }
}

/// A class representing a parking ticket.
class ParkingTicket {
  // Private instance variables
  late ParkedCar _car;
  late PoliceOfficer _officer;
  double _fine = 0;

  /// Parameterized constructor
  ParkingTicket(this._car, this._officer, int minutesOver) {
    _fine = calculateFine(minutesOver);
  }

  /// Calculate fine based on minutes exceeded
  double calculateFine(int minutesOver) {
    double fine = 25.0; // First hour fine
    if (minutesOver > 60) {
      fine += ((minutesOver - 60) / 60).ceil() * 10.0; // Each extra hour
    }
    return fine;
  }

  @override
  String toString() {
    return 'PARKING TICKET\n${_car.toString()}\nIssued by: ${_officer.toString()}\nFine: \$$_fine';
  }
}

/// A class representing a police officer.
class PoliceOfficer {
  // Private instance variables
  String _name;
  String _badgeNumber;

  /// Parameterized constructor
  PoliceOfficer(this._name, this._badgeNumber);

  // Getters
  String get name => _name;
  String get badgeNumber => _badgeNumber;

  // Setters
  set name(String value) => _name = value;
  set badgeNumber(String value) => _badgeNumber = value;

  /// Examines the parked car and parking meter to determine if a ticket is needed.
  ParkingTicket? examineCar(ParkedCar car, ParkingMeter meter) {
    int minutesOver = car.minutesParked - meter.minutesPurchased;
    if (minutesOver > 0) {
      return ParkingTicket(car, this, minutesOver);
    }
    return null;
  }

  @override
  String toString() {
    return 'Officer $_name, Badge: $_badgeNumber';
  }
}
