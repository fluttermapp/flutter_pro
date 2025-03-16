import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pro/app/habit_tracker/repo/user_habit_entity.dart';
import 'package:flutter_pro/app/habit_tracker/view/widgets/edit_habit_name_widget.dart';
import 'package:flutter_pro/core/constants/app_dimensions.dart';
import 'package:provider/provider.dart';
import 'custom_date_picker.dart';
import '../providers/user_habit_provider.dart';

class HabitTrackerWidget extends StatelessWidget {
  const HabitTrackerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<UserHabitProvider>(builder: (context, userHabit, child) {
      Widget widget;
      if (userHabit.userHabit != null) {
        UserHabitEntity data = userHabit.userHabit!;
        int daysAgoNow = 0;
        Widget iconWidget;
        Color iconBackgroundColor;
        Color iconForegroundColor;
        if (data.isCompleted(daysAgoNow)) {
          iconWidget = const Icon(Icons.check);
          iconBackgroundColor = Theme.of(context).colorScheme.primary;
          iconForegroundColor = Theme.of(context).colorScheme.onPrimary;
        } else {
          iconWidget = const Icon(Icons.add);
          iconBackgroundColor =
              Theme.of(context).colorScheme.secondaryContainer;
          iconForegroundColor =
              Theme.of(context).colorScheme.onSecondaryContainer;
        }
        int nbWeeks = 52;
        int nbDays = 7;
        return GestureDetector(
          onTap: () {
            _showCustomDatePicker(context);
          },
          child: Card(
            margin: EdgeInsets.zero,
            child: Padding(
              padding: const EdgeInsets.all(AppDimensions.kPadding10),
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: EditHabitNameWidget(),
                      ),
                      SizedBox(width: AppDimensions.kPadding10),
                      FloatingActionButton.small(
                        onPressed: () {
                          DateTime date = _fromDaysAgoToDate(daysAgoNow);
                          userHabit.eitherFailureOrUserHabitDateUpdate(
                              date: date);
                        },
                        backgroundColor: iconBackgroundColor,
                        foregroundColor: iconForegroundColor,
                        child: iconWidget,
                      ),
                    ],
                  ),
                  const SizedBox(height: AppDimensions.kPadding10),
                  SingleChildScrollView(
                    reverse: true,
                    scrollDirection: Axis.horizontal,
                    dragStartBehavior: DragStartBehavior.down,
                    child: Row(
                      children: List.generate(
                        nbWeeks,
                        (rowIndex) {
                          return Column(
                            children: List.generate(
                              nbDays,
                              (columnIndex) {
                                int daysAgo =
                                    calculateDaysAgo(rowIndex, columnIndex);
                                Color boxColor;
                                if (data.isCompleted(daysAgo)) {
                                  boxColor =
                                      Theme.of(context).colorScheme.primary;
                                } else {
                                  boxColor = Colors.grey;
                                }
                                return Container(
                                  margin: const EdgeInsets.all(
                                      AppDimensions.kMargin2),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(
                                        AppDimensions.kBorderRadius3),
                                    color: boxColor,
                                  ),
                                  width: 12,
                                  height: 12,
                                );
                              },
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      } else {
        widget = const Center();
      }
      return widget;
    });
  }

  DateTime _fromDaysAgoToDate(int daysAgo) {
    DateTime targetDate = DateTime.now().subtract(Duration(days: daysAgo));
    return targetDate;
  }

  void _showCustomDatePicker(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return const CustomDatePicker();
      },
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(AppDimensions.kBorderRadius25),
        ),
      ),
    );
  }

  int calculateDaysAgo(int rowIndex, int columnIndex) {
    final int maxWeekIndex = 51;
    final int maxDayIndex = 7;
    DateTime today = DateTime.now();
    DateTime startOfThisWeek =
        today.subtract(Duration(days: today.weekday - 1));
    DateTime targetWeekStart = startOfThisWeek
        .subtract(Duration(days: (maxWeekIndex - rowIndex) * maxDayIndex));
    DateTime targetDate = targetWeekStart.add(Duration(days: columnIndex));
    int daysAgo = today.difference(targetDate).inDays;
    return daysAgo;
  }
}
