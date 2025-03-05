import 'package:flutter/material.dart';
import 'package:flutter_pro/app/mobile/scaffolds/app_bottom_bar_buttons.dart';
import 'package:flutter_pro/core/constants/words.dart';
import 'package:flutter_pro/core/theme/app_text_styles.dart';

import '../../../widgets/button_widget.dart';

class ResetPasswordPage extends StatefulWidget {
  const ResetPasswordPage({
    super.key,
    required this.email,
  });

  final String email;

  @override
  State<ResetPasswordPage> createState() => _ResetPasswordPageState();
}

class _ResetPasswordPageState extends State<ResetPasswordPage> {
  TextEditingController controllerEmail = TextEditingController();
  final formKey = GlobalKey<FormState>();
  String errorMessage = '';

  @override
  void initState() {
    super.initState();
    controllerEmail.text = widget.email;
  }

  @override
  void dispose() {
    controllerEmail.dispose();
    super.dispose();
  }

  void showSnackBar() {
    ScaffoldMessenger.of(context).clearMaterialBanners();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      backgroundColor: Theme.of(context).colorScheme.primary,
      content: Text(
        Words.pleaseCheckYourEmail,
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
                Words.resetPassword,
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
          label: Words.resetPassword,
          callback: () async {
            if (formKey.currentState!.validate()) {
              showSnackBar();
            }
          },
        ),
      ],
    );
  }
}
