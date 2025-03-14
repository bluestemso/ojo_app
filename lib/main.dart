import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'flex_theme.dart';
import 'screens/start_screen.dart';
import 'providers/timer_provider.dart';

void main() {
  runApp(const EyeRestApp());
}

class EyeRestApp extends StatelessWidget {
  const EyeRestApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => TimerProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Eye Rest Timer',
        theme: AppTheme.light,
        darkTheme: AppTheme.dark,
        themeMode: ThemeMode.system,
        home: const StartScreen(),
      ),
    );
  }
}

