import 'package:flutter/material.dart';
import 'package:flutter_pro/core/notifiers/notifiers.dart';
import '../pages/main/onboarding/welcome_page.dart';
import 'app_navigation_layout.dart';

class AuthLayout extends StatelessWidget {
  const AuthLayout({
    super.key,
    this.pageIfNotConnected,
  });

  final Widget? pageIfNotConnected;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: AppData.isAuthConnected,
      builder: (context, isAuthConnected, child) {
        Widget widget;
        if (isAuthConnected) {
          widget = const AppNavigationLayout();
        } else {
          widget = pageIfNotConnected ?? const WelcomePage();
        }
        return widget;
      },
    );
  }
}
