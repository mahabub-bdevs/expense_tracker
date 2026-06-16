import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/core.dart';
import '../controller/main_controller.dart';

class MainBottomNavBar extends StatelessWidget {
  final MainController controller;

  const MainBottomNavBar({super.key, required this.controller});

  // ── Icon list (same order as tabs) ──────────────────────────────────────
  static const List<IconData> _inactiveIcons = [
    Icons.home_outlined,
    Icons.credit_score,
    Icons.bar_chart,
    Icons.person,
  ];

  static const List<IconData> _activeIcons = [
    Icons.home_outlined,
    Icons.credit_score,
    Icons.bar_chart,
    Icons.person,
  ];

  @override
  Widget build(BuildContext context) {
    final colors = context.appColors;

    return Obx(() {
      final currentIndex = controller.currentIndex.value;

      return AnimatedBottomNavigationBar.builder(
        itemCount: _inactiveIcons.length,
        tabBuilder: (int index, bool isActive) {
          final icon = isActive ? _activeIcons[index] : _inactiveIcons[index];
          final color = isActive ? colors.primary : colors.textHint;

          return Padding(
            padding: const EdgeInsets.only(right: 50),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [Icon(icon, color: color, size: 30)],
            ),
          );
        },
        activeIndex: currentIndex,
        onTap: controller.changeTabIndex,
        // ── Notch & Shape ─────────────────────────────────────────────────
        gapLocation: GapLocation.none,
        notchSmoothness: NotchSmoothness.verySmoothEdge,
        leftCornerRadius: 24,
        rightCornerRadius: 24,
        // ── Colors ────────────────────────────────────────────────────────
        backgroundColor: Theme.of(context).cardColor,
        splashColor: colors.primary.withValues(alpha: 0.1),
        splashSpeedInMilliseconds: 300,
        // ── Height ────────────────────────────────────────────────────────
        height: 60,
      );
    });
  }
}
