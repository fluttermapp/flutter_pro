import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  const ButtonWidget({
    super.key,
    this.isFilled = false,
    required this.label,
    required this.callback,
  });
  final bool isFilled;
  final String label;
  final Function()? callback;

  @override
  Widget build(BuildContext context) {
    Widget widget;
    if (isFilled) {
      widget = ElevatedButton(
        onPressed: callback,
        style: ElevatedButton.styleFrom(
          backgroundColor: Theme.of(context).colorScheme.primary,
          foregroundColor: Colors.black87,
          minimumSize: const Size(double.infinity, 50),
        ),
        child: Text(label),
      );
    } else {
      widget = ElevatedButton(
        onPressed: callback,
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.white,
          minimumSize: const Size(double.infinity, 50),
        ),
        child: Text(label),
      );
    }

    return widget;
  }
}
