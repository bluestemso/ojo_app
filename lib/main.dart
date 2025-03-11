import 'package:flutter/material.dart';
// import 'package:audioplayers/audioplayers.dart';
// import 'dart:async';
// import 'dart:math' as math;
import 'flex_theme.dart';
import 'screens/start_screen.dart';
void main() {
  runApp(const EyeRestApp());
}

class EyeRestApp extends StatelessWidget {
  const EyeRestApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Eye Rest Timer',
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      themeMode: ThemeMode.system,
      home: const StartScreen(),
    );
  }
}

