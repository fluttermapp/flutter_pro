import 'package:flutter/material.dart';
import 'package:flutter_pro/core/constants/app_dimensions.dart';

import '../widgets/unaffected_child_widget.dart';

class AppPaddingScaffold extends StatelessWidget {
  const AppPaddingScaffold({
    super.key,
    this.child,

    ///You can assign [UnaffectedChildWidget] to cancel any padding.
    this.children,
    this.mainAxisAlignment = MainAxisAlignment.start,
    this.crossAxisAlignment = CrossAxisAlignment.center,
    this.mainAxisSize = MainAxisSize.max,
  }) : assert(
          child == null || children == null,
          'Cannot provide both a child and a children\n'
          'Select either one or the other.',
        );

  final Widget? child;
  final List<Widget>? children;
  final MainAxisAlignment mainAxisAlignment;
  final CrossAxisAlignment crossAxisAlignment;
  final MainAxisSize mainAxisSize;

  @override
  Widget build(BuildContext context) {
    Widget widget;
    if (child != null) {
      widget = Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: AppDimensions.kAppHorizontalPadding,
          vertical: 10.0,
        ),
        child: child,
      );
    } else if (children != null) {
      widget = Column(
        mainAxisAlignment: mainAxisAlignment,
        crossAxisAlignment: crossAxisAlignment,
        mainAxisSize: mainAxisSize,
        children: List.generate(
          children!.length,
          (index) {
            Widget widget;
            if (children!.elementAt(index) is UnaffectedChildWidget) {
              widget = children!.elementAt(index);
            } else {
              widget = Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppDimensions.kAppHorizontalPadding,
                ),
                child: children!.elementAt(index),
              );
            }
            return widget;
          },
        ),
      );
    } else {
      widget = const SizedBox();
    }
    return widget;
  }
}
