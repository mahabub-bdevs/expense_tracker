import 'package:expense_tracker/features/cards/view/card_screen.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../../home/view/home_screen.dart';
import '../../profile/view/profile_screen.dart';

class MainController extends GetxController {
  // Current Bottom Navigation Index
  final currentIndex = 0.obs;

  // Reduced the screen list to Home and Profile only, matching the simplified navigation
  final List<Widget> screens = [
    const HomeScreen(),
    const CardScreen(),
    const HomeScreen(),
    const ProfileScreen(),
  ];

  // Logic for switching tabs
  void changeTabIndex(int index) {
    currentIndex.value = index;
  }
}
