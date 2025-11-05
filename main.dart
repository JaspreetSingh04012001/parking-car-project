import 'vehical.dart';
import 'contoller.dart';

void main() {
  var controller = ParkingController(1);

  var vehicle1 = Vehical(name: 'punto', number: '33333');
  var vehicle2 = Vehical(name: 'swift', number: '22222');

  controller.park(1, vehicle1);
  controller.showAll();
}
