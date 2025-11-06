import 'vehical.dart';

class ParkingSlot {
  final String slotNumber;
  bool isavaliable = true;
  Vehical? vehical;

  ParkingSlot(this.slotNumber);

  get slotName => null;

  bool? get isEmpty => null;

  Parkvehical(Vehical) {
    if (isavaliable) {
      isavaliable = false;
      print("$Vehical park at this slot $slotNumber");
    } else {
      print("slot $slotNumber is empty you can park your vehical there");
    }
  }

  Removevehical(Vehical) {
    if (isavaliable) {
      isavaliable = true;
      print("$Vehical this vehical thas been remove this slot $slotNumber");
    } else {
      print("this slot $slotNumber is empty");
    }
  }

  Showslot(Parkingslot) {
    print("slot number $slotNumber status ");
    if (isavaliable) {
      print("slot is empty");
    } else {
      print(" the vehical $vehical  is already in this slot $slotNumber");
    }
  }
}
