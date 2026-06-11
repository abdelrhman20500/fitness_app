import 'dart:async';

import 'package:fitness_app/Features/auth/presentation/screens/onboarding_screen.dart';
import 'package:fitness_app/Features/layout/presentation/view/layout_screen.dart';
import 'package:flutter/material.dart';

import '../../../../Core/routes/app_rout.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {

    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, Routes.loginScreen);



    });
    }
  Widget build(BuildContext context) {
    return Scaffold(
          backgroundColor: const Color(0xFF0B121F),
          body: Column(
            children: [
              Expanded(
                flex: 6,
                child: SizedBox(
                  width: double.infinity,
                  child: Image.asset(
                    "assets/images/trainning.png",
                    fit: BoxFit.cover,
                  ),
                ),
              ),

              Expanded(
                flex: 4,
                child: SafeArea(
                  top: false,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 20.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: 70,
                          height: 70,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: const Color(0xFF141E33),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.blue.withOpacity(0.3),
                                blurRadius: 20,
                                spreadRadius: 2,
                              )
                            ],
                          ),
                          child: const Icon(
                            Icons.fitness_center,
                            color: Colors.white,
                            size: 35,
                          ),
                        ),

                        RichText(
                          text: const TextSpan(
                            style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, letterSpacing: 1.5),
                            children: [
                              TextSpan(text: 'IRON', style: TextStyle(color: Colors.white)),
                              TextSpan(text: 'PULSE', style: TextStyle(color: Color(0xFF007BFF))),
                            ],
                          ),
                        ),

                        Container(
                          width: 40,
                          height: 3,
                          decoration: BoxDecoration(
                            color: const Color(0xFF007BFF),
                            borderRadius: BorderRadius.circular(2),
                          ),
                        ),

                        const Text(
                          'FEEL THE ENERGY',
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            letterSpacing: 3,
                          ),
                        ),

                        const SizedBox(height: 10),

                        ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: const SizedBox(
                            width: 150,
                            height: 4,
                            child: LinearProgressIndicator(
                              value: 0.6,
                              backgroundColor: Color(0xFF1E293B),
                              valueColor: AlwaysStoppedAnimation<Color>(Color(0xFF007BFF)),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
    }
}
