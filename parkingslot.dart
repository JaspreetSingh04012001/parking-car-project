import 'vehical.dart';

class Parkingslot {
  String slotnumber;
  bool isavaliable = true;
  Vehical? vehical;

  Parkingslot({required this.slotnumber, required int slotNumber});

  Parkvehical(Vehical) {
    if (isavaliable) {
      isavaliable = false;
      print("$Vehical park at this slot $slotnumber");
    } else {
      print("slot $slotnumber is empty you can park your vehical there");
    }
  }

  Removevehical(Vehical) {
    if (isavaliable) {
      isavaliable = true;
      print("$Vehical this vehical thas been remove this slot $slotnumber");
    } else {
      print("this slot $slotnumber is empty");
    }
  }

  Showslot(Parkingslot) {
    print("slot number $slotnumber status ");
    if (isavaliable) {
      print("slot is empty");
    } else {
      print(" the vehical $vehical  is already in this slot $slotnumber");
    }
  }
}
