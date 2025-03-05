import 'package:flutter/material.dart';
import 'package:flutter_pro/core/theme/app_text_styles.dart';

import '../../../../../../core/constants/words.dart';
import '../../../../../habit_tracker/view/widgets/habit_tracker_widget.dart';
import '../../../../scaffolds/app_padding_scaffold.dart';
import '../../../../widgets/list_tile_widget.dart';

class HomeRecommendedWidget extends StatelessWidget {
  const HomeRecommendedWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return AppPaddingScaffold(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const ListTileWidget(
          title: Text(
            Words.dailyHabit,
            style: AppTextStyles.xlBold,
          ),
          widgets: [
            Text(
              Words.growthStartsWithin,
              style: AppTextStyles.m,
            ),
          ],
        ),
        const HabitTrackerWidget(),
        const SizedBox(height: 10.0),
      ],
    );
  }
}
