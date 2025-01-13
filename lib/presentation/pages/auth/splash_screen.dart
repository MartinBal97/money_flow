import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:my_pocket/core/router/routes.dart';
import 'package:my_pocket/core/theme/app_theme.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    )..repeat(reverse: false);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _navigateToHome(BuildContext context) {
    context.go(AppRoutes.authentication);
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
        child: AnimatedBuilder(
          animation: _controller,
          builder: (context, child) {
            return ShaderMask(
              shaderCallback: (bounds) {
                return LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [
                    Colors.grey.withValues(alpha: 0.1),
                    Colors.grey.withValues(alpha: 0.7),
                    Colors.grey.withValues(alpha: 0.1),
                  ],
                  stops: [
                    _controller.value - 0.2,
                    _controller.value,
                    _controller.value + 0.2,
                  ],
                ).createShader(bounds);
              },
              blendMode: BlendMode.srcATop,
              child: SvgPicture.asset(
                'assets/images/logo.svg', // Ruta de tu archivo SVG
              ),
            );
          },
        ),
      ),
    );
  }
}
