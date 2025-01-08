import 'package:flutter/material.dart';
import 'package:money_flow/core/router/router.dart';
import 'package:money_flow/core/theme/app_theme.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Money Flow',
      routerConfig: appRouter,
      theme: AppTheme().getTheme(),
    );
  }
}
