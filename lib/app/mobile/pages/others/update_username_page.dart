import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_pro/app/mobile/scaffolds/app_bottom_bar_buttons.dart';
import 'package:flutter_pro/core/constants/words.dart';
import 'package:flutter_pro/core/theme/app_text_styles.dart';

import '../../widgets/button_widget.dart';

class UpdateUsernamePage extends StatefulWidget {
  const UpdateUsernamePage({super.key});

  @override
  State<UpdateUsernamePage> createState() => _UpdateUsernamePageState();
}

class _UpdateUsernamePageState extends State<UpdateUsernamePage> {
  TextEditingController controllerUsername = TextEditingController();

  final formKey = GlobalKey<FormState>();
  String errorMessage = '';

  @override
  void dispose() {
    controllerUsername.dispose();
    super.dispose();
  }

  void showSnackBarSuccess() {
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      backgroundColor: Theme.of(context).colorScheme.primary,
      behavior: SnackBarBehavior.floating,
      content: Text(
        Words.usernameChangedSuccessfully,
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
        Words.usernameChangeFailed,
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
                Words.updateUsername,
                style: AppTextStyles.xxlBold,
              ),
              const SizedBox(height: 20.0),
              const Text(
                '✏️',
                style: AppTextStyles.icons,
              ),
              const SizedBox(height: 50),
              Form(
                key: formKey,
                child: Center(
                  child: Column(
                    children: [
                      TextFormField(
                        controller: controllerUsername,
                        decoration: const InputDecoration(
                          labelText: Words.newUsername,
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
          label: Words.updateUsername,
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
