import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:money_flow/core/router.dart';

class NavigationTabData {
  final Widget icon;
  final Widget activeIcon;
  final String label;
  final String route;

  const NavigationTabData({
    required this.icon,
    required this.activeIcon,
    required this.label,
    required this.route,
  });
}

class MainAppLayout extends StatefulWidget {
  final Widget child;

  const MainAppLayout({super.key, required this.child});

  @override
  State<MainAppLayout> createState() => _MainAppLayoutState();
}

final navigationTabs = [
  NavigationTabData(
    icon: const Icon(Icons.verified_user),
    activeIcon: const Icon(Icons.verified_user),
    label: "Home",
    route: '/',
  ),
  NavigationTabData(
    icon: const Icon(Icons.verified_user),
    activeIcon: const Icon(Icons.verified_user),
    label: "Objetivos",
    route: '/goals',
  ),
  NavigationTabData(
    icon: const Icon(Icons.verified_user),
    activeIcon: const Icon(Icons.verified_user),
    label: "Resumen",
    route: '/summary',
  ),
  NavigationTabData(
    icon: const Icon(Icons.verified_user),
    activeIcon: const Icon(Icons.verified_user),
    label: "Billetera",
    route: '/wallet',
  ),
];

class _MainAppLayoutState extends State<MainAppLayout> {
  int selectedIndex = 0;

  void onItemTapped(int index) {
    final router = appRouter;
    final routeConfig = navigationTabs[index];

    if (GoRouterState.of(context).matchedLocation != routeConfig.route) {
      router.go(routeConfig.route);
      setState(() => selectedIndex = index);
    }
    //La siguiente linea hace que se baje un modal (si esta abierto) cuando cambias de screen, pero genera un warning molesto "There is nothing to pop..." buscar otra forma o borrarlo
    //router.pop();
  }

  @override
  Widget build(BuildContext context) {
    if (GoRouterState.of(context).matchedLocation == '') {
      setState(() => selectedIndex = 0);
    }

    if (GoRouterState.of(context).matchedLocation == '') {
      setState(() => selectedIndex = 1);
    }

    if (GoRouterState.of(context).matchedLocation == '') {
      setState(() => selectedIndex = 2);
    }

    return Scaffold(
      body: widget.child,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        onTap: onItemTapped,
        selectedItemColor: Theme.of(context).colorScheme.primary,
        unselectedItemColor: Theme.of(context).colorScheme.secondary,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        items: [
          BottomNavigationBarItem(
            icon: navigationTabs[0].icon,
            activeIcon: navigationTabs[0].activeIcon,
            label: navigationTabs[0].label,
          ),
          BottomNavigationBarItem(
            icon: navigationTabs[1].icon,
            activeIcon: navigationTabs[1].activeIcon,
            label: navigationTabs[1].label,
          ),
          BottomNavigationBarItem(
            icon: navigationTabs[2].icon,
            activeIcon: navigationTabs[2].activeIcon,
            label: navigationTabs[2].label,
          ),
          BottomNavigationBarItem(
            icon: navigationTabs[3].icon,
            activeIcon: navigationTabs[3].activeIcon,
            label: navigationTabs[3].label,
          ),
        ],
      ),
    );
  }
}
