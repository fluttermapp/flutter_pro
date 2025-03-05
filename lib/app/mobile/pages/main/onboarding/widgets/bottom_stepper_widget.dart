import 'package:flutter/material.dart';
import 'package:flutter_pro/core/theme/app_text_styles.dart';

import '../../../../../../core/constants/words.dart';
import '../../../../../../core/notifiers/notifiers.dart';

class BottomStepperWidget extends StatelessWidget {
  const BottomStepperWidget({
    super.key,
    this.itemCount,
  });

  final int? itemCount;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: AppData.onboardingCurrentIndexNotifier,
      builder: (context, currentIndex, child) {
        String label;
        if (itemCount == null) {
          label = Words.lastStep;
        } else {
          label = '${currentIndex + 1} of ${itemCount! + 1}';
        }
        return Text(
          label,
          style: AppTextStyles.m.copyWith(color: Colors.white54),
          textAlign: TextAlign.left,
        );
      },
    );
  }
}
