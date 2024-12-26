import 'package:flutter_riverpod/flutter_riverpod.dart';

class NavigationBarNotifier extends StateNotifier<int> {
  NavigationBarNotifier() : super(0);
  setCurrentScreen(int index) => state = index;
}

StateNotifierProvider<NavigationBarNotifier, int> navigationProvider =
    StateNotifierProvider<NavigationBarNotifier, int>(
  (ref) => NavigationBarNotifier(),
);
