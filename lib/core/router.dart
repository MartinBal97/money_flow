import 'package:go_router/go_router.dart';
import 'package:money_flow/presentation/pages/home/home_screen.dart';

// GoRouter configuration
 final _router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => HomeScreen(),
    ),
  ],
);

class AppRouter {
  GoRouter getRouter() => _router;
}