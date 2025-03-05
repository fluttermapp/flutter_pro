import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

import '../notifiers/notifiers.dart';

Future<void> verifyAppConnection() async {
  final connectionChecker = InternetConnectionChecker.instance;
  //* Removed cause its slow: isAppConnectedOnline = await connectionChecker.hasConnection;
  List<ConnectivityResult> connectivityResults =
      await Connectivity().checkConnectivity();
  AppData.isConnectedNotifier.value =
      connectivityResults.contains(ConnectivityResult.none) == false;

  connectionChecker.onStatusChange.listen(
    (InternetConnectionStatus status) {
      if (status == InternetConnectionStatus.connected) {
        AppData.isConnectedNotifier.value = true;
      } else {
        AppData.isConnectedNotifier.value = false;
      }
    },
  );
}
