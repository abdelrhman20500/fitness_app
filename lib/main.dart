import 'package:fitness_app/Core/utlis/app_theme.dart';
import 'package:fitness_app/Features/layout/presentation/view/layout_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.lightTheme,
      debugShowCheckedModeBanner: false,
      home: LayoutScreen()
    );
  }
}


