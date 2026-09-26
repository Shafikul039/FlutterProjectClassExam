import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../core/quiz_assets.dart';
import '../../core/quiz_constants.dart';
import '../../core/quiz_theme.dart';
import 'category_selection_screen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final isWide = size.width > 600;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: isWide ? size.width * 0.2 : 28,
            vertical: 24,
          ),
          child: Column(
            children: [
              const Spacer(flex: 1),
              _WelcomeArt(height: size.height * 0.32),
              const SizedBox(height: 28),
              Text(
                'Quizzical',
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(
                  fontSize: isWide ? 42 : 36,
                  fontWeight: FontWeight.w700,
                  color: kQuizText,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                kStudentName,
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(
                  fontSize: isWide ? 22 : 18,
                  fontWeight: FontWeight.w500,
                  color: kQuizText.withValues(alpha: 0.85),
                ),
              ),
              const Spacer(flex: 2),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (_) => const CategorySelectionScreen(),
                      ),
                    );
                  },
                  child: const Text('START QUIZ'),
                ),
              ),
              const SizedBox(height: 12),
            ],
          ),
        ),
      ),
    );
  }
}

class _WelcomeArt extends StatelessWidget {
  const _WelcomeArt({required this.height});

  final double height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height.clamp(160.0, 280.0),
      width: double.infinity,
      child: Image.asset(
        QuizAssets.welcomeHero,
        fit: BoxFit.contain,
        filterQuality: FilterQuality.high,
      ),
    );
  }
}
