import 'package:fitness_app/Core/utlis/app_theme.dart';
import 'package:fitness_app/Features/layout/presentation/view/layout_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'Core/Api/simple_bloc_observer.dart';

void main()async{
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer= SimpleBlocObserver();
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


