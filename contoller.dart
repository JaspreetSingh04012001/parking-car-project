import 'dart:io';
import 'parkingslot.dart';
import 'printHelper.dart';
import 'vehical.dart';

class ParkingController {
  List<ParkingSlot> slots = [ParkingSlot("A1"), ParkingSlot("A2")];
  List<Vehical> vehicles = [Vehical(name: "Activa", number: "CH02-9988")];
  final Printhelper printhelper = Printhelper();

  void start() {
    print("Welcome to Parking Management System 🚗");

    while (true) {
      print("\nChoose an option:");
      print("1) Show Parking Slots");
      print("2) Show Vehicles");
      print("3) Add Vehicle");
      print("4) Remove Vehicle");
      print("5) Add Parking Slot");
      print("6) Remove Parking Slot");
      print("7) Exit");

      stdout.write("Enter your choice: ");
      String? choice = stdin.readLineSync();
      print(""); // spacing

      switch (choice) {
        case "1":
          printhelper.printSlotTable(slots);
          break;
        case "2":
          printhelper.printVehicles(vehicles);
          break;
        case "3":
          addVehical();
          break;
        case "4":
          removeVehical();
          break;
        case "5":
          addSlot();
          break;
        case "6":
          removeSlot();
          break;
        case "7":
          print("Exiting... 👋");
          return;
        default:
          print("Invalid option! Try again");
      }
    }
  }

  void park(int slotNo, Vehical vehicle) {
    if (_isInvalidSlot(slotNo)) return;
    slots[slotNo - 1].Parkvehical(vehicle);
  }

  void remove(int slotNo) {
    if (_isInvalidSlot(slotNo)) return;
    slots[slotNo - 1].Removevehical(Vehical);
  }

  void showAll() {
    print('\n=== Parking Status ===');
    for (var slot in slots) {
      slot.Showslot(slot.vehical);
    }
  }

  bool _isInvalidSlot(int slotNo) {
    if (slotNo < 1 || slotNo > slots.length) {
      print('Invalid slot number: $slotNo');
      return true;
    }
    return false;
  }

  void addVehical() {
    stdout.write("Enter vehicle name: ");
    String? name = stdin.readLineSync();

    stdout.write("Enter vehicle number: ");
    String? number = stdin.readLineSync();

    if (name != null && number != null) {
      Vehical userCar = Vehical(name: name, number: number);
      vehicles.add(userCar);
      print("Vehicle ${userCar.name} (${userCar.number}) added successfully");
    } else {
      print("Invalid input! Vehicle not added");
    }
  }

  void removeVehical() {
    stdout.write("Enter vehicle number: ");
    String? number = stdin.readLineSync();

    if (number != null) {
      bool found = false;
      vehicles.removeWhere((v) {
        if (v.number == number) {
          found = true;
          print("Vehicle $number removed successfully");
          return true;
        }
        return false;
      });
      if (!found) print("Vehicle not found");
    }
  }

  void addSlot() {
    stdout.write("Enter new slot name");
    String? name = stdin.readLineSync();

    if (name != null && name.isNotEmpty) {
      slots.add(ParkingSlot(name));
      print("Slot '$name' added successfully");
    } else {
      print("Invalid slot name! Slot not added");
    }
  }

  void removeSlot() {
    stdout.write("Enter slot name to remove: ");
    String? name = stdin.readLineSync();

    if (name != null && name.isNotEmpty) {
      bool found = false;
      slots.removeWhere((slot) {
        if (slot.slotName == name) {
          found = true;
          print("Slot '$name' removed successfully");
          return true;
        }
        return false;
      });
      if (!found) print("Slot not found");
    }
  }
}
