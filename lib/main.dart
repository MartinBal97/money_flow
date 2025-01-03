import 'package:flutter/material.dart';
import 'package:money_flow/core/app_theme.dart';
import 'package:money_flow/core/router.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Money Flow',
      routerConfig: AppRouter().getRouter(),
      theme: AppTheme().getTheme(),
    );
  }
}
