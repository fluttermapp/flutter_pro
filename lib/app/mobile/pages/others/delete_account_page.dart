import 'package:flutter/material.dart';
import 'package:flutter_pro/app/mobile/scaffolds/app_bottom_bar_buttons.dart';
import 'package:flutter_pro/app/mobile/widgets/button_widget.dart';
import 'package:flutter_pro/core/theme/app_text_styles.dart';

import '../../../../core/constants/words.dart';
import '../../../../core/notifiers/notifiers.dart';

class DeleteAccountPage extends StatefulWidget {
  const DeleteAccountPage({super.key});

  @override
  State<DeleteAccountPage> createState() => _DeleteAccountPageState();
}

class _DeleteAccountPageState extends State<DeleteAccountPage> {
  final formKey = GlobalKey<FormState>();
  TextEditingController controllerEmail = TextEditingController();
  TextEditingController controllerPassword = TextEditingController();
  String errorMessage = '';

  void deleteAccount() {
    AppData.isAuthConnected.value = false;
    AppData.navBarCurrentIndexNotifier.value = 0;
    AppData.onboardingCurrentIndexNotifier.value = 0;
    popPage();
  }

  void popPage() {
    Navigator.pop(context);
  }

  @override
  void dispose() {
    controllerEmail.dispose();
    controllerPassword.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AppBottomBarButtons(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            children: [
              const SizedBox(height: 60.0),
              const Text(
                Words.deleteMyAccount,
                style: AppTextStyles.xxlBold,
              ),
              const SizedBox(height: 20.0),
              const Text(
                '❌',
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
                          labelText: Words.enterYourEmail,
                        ),
                        validator: (String? value) {
                          if (value == null) {
                            return Words.enterSomething;
                          }
                          if (value.trim().isEmpty) {
                            return Words.enterSomething;
                          }
                          if (controllerEmail.text.contains('@') == false) {
                            return Words.invalidEmailEntered;
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 10),
                      TextFormField(
                        controller: controllerPassword,
                        decoration: const InputDecoration(
                          labelText: Words.currentPassword,
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
                      Text(
                        errorMessage,
                        style: AppTextStyles.m.copyWith(
                          color: Colors.redAccent,
                        ),
                      ),
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
          label: Words.deletePermanently,
          isFilled: true,
          callback: () {
            if (formKey.currentState!.validate()) {
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: const Text(Words.finalNotice),
                    content: const Text(
                      Words
                          .areYouSureYouWantToDeleteYourAccountThisActionIsIrreversible,
                      style: AppTextStyles.m,
                    ),
                    actions: [
                      TextButton(
                        onPressed: () async {
                          popPage();
                          deleteAccount();
                        },
                        child: const Text(Words.deletePermanently),
                      ),
                      TextButton(
                        onPressed: () {
                          popPage();
                        },
                        child: const Text(Words.cancel),
                      ),
                    ],
                  );
                },
              );
            }
          },
        ),
      ],
    );
  }
}
