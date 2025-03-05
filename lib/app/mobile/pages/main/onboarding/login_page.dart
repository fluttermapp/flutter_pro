import 'package:flutter/material.dart';
import 'package:flutter_pro/app/mobile/scaffolds/app_bottom_bar_buttons.dart';
import 'package:flutter_pro/core/notifiers/notifiers.dart';
import 'package:flutter_pro/core/theme/app_text_styles.dart';

import '../../../../../core/constants/words.dart';
import '../../../widgets/button_widget.dart';
import 'reset_password_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({
    super.key,
  });
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController controllerEmail = TextEditingController();
  TextEditingController controllerPassword = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    controllerEmail.dispose();
    controllerPassword.dispose();
    super.dispose();
  }

  void signIn() {
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            children: [
              const SizedBox(height: 60.0),
              const Text(
                Words.signIn,
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
                        style: AppTextStyles.m,
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return ResetPasswordPage(
                                      email: controllerEmail.text);
                                },
                              ),
                            );
                          },
                          child: const Text(Words.resetPassword),
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
          isFilled: true,
          label: Words.signIn,
          callback: () {
            if (formKey.currentState!.validate()) {
              signIn();
            }
          },
        ),
      ],
    );
  }
}
