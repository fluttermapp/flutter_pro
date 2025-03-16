import 'package:flutter/material.dart';
import 'package:flutter_pro/app/habit_tracker/view/providers/user_habit_provider.dart';
import 'package:flutter_pro/core/constants/app_dimensions.dart';
import 'package:flutter_pro/core/constants/app_formatters.dart';
import 'package:flutter_pro/core/theme/app_text_styles.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class CustomDatePicker extends StatefulWidget {
  const CustomDatePicker({super.key});

  @override
  CustomDatePickerState createState() => CustomDatePickerState();
}

class CustomDatePickerState extends State<CustomDatePicker> {
  DateTime selectedMonth = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        _buildMonthNavigationBar(),
        const SizedBox(height: AppDimensions.kPadding10),
        _buildCalendarGrid(),
      ],
    );
  }

  void _goToPreviousMonth() {
    if (selectedMonth
        .isAfter(DateTime.now().subtract(const Duration(days: 365)))) {
      setState(() {
        selectedMonth = DateTime(selectedMonth.year, selectedMonth.month - 1);
      });
    }
  }

  void _goToNextMonth() {
    if (selectedMonth.month < DateTime.now().month ||
        selectedMonth.year < DateTime.now().year) {
      setState(() {
        selectedMonth = DateTime(selectedMonth.year, selectedMonth.month + 1);
      });
    }
  }

  Widget _buildMonthNavigationBar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: const EdgeInsets.all(AppDimensions.kPadding10),
          child: IconButton(
            icon: const Icon(Icons.arrow_back_ios_rounded),
            onPressed: _goToPreviousMonth,
          ),
        ),
        Text(
          DateFormat(AppFormatters.dateFormatMMMMyyyy).format(selectedMonth),
          style: AppTextStyles.xl,
        ),
        Padding(
          padding: const EdgeInsets.all(AppDimensions.kPadding10),
          child: IconButton(
            icon: const Icon(Icons.arrow_forward_ios_rounded),
            onPressed: _goToNextMonth,
          ),
        ),
      ],
    );
  }

  Widget _buildCalendarGrid() {
    DateTime firstDayOfMonth =
        DateTime(selectedMonth.year, selectedMonth.month, 1);
    int daysInMonth =
        DateTime(selectedMonth.year, selectedMonth.month + 1, 0).day;

    int startDayOfWeek = firstDayOfMonth.weekday;

    int totalCells = 42;

    return Padding(
      padding: const EdgeInsets.all(AppDimensions.kPadding15),
      child: GridView.builder(
        shrinkWrap: true,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 7,
          crossAxisSpacing: 4.0,
          mainAxisSpacing: 4.0,
        ),
        itemCount: totalCells,
        itemBuilder: (context, index) {
          int dayOfMonth = index - startDayOfWeek + 1;

          if (dayOfMonth <= 0 || dayOfMonth > daysInMonth) {
            return Container();
          }
          DateTime date =
              DateTime(selectedMonth.year, selectedMonth.month, dayOfMonth);
          bool isSelectable = !date.isAfter(DateTime.now());
          Color boxColor = _getBoxColor(date, isSelectable);
          UserHabitProvider userHabitProvider =
              Provider.of<UserHabitProvider>(context, listen: false);
          return GestureDetector(
            onTap: isSelectable
                ? () {
                    userHabitProvider.eitherFailureOrUserHabitDateUpdate(
                        date: date);
                  }
                : null,
            child: Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                border: Border.all(
                  color: boxColor,
                  width: 3,
                ),
              ),
              child: Text(
                '$dayOfMonth',
                style: AppTextStyles.lBold
                    .copyWith(color: isSelectable ? null : Colors.white10),
              ),
            ),
          );
        },
      ),
    );
  }

  Color _getBoxColor(DateTime date, bool isSelectable) {
    UserHabitProvider userHabitProvider =
        Provider.of<UserHabitProvider>(context);
    int progress = userHabitProvider.userHabit!.getProgressFromDateTime(date);
    Color color;
    if (progress == 1) {
      color = Theme.of(context).colorScheme.primary;
    } else {
      color = Colors.white30;
    }
    if (isSelectable == false) {
      color = Colors.white10;
    }
    return color;
  }
}
