import 'package:continental_manual_helper/models/manual.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../data/dummy_data.dart';

class ManualListNotifier extends StateNotifier<List<Manual>> {
  ManualListNotifier() : super(manualListData);

  Manual currentManual = manualListData[0];

  void selectCurrentManual(int index) async {
    currentManual = state[index];
  }
}

final manualListProvider =
    StateNotifierProvider<ManualListNotifier, List<Manual>>(
        (ref) => ManualListNotifier());
