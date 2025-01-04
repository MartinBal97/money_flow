/* import 'package:flutter/cupertino.dart';
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
    icon: const Icon(CupertinoIcons.home),
    activeIcon: const Icon(CupertinoIcons.home),
    label: "Home",
    route: '/',
  ),
  NavigationTabData(
    icon: const Icon(CupertinoIcons.radiowaves_left),
    activeIcon: const Icon(CupertinoIcons.radiowaves_left),
    label: "Objetivos",
    route: '/goals',
  ),
  NavigationTabData(
    icon: const Icon(CupertinoIcons.home),
    activeIcon: const Icon(CupertinoIcons.home),
    label: "Resumen",
    route: '/summary',
  ),
  NavigationTabData(
    icon: const Icon(CupertinoIcons.home),
    activeIcon: const Icon(CupertinoIcons.home),
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
 */

import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:money_flow/core/app_theme.dart';
import 'package:money_flow/core/router.dart';

class NavigationTabData {
  final Widget icon;
  final String label;
  final String route;

  const NavigationTabData({
    required this.icon,
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
    icon: const Icon(CupertinoIcons.house_fill),
    label: "Home",
    route: '/',
  ),
  NavigationTabData(
    icon: const Icon(CupertinoIcons.scope),
    label: "Objetivos",
    route: '/goals',
  ),
  NavigationTabData(
    icon: const Icon(CupertinoIcons.chart_pie_fill),
    label: "Resumen",
    route: '/summary',
  ),
  NavigationTabData(
    icon: const Icon(CupertinoIcons.money_pound),
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

    // * Size screen
    double widthMq = MediaQuery.sizeOf(context).width;
    double heightMq = MediaQuery.sizeOf(context).height;

    return Scaffold(
      extendBody: true,
      body: widget.child,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).colorScheme.primary,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
        child: Icon(CupertinoIcons.add, color: white, size: 30),
        onPressed: () {
          showModalBottomSheet(
            context: context,
            builder: (context) {
              return SizedBox(
                height: heightMq * 0.3,
                width: widthMq,
                child: Center(child: Text('Add something')),
              );
            },
          );
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: AnimatedBottomNavigationBar(
        icons: navigationTabs.map((tab) => (tab.icon as Icon).icon!).toList(),
        activeColor: Theme.of(context).colorScheme.primary,
        activeIndex: selectedIndex,
        gapLocation: GapLocation.center,
        notchSmoothness: NotchSmoothness.values[2],
        leftCornerRadius: 24,
        rightCornerRadius: 24,
        onTap: onItemTapped,
        safeAreaValues: SafeAreaValues(top: true),
        iconSize: 24,
        inactiveColor: neutral400,
        backgroundColor: white,
      ),
    );
  }
}
