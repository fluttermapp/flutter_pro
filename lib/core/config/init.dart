import '../errors/error_log_tool.dart';
import '../errors/error_message.dart';
import 'verify_app_connection.dart';

Future<void> initApp(context) async {
  await initInternetChecker();
  await initAppVersionNotifier(context);
}

Future<void> initInternetChecker() async {
  try {
    await verifyAppConnection();
  } catch (e) {
    errorLogTool(
        exception: e, errorCustomMessage: ErrorMessage.thisIsNotWorking);
  }
}

Future<void> initAppVersionNotifier(context) async {
  try {} catch (e) {
    errorLogTool(
        exception: e, errorCustomMessage: ErrorMessage.thisIsNotWorking);
  }
}
