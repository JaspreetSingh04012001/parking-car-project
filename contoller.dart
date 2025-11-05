import 'parkingslot.dart';
import 'vehical.dart';

class ParkingController {
  final List<Parkingslot> slots = [];

  ParkingController(int total) {
    for (int i = 0; i < total; i++) {
      slots.add(Parkingslot(slotNumber: i + 1, slotnumber: ''));
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
