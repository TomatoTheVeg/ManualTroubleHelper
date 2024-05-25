import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreenNotifier extends StateNotifier<int> {
  HomeScreenNotifier() : super(0);

  toggleHomeScreen(int index) {
    state = index;
  }
}

final homeScreenProvider = StateNotifierProvider<HomeScreenNotifier, int>(
  (ref) => HomeScreenNotifier(),
);
