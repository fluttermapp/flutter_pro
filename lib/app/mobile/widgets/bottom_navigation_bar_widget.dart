import 'package:flutter/material.dart';

import '../../../core/constants/words.dart';

class BottomNavigationBarWidget extends StatelessWidget {
  const BottomNavigationBarWidget({
    super.key,
    required this.onPressed,
    required this.selectedIndex,
  });

  final Function(int) onPressed;
  final int selectedIndex;

  @override
  Widget build(BuildContext context) {
    return NavigationBar(
      destinations: const [
        NavigationDestination(
          icon: Icon(Icons.dashboard_outlined),
          selectedIcon: Icon(Icons.dashboard),
          label: Words.explore,
        ),
        NavigationDestination(
          icon: Icon(Icons.bookmark_border_outlined),
          selectedIcon: Icon(Icons.bookmark),
          label: Words.myProfile,
        ),
      ],
      selectedIndex: selectedIndex,
      onDestinationSelected: (int index) {
        onPressed(index);
      },
    );
  }
}
