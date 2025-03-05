import 'package:flutter/material.dart';

class UnaffectedChildWidget extends StatelessWidget {
  const UnaffectedChildWidget({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return child;
  }
}
