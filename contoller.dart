import 'dart:developer';
import 'dart:io';

import 'parkingslot.dart';
import 'printHelper.dart';
import 'vehical.dart';

class ParkingController {
  List<ParkingSlot> slots = [ParkingSlot("A1"), ParkingSlot("A2")];

  List<Vehical> vehicles = [Vehical(name: "Activa", number: "CH02-9988")];
  final Printhelper printHelper = Printhelper();

  void start() {
    print("Welcome to Parking Management System 🚗\n");

    while (true) {
      print("Choose an option:");
      print("1) Show Parking Slots");
      print("2) Show  Vehicles");
      print("3) Add  Vehicle");
      print("4) Remove  Vehicle");
      print("5) Exit");

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
          addvehical();
          break;
        case "4":
          removeVehical();
          break;
        case "5":
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

  addvehical() {
    stdout.write("Enter your vehical name: ");
    String? name = stdin.readLineSync();

    stdout.write("Enter your vehical number: ");
    String? number = stdin.readLineSync();
    if (number != null && name != null) {
      Vehical usercar = Vehical(name: name, number: number);
      vehicles.add(usercar);
      stdout.write(
        "Vehicle ${usercar.name} ${usercar.number} added succssfully",
      );
    }
  }

  removeVehical() {
    stdout.write("Enter your vehical number: ");
    String? number = stdin.readLineSync();
    if (number != null) {
      vehicles.removeWhere((v) {
        if (v.number == number) {
          stdout.write("Vehicle ${number} remove succssfully");
        }

        return v.number == number;
      });
    }
  }
}
