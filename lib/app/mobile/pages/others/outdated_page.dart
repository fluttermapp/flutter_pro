import 'package:flutter/material.dart';
import 'package:flutter_pro/core/theme/app_text_styles.dart';

import '../../../../core/constants/words.dart';
import '../../../../core/errors/error_message.dart';
import '../../scaffolds/app_bar_scaffold.dart';
import '../../scaffolds/app_padding_scaffold.dart';
import '../../widgets/neon_padding_widget.dart';

class OutdatedPage extends StatelessWidget {
  const OutdatedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: AppBarScaffold(
        title: Words.flutterPro,
        child: AppPaddingScaffold(
          child: NeonPaddingWidget(
            child: Text(
              ErrorMessage.appVersionIsOutdated,
              style: AppTextStyles.xlBold,
            ),
          ),
        ),
      ),
    );
  }
}
