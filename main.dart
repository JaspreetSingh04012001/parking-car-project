import 'parkingslot.dart';
import 'vehical.dart';

void main() {
  Parkingslot slot1 = Parkingslot(slotnumber: "20022");
  Parkingslot slot2 = Parkingslot(slotnumber: "3300");

  Vehical car1 = Vehical(name: "punto", number: "20023333");
  Vehical car2 = Vehical(name: "swift", number: "666666");

  slot1.Parkvehical(car1);
  slot2.Parkvehical(car2);

  slot1.Showslot(car1);
}
