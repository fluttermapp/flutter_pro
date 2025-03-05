import 'package:flutter/material.dart';
import 'package:flutter_pro/core/theme/app_text_styles.dart';

import '../../../../../../core/constants/onboarding_words.dart';
import '../../../../../../core/notifiers/notifiers.dart';

class OnboardingView1 extends StatefulWidget {
  const OnboardingView1({super.key});

  @override
  State<OnboardingView1> createState() => _OnboardingView1State();
}

class _OnboardingView1State extends State<OnboardingView1> {
  late String mindset;
  late String mindsetTitle;
  late String mindsetDescription;
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: AppData.onboardingSlider1Notifier,
      builder: (context, sliderValue, child) {
        getMindsetValue(sliderValue);
        return Padding(
          padding: const EdgeInsets.all(30.0),
          child: Center(
            child: Column(
              children: [
                const Text(
                  OnboardingWords.howIsYourMindsetTheseDays,
                  style: AppTextStyles.xxlBold,
                ),
                const SizedBox(height: 20.0),
                Text(
                  mindset,
                  style: AppTextStyles.iconsXl,
                ),
                SizedBox(
                  height: 100,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      FittedBox(
                        child: Text(
                          mindsetTitle,
                          style: AppTextStyles.lBold,
                        ),
                      ),
                      FittedBox(
                        child: Text(
                          mindsetDescription,
                          style: AppTextStyles.m,
                        ),
                      ),
                    ],
                  ),
                ),
                Slider.adaptive(
                  value: sliderValue,
                  divisions: 4,
                  min: 1,
                  max: 5,
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
                        OnboardingWords.defeated,
                        style: AppTextStyles.xxl,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        editSliderValue(2.0);
                      },
                      child: const Text(
                        OnboardingWords.doubtful,
                        style: AppTextStyles.xxl,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        editSliderValue(3.0);
                      },
                      child: const Text(
                        OnboardingWords.neutral,
                        style: AppTextStyles.xxl,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        editSliderValue(4.0);
                      },
                      child: const Text(
                        OnboardingWords.optimistic,
                        style: AppTextStyles.xxl,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        editSliderValue(5.0);
                      },
                      child: const Text(
                        OnboardingWords.empowered,
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
      AppData.onboardingSlider1Notifier.value = value;
    });
  }

  String getMindsetValue(sliderValue) {
    switch (sliderValue) {
      case 1:
        mindset = OnboardingWords.defeated;
        mindsetTitle = OnboardingWords.defeatedTitle;
        mindsetDescription = OnboardingWords.defeatedDescription;
        break;
      case 2:
        mindset = OnboardingWords.doubtful;
        mindsetTitle = OnboardingWords.doubtfulTitle;
        mindsetDescription = OnboardingWords.doubtfulDescription;
        break;
      case 3:
        mindset = OnboardingWords.neutral;
        mindsetTitle = OnboardingWords.neutralTitle;
        mindsetDescription = OnboardingWords.neutralDescription;
        break;
      case 4:
        mindset = OnboardingWords.optimistic;
        mindsetTitle = OnboardingWords.optimisticTitle;
        mindsetDescription = OnboardingWords.optimisticDescription;
        break;
      case 5:
        mindset = OnboardingWords.empowered;
        mindsetTitle = OnboardingWords.empoweredTitle;
        mindsetDescription = OnboardingWords.empoweredDescription;
        break;
      default:
        mindset = OnboardingWords.neutral;
        mindsetTitle = OnboardingWords.neutralTitle;
        mindsetDescription = OnboardingWords.neutralDescription;
    }
    return mindset;
  }
}
