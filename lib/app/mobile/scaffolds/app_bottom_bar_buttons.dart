import 'package:flutter/material.dart';

import '../../../core/constants/app_dimensions.dart';

class AppBottomBarButtons extends StatelessWidget {
  const AppBottomBarButtons({
    super.key,
    required this.buttons,
    required this.body,
    this.appBar,
  });
  final List<Widget> buttons;
  final Widget body;
  final PreferredSizeWidget? appBar;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar,
      body: body,
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: AppDimensions.kPadding50,
          horizontal: AppDimensions.kPadding15,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: buttons,
        ),
      ),
    );
  }
}
