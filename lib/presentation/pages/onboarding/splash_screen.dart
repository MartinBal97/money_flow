import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:money_flow/core/constans/app_sizes.dart';
import 'package:money_flow/core/theme/app_theme.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  void _navigateToHome(BuildContext context) {
    context.go('/home');
  }

  @override
  Widget build(BuildContext context) {
    Future.delayed(
      const Duration(seconds: 3),
      () {
        if (context.mounted) _navigateToHome(context);
      },
    );

    return Scaffold(
      backgroundColor: blue500,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                color: white,
                borderRadius: BorderRadius.circular(100),
              ),
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation(blue500),
                strokeWidth: 4.0,
                backgroundColor: neutral300,
              ),
            ),
            gapH40,
            SvgPicture.asset('assets/images/logo.svg'),
          ],
        ),
      ),
    );
  }
}
