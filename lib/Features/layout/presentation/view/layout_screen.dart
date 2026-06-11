import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fitness_app/Features/favorite/presentation/view/favorite_view.dart';
import 'package:fitness_app/Features/plans/presentation/view/plans_view.dart';
import 'package:fitness_app/Features/profile/presentation/view/profile_view.dart';
import 'package:fitness_app/Features/trainer/presentation/view/trainer_view.dart';
import '../../../../Core/theme/app_color.dart';
import '../../../../Core/theme/app_theme.dart';
import '../view_manager/nav_bar_cubit.dart';
import '../view_manager/nav_bar_state.dart';

class LayoutScreen extends StatelessWidget {
  LayoutScreen({super.key});
  static const String routeName = "LayoutScreen";

  final List<Widget> tabs = [
    Container(
      color: AppColors.primary,
      child: const TrainerView(),
    ),
    Container(
      color: AppColors.primary,
      child: const PlansView(),
    ),
    Container(
      color: AppColors.primary,
      child: const FavoriteView(),
    ),
    Container(
      color: AppColors.primary,
      child: const ProfileScreen(),
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NavBarCubit(),
      child: BlocBuilder<NavBarCubit, NavBarState>(
        builder: (context, state) {
          var cubit = BlocProvider.of<NavBarCubit>(context);
          return Scaffold(
            appBar: AppBar(
              elevation: 1,
              leading: const Icon(Icons.electric_bolt,size: 28, color: AppColors.accent,),
              title: const Text("IronPulse", style: AppTheme.appBarTitleTextStyle,),
              actions: [
                IconButton(onPressed: (){}, icon: const Icon(Icons.notifications, color: Colors.grey,size: 32,))
              ],
            ),
            body: SafeArea(
              child: tabs[cubit.currentIndex],
            ),
            bottomNavigationBar: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              currentIndex: cubit.currentIndex,
              onTap: (index) => cubit.changeIndex(index),
              items: const [
                BottomNavigationBarItem(icon: Icon(Icons.fitness_center_outlined), label: "Trainer"),
                BottomNavigationBarItem(icon: Icon(Icons.assignment_rounded), label: "Plans"),
                BottomNavigationBarItem(icon: Icon(Icons.favorite_border), label: "Favorite"),
                BottomNavigationBarItem(icon: Icon(Icons.person_outline), label: "Profile"),
              ],
            ),
          );
        },
      ),
    );
  }
}
