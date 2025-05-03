import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:notes_application/Routes/routes.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Timer(
        Duration(
          seconds: 4,
        ), () {
      Get.offNamed(Routes.home);
    });
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          // Radial gradient background
          Positioned.fill(
            child: Container(
              decoration: const BoxDecoration(
                gradient: RadialGradient(
                  center: Alignment(0.0, -0.3),
                  radius: 0.9,
                  colors: [
                    Colors.deepPurple,
                    Colors.black,
                  ],
                ),
              ),
            ),
          ),

          // Main content
          Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Icon with glow and animation
                Icon(
                  Icons.edit_note,
                  size: 120,
                  color: Colors.purpleAccent,
                  shadows: [
                    Shadow(
                      color: Colors.purpleAccent,
                      blurRadius: 25,
                      offset: Offset(0, 0),
                    )
                  ],
                ).animate().fadeIn(duration: 800.ms).scale(delay: 300.ms),

                const SizedBox(height: 30),

                // App title with gradient text
                Text(
                  'Scribly',
                  style: TextStyle(
                    fontSize: 42,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 4,
                    foreground: Paint()
                      ..shader = const LinearGradient(
                        colors: [Colors.purpleAccent, Colors.deepPurple],
                      ).createShader(
                          const Rect.fromLTWH(0.0, 0.0, 200.0, 70.0)),
                  ),
                )
                    .animate()
                    .fadeIn(duration: 600.ms)
                    .moveY(begin: 20, delay: 500.ms),

                const SizedBox(height: 10),

                // Slogan
                const Text(
                  'Write. Remember. Relive.',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                    fontStyle: FontStyle.italic,
                  ),
                )
                    .animate()
                    .fadeIn(duration: 500.ms)
                    .moveY(begin: 10, delay: 800.ms),

                const SizedBox(height: 30),

                // Loading dots animation
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: List.generate(3, (i) {
                    return Animate(
                      effects: [
                        FadeEffect(duration: 400.ms, curve: Curves.easeIn),
                        MoveEffect(
                          duration: 600.ms,
                          begin: const Offset(0, 6),
                          end: const Offset(0, -6),
                          curve: Curves.easeInOut,
                          delay: (i * 200).ms,
                        ),
                      ],
                      onPlay: (controller) => controller.repeat(reverse: true),
                      child: Container(
                        width: 10,
                        height: 10,
                        margin: const EdgeInsets.symmetric(horizontal: 5),
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                        ),
                      ),
                    );
                  }),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
