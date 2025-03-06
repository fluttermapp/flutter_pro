import 'package:flutter/material.dart';
import 'package:flutter_pro/app/habit_tracker/repo/user_habit_entity.dart';
import 'package:flutter_pro/app/habit_tracker/view/providers/user_habit_provider.dart';
import 'package:flutter_pro/core/constants/app_dimensions.dart';
import 'package:flutter_pro/core/constants/app_formatters.dart';
import 'package:flutter_pro/core/theme/app_text_styles.dart';
import 'package:provider/provider.dart';

import '../../../../core/constants/words.dart';

class EditHabitNameWidget extends StatefulWidget {
  const EditHabitNameWidget({super.key});

  @override
  State<EditHabitNameWidget> createState() => _EditHabitNameWidgetState();
}

class _EditHabitNameWidgetState extends State<EditHabitNameWidget> {
  final formKey = GlobalKey<FormState>();
  String errorMessage = '';
  TextEditingController controller = TextEditingController();
  bool isEditMode = false;

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void showSnackBarFailure() {
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      backgroundColor: Colors.redAccent,
      behavior: SnackBarBehavior.floating,
      content: Text(
        Words.nameChangeFailed,
        style: AppTextStyles.m,
      ),
      showCloseIcon: true,
    ));
  }

  @override
  Widget build(BuildContext context) {
    UserHabitEntity userHabit =
        Provider.of<UserHabitProvider>(context).userHabit!;
    controller.text =
        controller.text.isEmpty ? userHabit.name : controller.text;

    Future<void> saveValue() async {
      if (formKey.currentState!.validate()) {
        UserHabitProvider userProvider =
            Provider.of<UserHabitProvider>(context, listen: false);
        await userProvider.eitherFailureOrUserHabitNameUpdate(
            name: controller.text);
        if (userProvider.failure != null) {
          showSnackBarFailure();
        }
        setState(() {
          isEditMode = !isEditMode;
        });
      }
    }

    return Consumer<UserHabitProvider>(
      builder: (context, userHabitProvider, child) {
        return AnimatedCrossFade(
          firstChild: FilledButton.tonal(
            onPressed: () {
              setState(() {
                isEditMode = !isEditMode;
              });
            },
            style: FilledButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius:
                    BorderRadius.circular(AppDimensions.kBorderRadius10),
              ),
            ),
            child: Text(
              userHabitProvider.userHabit!.name,
              style: AppTextStyles.m,
            ),
          ),
          secondChild: Form(
            key: formKey,
            child: Center(
              child: Column(
                children: [
                  TextFormField(
                    inputFormatters: AppFormatters.lengthLimiting25,
                    controller: controller,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(AppDimensions.kBorderRadius10),
                        ),
                      ),
                      suffixIcon: IconButton(
                        onPressed: () {
                          saveValue();
                        },
                        icon: const Icon(
                          Icons.check,
                          color: Colors.white54,
                        ),
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: AppDimensions.kPadding25),
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
                    onFieldSubmitted: (value) async {
                      await saveValue();
                    },
                  ),
                  if (errorMessage != '') ...[
                    const SizedBox(height: AppDimensions.kPadding10),
                    Text(
                      errorMessage,
                      style: AppTextStyles.m.copyWith(
                        color: Colors.redAccent,
                      ),
                    ),
                  ],
                ],
              ),
            ),
          ),
          crossFadeState:
              isEditMode ? CrossFadeState.showSecond : CrossFadeState.showFirst,
          duration: const Duration(milliseconds: 200),
        );
      },
    );
  }
}
