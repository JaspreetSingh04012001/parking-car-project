import 'dart:io';
import 'parkingslot.dart';
import 'printHelper.dart';
import 'vehical.dart';

class ParkingController {
  List<ParkingSlot> slots = [];
  List<Vehical> vehicles = [];
  final Printhelper printhelper = Printhelper();

  start() {
    print("Welcome to Parking Management System ");

    while (true) {
      print("Choose an option:");
      print("1) Show Parking Slots");
      print("2) Show Vehicles");
      print("3) Add Vehicle");
      print("4) Remove Vehicle");
      print("5) Add Parking Slot");
      print("6) Remove Parking Slot");
      print("7) select Vehicle for Slot");
      print("8) Unpark Vehicle from Slot");
      print("9) Exit");

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
          selectVehicleForSlot();
          break;
        case "8":
          unparkVehicleFromSlot();
          break;
        case "9":
          print("Exiting... 👋");
          return;
        default:
          print("Invalid option! Try again");
      }
    }
  }

  addVehical() {
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

  removeVehical() {
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

  addSlot() {
    stdout.write("Enter new slot name");
    String? name = stdin.readLineSync();

    if (name != null && name.isNotEmpty) {
      slots.add(ParkingSlot(name));
      print("Slot '$name' added successfully");
    } else {
      print("Invalid slot name! Slot not added");
    }
  }

  removeSlot() {
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

  selectVehicleForSlot() {
    if (vehicles.isEmpty) {
      print("No vehicles available to park!");
      return;
    }
    if (slots.isEmpty) {
      print("No parking slots available!");
      return;
    }

    printhelper.printVehicles(vehicles);
    stdout.write("Enter vehicle number to park: ");
    String? vehicleNumber = stdin.readLineSync();

    Vehical? selectedVehicle;
    var foundVehicle = vehicles.where((v) => v.number == vehicleNumber);
    if (foundVehicle.isNotEmpty) {
      selectedVehicle = foundVehicle.first;
    }

    if (selectedVehicle == null) {
      print("Vehicle not found!");
      return;
    }

    printhelper.printSlotTable(slots);
    stdout.write("Enter slot name to park the vehicle in: ");
    String? slotName = stdin.readLineSync();

    ParkingSlot? selectedSlot;
    var foundSlot = slots.where((s) => s.slotNumber == slotName);
    if (foundSlot.isNotEmpty) {
      selectedSlot = foundSlot.first;
    }

    if (selectedSlot == null) {
      print("Slot not found!");
      return;
    }

    selectedSlot.Parkvehical(selectedVehicle);
    print(
      "Vehicle ${selectedVehicle.name} (${selectedVehicle.number}) parked in slot ${selectedSlot.slotName}",
    );
  }

  unparkVehicleFromSlot() {
    if (slots.isEmpty) {
      print("No parking slots available!");
      return;
    }

    printhelper.printSlotTable(slots);
    stdout.write("Enter slot name to unpark from: ");
    String? slotName = stdin.readLineSync();

    ParkingSlot? selectedSlot;
    var foundSlot = slots.where((s) => s.slotName == slotName);
    if (foundSlot.isNotEmpty) {
      selectedSlot = foundSlot.first;
    }

    if (selectedSlot == null) {
      print("Slot not found!");
      return;
    }

    selectedSlot.Removevehical(vehicles);
    print("Vehicle removed from slot ${selectedSlot.slotName}");
  }
}
