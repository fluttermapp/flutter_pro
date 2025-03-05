import 'package:flutter/material.dart';
import 'package:flutter_pro/core/theme/app_text_styles.dart';

import '../../../../../../core/constants/onboarding_words.dart';
import '../../../../../../core/notifiers/notifiers.dart';

class OnboardingView2 extends StatefulWidget {
  const OnboardingView2({super.key});

  @override
  State<OnboardingView2> createState() => _OnboardingView2State();
}

class _OnboardingView2State extends State<OnboardingView2> {
  late String selection;
  late String selectionTitle;
  late String selectionDescription;
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: AppData.onboardingSlider2Notifier,
      builder: (context, sliderValue, child) {
        getSelectionValue(sliderValue);
        return Padding(
          padding: const EdgeInsets.all(30.0),
          child: Center(
            child: Column(
              children: [
                const Text(
                  OnboardingWords.whatDoYouNeedMoreHelpWith,
                  style: AppTextStyles.xxlBold,
                ),
                const SizedBox(height: 20.0),
                Text(
                  selection,
                  style: AppTextStyles.iconsXl,
                ),
                SizedBox(
                  height: 100,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      FittedBox(
                        child: Text(
                          selectionTitle,
                          style: AppTextStyles.lBold,
                        ),
                      ),
                      FittedBox(
                        child: Text(
                          selectionDescription,
                          style: AppTextStyles.m,
                        ),
                      ),
                    ],
                  ),
                ),
                Slider.adaptive(
                  value: sliderValue,
                  divisions: 2,
                  min: 1,
                  max: 3,
                  onChanged: (double value) {
                    editSliderValue(value);
                  },
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                      onPressed: () {
                        editSliderValue(1.0);
                      },
                      child: const Text(
                        OnboardingWords.offer,
                        style: AppTextStyles.xxl,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        editSliderValue(2.0);
                      },
                      child: const Text(
                        OnboardingWords.traffic,
                        style: AppTextStyles.xxl,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        editSliderValue(3.0);
                      },
                      child: const Text(
                        OnboardingWords.sales,
                        style: AppTextStyles.xxl,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void editSliderValue(value) {
    setState(() {
      AppData.onboardingSlider2Notifier.value = value;
    });
  }

  String getSelectionValue(sliderValue) {
    switch (sliderValue) {
      case 1:
        selection = OnboardingWords.offer;
        selectionTitle = OnboardingWords.offerTitle;
        selectionDescription = OnboardingWords.offerDescription;
        break;
      case 2:
        selection = OnboardingWords.traffic;
        selectionTitle = OnboardingWords.trafficTitle;
        selectionDescription = OnboardingWords.trafficDescription;
        break;
      case 3:
        selection = OnboardingWords.sales;
        selectionTitle = OnboardingWords.salesTitle;
        selectionDescription = OnboardingWords.salesDescription;
        break;
      default:
        selection = OnboardingWords.offer;
        selectionTitle = OnboardingWords.offer;
        selectionDescription = OnboardingWords.offerDescription;
    }
    return selection;
  }
}
