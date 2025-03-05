import 'package:flutter/material.dart';

class AppLoadingPage extends StatelessWidget {
  const AppLoadingPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator.adaptive(),
      ),
    );
  }
}
