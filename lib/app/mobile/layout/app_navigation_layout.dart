import 'package:flutter/material.dart';
import '../../../core/notifiers/notifiers.dart';
import '../pages/main/home/home_page.dart';
import '../pages/main/profile/profile_page.dart';
import '../widgets/bottom_navigation_bar_widget.dart';

class AppNavigationLayout extends StatelessWidget {
  const AppNavigationLayout({super.key});

  @override
  Widget build(BuildContext context) {
    List<Widget> pages = const [
      HomePage(),
      ProfilePage(),
    ];
    return ValueListenableBuilder(
      valueListenable: AppData.navBarCurrentIndexNotifier,
      builder: (context, currentIndex, child) {
        return Scaffold(
          body: SafeArea(
            child: pages.elementAt(currentIndex),
          ),
          bottomNavigationBar: BottomNavigationBarWidget(
            onPressed: (int index) {
              AppData.navBarCurrentIndexNotifier.value = index;
            },
            selectedIndex: currentIndex,
          ),
        );
      },
    );
  }
}
