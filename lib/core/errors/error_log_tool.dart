import 'package:flutter/material.dart';
import 'error_page.dart';

void errorLogTool({
  required Object exception,
  required String errorCustomMessage,
}) {
  FlutterError.reportError(
    FlutterErrorDetails(exception: exception),
  );
  errorList.add(exception);
  errorListId.add(errorCustomMessage);
}
