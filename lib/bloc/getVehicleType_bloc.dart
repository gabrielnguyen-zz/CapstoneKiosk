import 'dart:async';

import 'package:kiosk/dataprovider/getVehicleType.dart';
import 'package:kiosk/ui/widgets/dialog.dart';

class GetVehicleTypeBloc {
  StreamController getVehicleTypeStream = new StreamController();
  Stream get getVehicleType => getVehicleTypeStream.stream;

  Future<bool> getVehicleTypeBloc(context, String phoneNum) async {
    print("Bloc Check");
    var getVehicleType = GetVehicleProvider();
    var result = await getVehicleType.getVehicle().catchError((error) {
      OpenDialog.displayDialog("Error", context, "Kiểm tra lại kết nối mạng");
    });
    if (result.length > 0) {
      getVehicleTypeStream.sink.add(result);
      return true;
    } else {
      return false;
    }
  }
}
