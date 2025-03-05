import 'package:flutter/material.dart';
import 'package:flutter_pro/app/mobile/pages/others/change_password_page.dart';
import 'package:flutter_pro/app/mobile/pages/others/update_username_page.dart';
import 'package:flutter_pro/core/constants/app_dimensions.dart';
import 'package:flutter_pro/core/constants/words.dart';
import 'package:flutter_pro/core/theme/app_text_styles.dart';

import '../../../../../../core/notifiers/notifiers.dart';
import '../../../../scaffolds/app_padding_scaffold.dart';
import '../../../../widgets/list_tile_widget.dart';
import '../../../../widgets/neon_padding_widget.dart';
import '../../../../widgets/unaffected_child_widget.dart';
import '../../../others/delete_account_page.dart';

class ProfileWidget extends StatelessWidget {
  const ProfileWidget({super.key});

  @override
  Widget build(BuildContext context) {
    void popPage() {
      Navigator.pop(context);
    }

    void logout() {
      AppData.isAuthConnected.value = false;
      AppData.navBarCurrentIndexNotifier.value = 0;
      AppData.onboardingCurrentIndexNotifier.value = 0;
      popPage();
    }

    return AppPaddingScaffold(
      mainAxisSize: MainAxisSize.min,
      children: [
        const SizedBox(height: 10.0),
        NeonPaddingWidget(
          isCentered: true,
          child: Column(
            children: [
              const Text(
                '😊',
                style: AppTextStyles.icons,
              ),
              Text(
                Words.flutterPro,
                style: AppTextStyles.l,
              ),
              Text(
                Words.flutterProEmail,
                style: AppTextStyles.m.copyWith(color: Colors.white54),
              ),
              const SizedBox(height: AppDimensions.kPadding5)
            ],
          ),
        ),
        const SizedBox(height: 20.0),
        const ListTileWidget(
          title: Text(
            Words.settings,
            style: AppTextStyles.xlBold,
          ),
        ),

        // Update username
        UnaffectedChildWidget(
          child: ListTile(
            trailing: const Icon(
              Icons.arrow_forward_ios_outlined,
              color: Colors.white38,
            ),
            title: const Text(Words.updateUsername),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return UpdateUsernamePage();
                  },
                ),
              );
            },
          ),
        ),

        // Change password
        UnaffectedChildWidget(
          child: ListTile(
            trailing: const Icon(
              Icons.arrow_forward_ios_outlined,
              color: Colors.white38,
            ),
            title: const Text(Words.changePassword),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return ChangePasswordPage();
                  },
                ),
              );
            },
          ),
        ),

        // Delete my account
        UnaffectedChildWidget(
          child: ListTile(
            trailing: const Icon(
              Icons.arrow_forward_ios_outlined,
              color: Colors.white38,
            ),
            title: const Text(Words.deleteMyAccount),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return const DeleteAccountPage();
                  },
                ),
              );
            },
          ),
        ),

        // About this app
        UnaffectedChildWidget(
          child: ListTile(
            title: const Text(Words.aboutThisApp),
            onTap: () {
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: const Text(Words.flutterPro),
                    content: const Text(
                      Words.aboutThisApp,
                      style: AppTextStyles.m,
                    ),
                    actions: [
                      FilledButton(
                        onPressed: () async {
                          popPage();
                          showLicensePage(context: context);
                        },
                        child: const Text(Words.viewLicenses),
                      ),
                      TextButton(
                        onPressed: () {
                          popPage();
                        },
                        child: const Text(Words.close),
                      ),
                    ],
                  );
                },
              );
            },
          ),
        ),

        // Logout
        UnaffectedChildWidget(
          child: ListTile(
            title: const Text(
              Words.logout,
              style: AppTextStyles.red,
            ),
            onTap: () {
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: const Text(Words.logout),
                    content: const Text(
                      Words.areYouSureYouWantToLogout,
                      style: AppTextStyles.m,
                    ),
                    actions: [
                      FilledButton(
                        onPressed: () async {
                          logout();
                        },
                        child: const Text(Words.logout),
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
            },
          ),
        ),
        const SizedBox(height: 20.0),
      ],
    );
  }
}
