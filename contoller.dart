import 'dart:io';

import 'parkingslot.dart';
import 'printHelper.dart';
import 'vehical.dart';

class ParkingController {
  List<ParkingSlot> slots = [ParkingSlot("A1"), ParkingSlot("A2")];

  List<Vehical> vehicles = [
    Vehical(name: "Bullet", number: "PB10-4455"),
    Vehical(name: "Activa", number: "CH02-9988"),
  ];
  final Printhelper printHelper = Printhelper();

  void start() {
    print("Welcome to Parking Management System 🚗\n");

    while (true) {
      print("Choose an option:");
      print("1) Show Parking Slots");
      print("2) Show  Vehicles");
      print("3) Exit");

      stdout.write("Enter your choice: ");
      String? choice = stdin.readLineSync();
      print(""); // spacing

      switch (choice) {
        case "1":
          printHelper.printSlotTable(slots);
          break;
        case "2":
          printHelper.printVehicles(vehicles);
          break;

        case "3":
          print("Exiting... 👋");
          return;

        default:
          print("Invalid option! Try again.\n");
      }
    }
  }

  void park(int slotNo, vehicle) {
    if (_isInvalidSlot(slotNo)) return;
    slots[slotNo - 1].Parkvehical(vehicle);
  }

  void remove(int slotNo) {
    if (_isInvalidSlot(slotNo)) return;
    slots[slotNo - 1].Removevehical(Vehical);
  }

  void showAll() {
    print('\n===  Parking Status ===');
    for (var slot in slots) {
      slot.Showslot(slot.vehical);
    }
  }

  bool _isInvalidSlot(int slotNo) {
    if (slotNo < 1 || slotNo > slots.length) {
      print(' Invalid slot number: $slotNo');
      return true;
    }
    return false;
  }
}
