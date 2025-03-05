import 'package:flutter/material.dart';
import 'package:flutter_pro/app/mobile/pages/main/onboarding/onboarding_pages.dart';
import 'package:flutter_pro/core/theme/app_text_styles.dart';
import '../../../../../core/constants/words.dart';
import '../../../../../core/notifiers/notifiers.dart';
import '../../../../../core/routes/page_route_return.dart';
import '../../../scaffolds/app_bottom_bar_buttons.dart';
import '../../../widgets/button_widget.dart';
import 'widgets/bottom_stepper_widget.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({
    super.key,
  });
  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController controllerEmail = TextEditingController();
  TextEditingController controllerPassword = TextEditingController();
  final formKey = GlobalKey<FormState>();
  String errorMessage = '';

  @override
  void dispose() {
    controllerEmail.dispose();
    controllerPassword.dispose();
    super.dispose();
  }

  void register() {
    AppData.isAuthConnected.value = true;
    popPage();
  }

  void popPage() {
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return AppBottomBarButtons(
      appBar: AppBar(
        leading: ValueListenableBuilder(
          valueListenable: AppData.onboardingCurrentIndexNotifier,
          builder: (context, currentIndex, child) {
            return IconButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  pageRouteReturn(
                    previousPage: OnboardingPages(
                      initialPage: currentIndex,
                    ),
                  ),
                );
              },
              icon: const Icon(
                Icons.arrow_back_ios,
                color: Colors.white,
              ),
            );
          },
        ),
        title: const Text(Words.flutterPro),
        bottom: const PreferredSize(
          preferredSize: Size(double.infinity, double.minPositive),
          child: BottomStepperWidget(),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            children: [
              const SizedBox(height: 60.0),
              const Text(
                Words.register,
                style: AppTextStyles.xxlBold,
              ),
              const SizedBox(height: 20.0),
              const Text(
                '🔑',
                style: AppTextStyles.icons,
              ),
              const SizedBox(height: 50),
              Form(
                key: formKey,
                child: Center(
                  child: Column(
                    children: [
                      TextFormField(
                        controller: controllerEmail,
                        decoration: const InputDecoration(
                          labelText: Words.email,
                        ),
                        validator: (String? value) {
                          if (value == null) {
                            return Words.enterSomething;
                          }
                          if (value.trim().isEmpty) {
                            return Words.enterSomething;
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 10),
                      TextFormField(
                        controller: controllerPassword,
                        decoration: const InputDecoration(
                          labelText: Words.password,
                        ),
                        validator: (String? value) {
                          if (value == null) {
                            return Words.enterSomething;
                          }
                          if (value.trim().isEmpty) {
                            return Words.enterSomething;
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 10),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      buttons: [
        ButtonWidget(
          isFilled: true,
          label: Words.register,
          callback: () {
            if (formKey.currentState!.validate()) {
              register();
            }
          },
        ),
      ],
    );
  }
}
