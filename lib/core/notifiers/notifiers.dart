import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';

class AppData {
  //Onboarding
  static final ValueNotifier<double> onboardingSlider1Notifier =
      ValueNotifier(3.0);
  static final ValueNotifier<double> onboardingSlider2Notifier =
      ValueNotifier(1.0);
  static final ValueNotifier<int> onboardingCurrentIndexNotifier =
      ValueNotifier(0);

  //App
  static final ValueNotifier<bool> isAuthConnected = ValueNotifier(false);
  static final ValueNotifier<bool> isConnectedNotifier = ValueNotifier(false);
  static final ValueNotifier<bool> isAppOutdatedNotifier = ValueNotifier(false);
  static final ValueNotifier<int> navBarCurrentIndexNotifier = ValueNotifier(0);
}
