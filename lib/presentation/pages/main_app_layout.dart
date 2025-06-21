import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:my_pocket/core/constans/app_sizes.dart';
import 'package:my_pocket/core/router/router.dart';
import 'package:my_pocket/core/router/routes.dart';
import 'package:my_pocket/core/theme/app_theme.dart';
import 'package:my_pocket/presentation/common_widgets/buttons_widgets.dart';

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
  const NavigationTabData(icon: Icon(CupertinoIcons.house_fill), label: "Home", route: AppRoutes.home),
  // const NavigationTabData(icon: Icon(Icons.track_changes), label: "Objetivos", route: AppRoutes.goals),
  // const NavigationTabData(icon: Icon(CupertinoIcons.chart_pie_fill), label: "Resumen", route: AppRoutes.summary),
  const NavigationTabData(icon: Icon(CupertinoIcons.person_fill), label: "Perfile", route: AppRoutes.profile),
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
    if (GoRouterState.of(context).matchedLocation == AppRoutes.home) setState(() => selectedIndex = 0);

    // if (GoRouterState.of(context).matchedLocation == AppRoutes.goals) setState(() => selectedIndex = 1);

    // if (GoRouterState.of(context).matchedLocation == AppRoutes.summary) setState(() => selectedIndex = 2);

    if (GoRouterState.of(context).matchedLocation == AppRoutes.profile) setState(() => selectedIndex = 3);

    return Scaffold(
      extendBody: true,
      body: widget.child,
      floatingActionButton: FloatingActionButton(
        backgroundColor: blue500,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
        child: const Icon(CupertinoIcons.add, color: white, size: 30),
        onPressed: () {
          showModalBottomSheet(
            context: context,
            builder: (context) {
              return const ModalContentNavigationBar();
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
        safeAreaValues: const SafeAreaValues(top: true),
        iconSize: 24,
        backgroundColor: white,
      ),
    );
  }
}

class ModalContentNavigationBar extends StatelessWidget {
  const ModalContentNavigationBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final router = appRouter;

    return SizedBox(
      height: context.heightMq * 0.3,
      width: context.widthMq,
      child: Center(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: Sizes.p24),
        child: Column(
          spacing: Sizes.p16,
          children: [
            gapH24,
            const Text('Elige el tipo de movimiento', style: titleTS),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              spacing: Sizes.p16,
              children: [
                Expanded(
                  child: CustomButton(
                    text: 'Gasto',
                    widget: const Icon(CupertinoIcons.arrow_up, color: blue500, size: 32),
                    onTap: () {
                      router.pop();
                      context.push(AppRoutes.expensesIncomes, extra: {
                        'isTypeIncome': false,
                      });
                    },
                  ),
                ),
                Expanded(
                  child: CustomButton(
                    text: 'Ingreso',
                    widget: const Icon(CupertinoIcons.arrow_down, color: blue500, size: 32),
                    onTap: () {
                      router.pop();
                      context.push(AppRoutes.expensesIncomes, extra: {
                        'isTypeIncome': true,
                      });
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      )),
    );
  }
}
