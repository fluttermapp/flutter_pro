import 'package:flutter/material.dart';
import 'package:flutter_pro/core/constants/words.dart';

import '../../../scaffolds/app_bar_scaffold.dart';
import 'widgets/profile_widget.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const AppBarScaffold(
      title: Words.myProfile,
      actions: [
        /* Badge.count(
          offset: const Offset(-5, 5),
          count: 3,
          child: IconButton(
            onPressed: () {},
            icon: const Icon(Icons.notifications_none),
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.bookmark_added_outlined),
        ), */
      ],
      child: ProfileWidget(),
    );
  }
}
