import 'dart:io';

import 'parkingslot.dart';
import 'vehical.dart';

class Printhelper {
 

  void printVehicles(List<Vehical> vehicles) {
    print("---------------------------------------");
    print("|     Name          |   Number        |");
    print("---------------------------------------");

    for (var v in vehicles) {
      String name = v.name.padRight(16);
      String number = v.number.padRight(15);
      print("| $name | $number |");
    }

    print("---------------------------------------");
  }

  void printSlotTable(List<Parkingslot> slots) {
    print("------------------------------------");
    print("| Slot Number |     Status        |");
    print("------------------------------------");

    for (var s in slots) {
      String slot = s.slotnumber.padRight(12);
      String status = (s.isavaliable ? "Empty" : "Occupied").padRight(14);

      print("| $slot | $status |");
    }

    print("------------------------------------");
  }
}
