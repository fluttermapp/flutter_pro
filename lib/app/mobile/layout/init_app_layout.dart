import 'package:flutter/material.dart';
import 'package:flutter_pro/core/notifiers/notifiers.dart';

import '../../../core/config/init.dart';
import '../pages/others/app_loading_page.dart';
import '../pages/others/outdated_page.dart';
import 'auth_layout.dart';

class InitAppLayout extends StatelessWidget {
  const InitAppLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: initApp(context),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const AppLoadingPage();
        } else {
          return ValueListenableBuilder(
            valueListenable: AppData.isAppOutdatedNotifier,
            builder: (context, isAppOutdated, child) {
              Widget widget;
              if (isAppOutdated) {
                widget = const OutdatedPage();
              } else {
                widget = const AuthLayout();
              }
              return widget;
            },
          );
        }
      },
    );
  }
}
