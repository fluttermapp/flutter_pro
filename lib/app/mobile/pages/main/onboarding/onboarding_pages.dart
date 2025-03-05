import 'package:flutter/material.dart';
import '../../../../../core/constants/words.dart';
import '../../../../../core/notifiers/notifiers.dart';
import '../../../scaffolds/app_bottom_bar_buttons.dart';
import '../../../widgets/button_widget.dart';
import 'onboarding_views/onboarding_view_1.dart';
import 'onboarding_views/onboarding_view_2.dart';
import 'widgets/bottom_stepper_widget.dart';
import 'register_page.dart';

class OnboardingPages extends StatefulWidget {
  const OnboardingPages({
    super.key,
    this.initialPage,
  });
  final int? initialPage;

  @override
  State<OnboardingPages> createState() => _OnboardingPagesState();
}

class _OnboardingPagesState extends State<OnboardingPages>
    with SingleTickerProviderStateMixin {
  final formKey = GlobalKey<FormState>();
  late PageController pageController;
  List<Widget> pages = [
    const OnboardingView1(),
    const OnboardingView2(),
  ];

  @override
  void initState() {
    pageController = PageController(initialPage: widget.initialPage ?? 0);

    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AppBottomBarButtons(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            if (pageController.page == 0) {
              Navigator.pop(context);
            }
            pageController.previousPage(
              duration: const Duration(milliseconds: 300),
              curve: Curves.ease,
            );
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
        ),
        title: const Text(Words.flutterPro),
        bottom: PreferredSize(
          preferredSize: const Size(double.infinity, double.minPositive),
          child: BottomStepperWidget(
            itemCount: pages.length,
          ),
        ),
      ),
      body: PageView.builder(
        physics: const NeverScrollableScrollPhysics(parent: null),
        controller: pageController,
        itemCount: pages.length,
        itemBuilder: (context, index) {
          return pages.elementAt(index);
        },
        onPageChanged: (int value) {
          AppData.onboardingCurrentIndexNotifier.value = value;
        },
      ),
      buttons: [
        ValueListenableBuilder(
          valueListenable: AppData.onboardingCurrentIndexNotifier,
          builder: (context, currentIndex, child) {
            return ButtonWidget(
              isFilled: true,
              label: Words.continueNext,
              callback: currentIndex == 1
                  ? () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return const RegisterPage();
                          },
                        ),
                      );
                    }
                  : () {
                      AppData.onboardingCurrentIndexNotifier.value += 1;
                      pageController.nextPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.ease,
                      );
                    },
            );
          },
        ),
      ],
    );
  }
}
