import 'package:go_router/go_router.dart';
import 'package:money_flow/presentation/pages/details_screen.dart';
import 'package:money_flow/presentation/pages/home/home_screen.dart';

// GoRouter configuration
 final _router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => HomeScreen(),
    ),
     GoRoute(
      path: '/details',
      builder: (context, state) => DetailsScreen(),
    ),
    
  ],
);

class AppRouter {
  GoRouter getRouter() => _router;
}