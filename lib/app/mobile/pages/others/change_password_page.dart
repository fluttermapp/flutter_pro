import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_pro/app/mobile/scaffolds/app_bottom_bar_buttons.dart';
import 'package:flutter_pro/core/constants/words.dart';
import 'package:flutter_pro/core/theme/app_text_styles.dart';

import '../../widgets/button_widget.dart';

class ChangePasswordPage extends StatefulWidget {
  const ChangePasswordPage({super.key});

  @override
  State<ChangePasswordPage> createState() => _ChangePasswordPageState();
}

class _ChangePasswordPageState extends State<ChangePasswordPage> {
  TextEditingController controllerEmail = TextEditingController();
  TextEditingController controllerCurrentPassword = TextEditingController();
  TextEditingController controllerNewPassword = TextEditingController();
  final formKey = GlobalKey<FormState>();
  String errorMessage = '';

  @override
  void dispose() {
    controllerEmail.dispose();
    controllerCurrentPassword.dispose();
    controllerNewPassword.dispose();
    super.dispose();
  }

  void showSnackBarSuccess() {
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      backgroundColor: Theme.of(context).colorScheme.primary,
      behavior: SnackBarBehavior.floating,
      content: Text(
        Words.passwordChangedSuccessfully,
        style: AppTextStyles.m,
      ),
      showCloseIcon: true,
    ));
  }

  void showSnackBarFailure() {
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      backgroundColor: Theme.of(context).colorScheme.error,
      behavior: SnackBarBehavior.floating,
      content: Text(
        Words.passwordChangeFailed,
        style: AppTextStyles.m,
      ),
      showCloseIcon: true,
    ));
  }

  @override
  Widget build(BuildContext context) {
    return AppBottomBarButtons(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Center(
          child: Column(
            children: [
              const SizedBox(height: 60.0),
              const Text(
                Words.changePassword,
                style: AppTextStyles.xxlBold,
              ),
              const SizedBox(height: 20.0),
              const Text(
                '🔐',
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
                        controller: controllerCurrentPassword,
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
                      TextFormField(
                        controller: controllerNewPassword,
                        decoration: const InputDecoration(
                          labelText: Words.newPassword,
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
              const Spacer(),
            ],
          ),
        ),
      ),
      buttons: [
        ButtonWidget(
          isFilled: true,
          label: Words.changePassword,
          callback: () async {
            if (formKey.currentState!.validate()) {
              if (Random().nextBool()) {
                showSnackBarFailure();
              } else {
                showSnackBarSuccess();
              }
            }
          },
        ),
      ],
    );
  }
}
