import 'package:flutter/services.dart';

class AppFormatters {
  static List<TextInputFormatter> lengthLimiting25 = [
    LengthLimitingTextInputFormatter(25),
  ];
  static String dateFormatyyyyMMdd = 'yyyy-MM-dd';
  static String dateFormatHHmmss = 'HH-mm-ss';
  static String dateFormatMMMMyyyy = 'MMMM yyyy';
}
