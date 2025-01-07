import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:money_flow/presentation/pages/goals/goals_screen.dart';
import 'package:money_flow/presentation/pages/home/home_screen.dart';
import 'package:money_flow/presentation/pages/main_app_layout.dart';
import 'package:money_flow/presentation/pages/summary/summary_screen.dart';
import 'package:money_flow/presentation/pages/wallet/wallet_screen.dart';

const Duration duration = Duration(milliseconds: 200);

final appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    ShellRoute(
      pageBuilder: (context, state, child) {
        return MaterialPage(
          child: MainAppLayout(child: child),
        );
      },
      routes: [
        // Main Routes
        GoRoute(
          path: '/',
          pageBuilder: (context, state) => CustomTransitionPage<void>(
            key: state.pageKey,
            child: HomeScreen(),
            transitionDuration: duration,
            reverseTransitionDuration: duration,
            transitionsBuilder: (context, animation, secondaryAnimation, child) {
              return FadeTransition(
                opacity: animation,
                child: child,
              );
            },
          ),
        ),
        GoRoute(
          path: '/goals',
          pageBuilder: (context, state) => CustomTransitionPage<void>(
            key: state.pageKey,
            child: GoalsScreen(),
            transitionDuration: duration,
            reverseTransitionDuration: duration,
            transitionsBuilder: (context, animation, secondaryAnimation, child) {
              return FadeTransition(
                opacity: animation,
                child: child,
              );
            },
          ),
        ),
        GoRoute(
          path: '/summary',
          pageBuilder: (context, state) => CustomTransitionPage<void>(
            key: state.pageKey,
            child: SummaryScreen(),
            transitionDuration: duration,
            reverseTransitionDuration: duration,
            transitionsBuilder: (context, animation, secondaryAnimation, child) {
              return FadeTransition(
                opacity: animation,
                child: child,
              );
            },
          ),
        ),
        GoRoute(
          path: '/wallet',
          pageBuilder: (context, state) => CustomTransitionPage<void>(
            key: state.pageKey,
            child: WalletScreen(),
            transitionDuration: duration,
            reverseTransitionDuration: duration,
            transitionsBuilder: (context, animation, secondaryAnimation, child) {
              return FadeTransition(
                opacity: animation,
                child: child,
              );
            },
          ),
        ),
      ],
    )
  ],
);
