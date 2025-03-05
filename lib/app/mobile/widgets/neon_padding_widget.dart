import 'package:flutter/material.dart';
import 'package:flutter_pro/core/constants/app_dimensions.dart';
import 'package:flutter_pro/core/theme/app_text_styles.dart';

import '../../../core/functions/get_border_radius.dart';

class NeonPaddingWidget extends StatelessWidget {
  const NeonPaddingWidget({
    super.key,
    this.child,
    this.title,
    this.label1,
    this.isCentered = false,
  });

  ///First
  final String? title;

  ///Second
  final String? label1;

  ///Third
  final Widget? child;
  final bool isCentered;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        boxShadow: const [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 10,
            spreadRadius: 0,
          ),
        ],
        gradient: SweepGradient(
          startAngle: 0.5,
          colors: [
            Theme.of(context).colorScheme.primary.withAlpha(150),
            Theme.of(context).colorScheme.primary,
            Theme.of(context).colorScheme.primary.withAlpha(150),
          ],
        ),
        borderRadius: BorderRadius.circular(
          getOutterBorderRadius(
            innerBorderRadius: AppDimensions.kBorderRadius10,
            margin: AppDimensions.kMargin3,
          ),
        ),
      ),
      child: Container(
        padding: const EdgeInsets.all(10.0),
        margin: const EdgeInsets.all(AppDimensions.kMargin3),
        decoration: BoxDecoration(
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 20,
              spreadRadius: 0,
            ),
          ],
          color: Colors.black87,
          borderRadius: BorderRadius.circular(AppDimensions.kBorderRadius10),
        ),
        child: Column(
          crossAxisAlignment:
              isCentered ? CrossAxisAlignment.center : CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            if (title != null)
              Text(
                title!,
                style: AppTextStyles.xlBold,
              ),
            if (label1 != null)
              Text(
                label1!,
                style: AppTextStyles.l,
              ),
            if (child != null) child!,
          ],
        ),
      ),
    );
  }
}
