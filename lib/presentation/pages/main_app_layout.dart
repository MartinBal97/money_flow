import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:money_flow/core/router/router.dart';
import 'package:money_flow/core/theme/app_theme.dart';

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
  NavigationTabData(icon: const Icon(CupertinoIcons.house_fill), label: "Home", route: '/home'),
  NavigationTabData(icon: const Icon(Icons.track_changes), label: "Objetivos", route: '/goals'),
  NavigationTabData(icon: const Icon(CupertinoIcons.chart_pie_fill), label: "Resumen", route: '/summary'),
  NavigationTabData(icon: const Icon(Icons.wallet), label: "Billetera", route: '/wallet'),
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
  }

  @override
  Widget build(BuildContext context) {
    // if (GoRouterState.of(context).matchedLocation == '') {
    //   setState(() => selectedIndex = 0);
    // }

    return Scaffold(
      extendBody: true,
      body: widget.child,
      floatingActionButton: FloatingActionButton(
        backgroundColor: blue500,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
        child: Icon(CupertinoIcons.add, color: white, size: 30),
        onPressed: () {
          showModalBottomSheet(
            context: context,
            builder: (context) {
              return SizedBox(
                height: context.heightMq * 0.3,
                width: context.widthMq,
                child: Center(child: Text('Add something')),
              );
            },
          );
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: AnimatedBottomNavigationBar(
        icons: navigationTabs.map((tab) => (tab.icon as Icon).icon!).toList(),
        activeColor: blue500,
        inactiveColor: neutral400,
        activeIndex: selectedIndex,
        gapLocation: GapLocation.center,
        notchSmoothness: NotchSmoothness.values[2],
        leftCornerRadius: 24,
        rightCornerRadius: 24,
        onTap: onItemTapped,
        safeAreaValues: SafeAreaValues(top: true),
        iconSize: 24,
        backgroundColor: white,
      ),
    );
  }
}
