import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_pro/core/theme/app_theme.dart';
import 'package:provider/provider.dart';

import 'app/habit_tracker/view/providers/user_habit_provider.dart';
import 'app/mobile/layout/init_app_layout.dart';
import 'core/constants/words.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
    [DeviceOrientation.portraitUp],
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => UserHabitProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: Words.flutterPro,
        theme: AppTheme.dark,
        home: const InitAppLayout(),
      ),
    );
  }
}
