import 'package:flutter/material.dart';
import 'package:my_pocket/core/router/router.dart';
import 'package:my_pocket/core/theme/app_theme.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'My Pocket',
      routerConfig: appRouter,
      theme: AppTheme().getTheme(),
    );
  }
}
