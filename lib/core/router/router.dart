import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:my_pocket/core/router/routes.dart';
import 'package:my_pocket/presentation/pages/auth/authentication_screen.dart';
import 'package:my_pocket/presentation/pages/goals/goals_screen.dart';
import 'package:my_pocket/presentation/pages/home/home_screen.dart';
import 'package:my_pocket/presentation/pages/main_app_layout.dart';
import 'package:my_pocket/presentation/pages/onboarding/splash_screen.dart';
import 'package:my_pocket/presentation/pages/summary/summary_screen.dart';
import 'package:my_pocket/presentation/pages/wallet/wallet_screen.dart';

const Duration duration = Duration(milliseconds: 200);
final _rootNavigatorKey = GlobalKey<NavigatorState>();

final appRouter = GoRouter(
  initialLocation: '/',
  navigatorKey: _rootNavigatorKey,
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const SplashScreen(),
    ),
    GoRoute(
      path: AppRoutes.authentication,
      builder: (context, state) => const AuthenticationScreen(),
    ),
    ShellRoute(
      pageBuilder: (context, state, child) {
        return MaterialPage(
          child: MainAppLayout(child: child),
        );
      },
      routes: [
        // Main Routes
        GoRoute(
          path: AppRoutes.home,
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
          path: AppRoutes.goals,
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
          path: AppRoutes.summary,
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
          path: AppRoutes.wallet,
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
