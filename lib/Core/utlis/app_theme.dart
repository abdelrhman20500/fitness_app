// import 'package:fitness_app/Core/utlis/app_color.dart';
// import 'package:flutter/material.dart';
//
// abstract class AppTheme {
//   static const TextStyle appBarTitleTextStyle= TextStyle(fontWeight:FontWeight.bold,fontSize: 30.0,
//       color: AppColors.primary);
//   static ThemeData lightTheme = ThemeData(
//     scaffoldBackgroundColor: AppColors.transparent,
//     primaryColor: AppColors.primary,
//     dividerTheme: const DividerThemeData(
//       color: AppColors.primary,
//       thickness: 3,
//     ),
//     appBarTheme: const AppBarTheme(
//       backgroundColor: AppColors.transparent,
//       elevation: 0,
//       centerTitle: true,
//       titleTextStyle: appBarTitleTextStyle,
//     ),
//     bottomNavigationBarTheme: const BottomNavigationBarThemeData(
//       selectedItemColor: AppColors.accent,
//       selectedIconTheme: IconThemeData(size: 32),
//       unselectedIconTheme: IconThemeData(size: 26),
//     ),
//   );
// }
import 'package:flutter/material.dart';
import 'app_color.dart';

abstract class AppTheme {
  static const TextStyle appBarTitleTextStyle = TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 24.0,
    color: AppColors.white
  );

  static ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: Colors.white,
    primaryColor: AppColors.primary,
    dividerTheme: const DividerThemeData(
      color: AppColors.primary,
      thickness: 3,
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.primary,
      elevation: 0,
      centerTitle: true,
      titleTextStyle: appBarTitleTextStyle,
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: AppColors.primary,
      selectedItemColor: AppColors.accent,
      unselectedItemColor: Colors.grey,
      selectedIconTheme: IconThemeData(size: 32),
      unselectedIconTheme: IconThemeData(size: 26),
    ),
  );
}
