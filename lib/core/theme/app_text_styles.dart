import 'package:flutter/material.dart';

class AppTextStyles {
  //Font
  static const String fontFamily = 'Poppins';

  //Size
  static const double _xxlSize = 30;
  static const double _xlSize = 24;
  static const double _lSize = 17;
  static const double _mSize = 16;

  //Normal
  static const TextStyle xxl = TextStyle(fontSize: _xxlSize);
  static const TextStyle xl = TextStyle(fontSize: _xlSize);
  static const TextStyle l = TextStyle(fontSize: _lSize);
  static const TextStyle m = TextStyle(fontSize: _mSize);
  static const TextStyle s = TextStyle();

  //Bold
  static const TextStyle xxlBold = TextStyle(
    fontSize: _xxlSize,
    fontWeight: FontWeight.bold,
  );
  static const TextStyle xlBold = TextStyle(
    fontSize: _xlSize,
    fontWeight: FontWeight.bold,
  );
  static const TextStyle lBold = TextStyle(
    fontSize: _lSize,
    fontWeight: FontWeight.bold,
  );
  static const TextStyle mBold = TextStyle(
    fontSize: _mSize,
    fontWeight: FontWeight.bold,
  );
  static const TextStyle sBold = TextStyle(
    fontWeight: FontWeight.bold,
  );

  //Black
  static const TextStyle xxlBlack = TextStyle(
    fontSize: _xxlSize,
    fontWeight: FontWeight.w900,
  );

  //Others
  static const TextStyle icons = TextStyle(fontSize: 50);
  static const TextStyle iconsXl = TextStyle(fontSize: 100);
  static const TextStyle red = TextStyle(color: Colors.redAccent);
}
