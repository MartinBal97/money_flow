import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:my_pocket/core/router/routes.dart';
import 'package:my_pocket/presentation/cubits/cubit/auth_cubit.dart';
import 'package:my_pocket/presentation/pages/auth/authentication_screen.dart';
import 'package:my_pocket/presentation/pages/auth/signin_screen.dart';
import 'package:my_pocket/presentation/pages/auth/signup_screen.dart';
import 'package:my_pocket/presentation/pages/auth/splash_screen.dart';
import 'package:my_pocket/presentation/pages/expenses_incomes/expenses_incomes_screen.dart';
import 'package:my_pocket/presentation/pages/goals/goals_screen.dart';
import 'package:my_pocket/presentation/pages/home/home_screen.dart';
import 'package:my_pocket/presentation/pages/loading_screen.dart';
import 'package:my_pocket/presentation/pages/main_app_layout.dart';
import 'package:my_pocket/presentation/pages/profile/profile_screen.dart';
import 'package:my_pocket/presentation/pages/summary/summary_screen.dart';

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
      path: AppRoutes.loading,
      builder: (context, state) => const LoadingScreen(),
    ),
    GoRoute(
      path: AppRoutes.expensesIncomes,
      builder: (context, state) {
        final extra = state.extra as Map<String, dynamic>?;

        // Validar que no sea nulo y obtener los valores
        final bool isTypeIncome = extra?['isTypeIncome'] ?? false;

        return ExpensesIncomesScreen(isTypeIncome: isTypeIncome);
      },
    ),
    GoRoute(
      path: AppRoutes.authentication,
      builder: (context, state) => const AuthenticationScreen(),
      routes: [
        GoRoute(
          path: AppRoutes.signin,
          builder: (context, state) => const SignInScreen(),
        ),
        GoRoute(
          path: AppRoutes.signup,
          builder: (context, state) => const SignUpScreen(),
        ),
      ],
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
            child: const HomeScreen(),
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
            child: const GoalsScreen(),
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
            child: const SummaryScreen(),
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
          path: AppRoutes.profile,
          pageBuilder: (context, state) => CustomTransitionPage<void>(
            key: state.pageKey,
            child: const ProfileScreen(),
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
  redirect: (context, state) {
    final AuthState authState = context.read<AuthCubit>().state;

    log(authState.toString());
    log(state.uri.toString());

    final bool onAuthenticationPage = state.uri.toString() == AppRoutes.authentication;
    final bool onSignInPage = state.uri.toString() == '${AppRoutes.authentication}${AppRoutes.signin}';
    final bool onSignUpPage = state.uri.toString() == '${AppRoutes.authentication}${AppRoutes.signup}';
    //final bool onSplashPage = state.uri.toString() == '/';

    if (authState is Unauthenticated && !onAuthenticationPage && !onSignInPage && !onSignUpPage) {
      return AppRoutes.authentication;
    }
    if (authState is Authenticated && (onAuthenticationPage || onSignInPage || onSignUpPage)) {
      return AppRoutes.home;
    }
    // if (authState is AuthLoading) {
    //   return AppRoutes.loading;
    // }

    if (authState is AuthError) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('error')),
      );
    }

    return null;
  },
);
