import 'package:flutter/material.dart';
import '../../../../../core/constants/words.dart';
import '../../../scaffolds/app_bar_scaffold.dart';
import 'widgets/home_recommended_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const AppBarScaffold(
      title: Words.explore,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          HomeRecommendedWidget(),
        ],
      ),
    );
  }
}
