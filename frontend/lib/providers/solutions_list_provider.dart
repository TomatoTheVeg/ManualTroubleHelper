import 'package:flutter_riverpod/flutter_riverpod.dart';

class SolutionsListNotifier extends StateNotifier<List<String>> {
  SolutionsListNotifier() : super(const []);
}

final solutionsListProvider =
    StateNotifierProvider<SolutionsListNotifier, List<String>>(
        (ref) => SolutionsListNotifier());
