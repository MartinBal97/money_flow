import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:money_flow/presentation/pages/goals/goals_screen.dart';
import 'package:money_flow/presentation/pages/home/home_screen.dart';
import 'package:money_flow/presentation/pages/main_app_layout.dart';
import 'package:money_flow/presentation/pages/summary/summary_screen.dart';
import 'package:money_flow/presentation/pages/wallet/wallet_screen.dart';

final appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    ShellRoute(
      pageBuilder: (context, state, child) {
        return CupertinoPage(
          child: MainAppLayout(child: child),
        );
      },
      routes: [
        GoRoute(
          path: '/',
          builder: (context, state) => HomeScreen(),
        ),
        GoRoute(
          path: '/goals',
          builder: (context, state) => GoalsScreen(),
        ),
        GoRoute(
          path: '/summary',
          builder: (context, state) => SummaryScreen(),
        ),
        GoRoute(
          path: '/wallet',
          builder: (context, state) => WalletScreen(),
        ),
      ],
    )
  ],
);
