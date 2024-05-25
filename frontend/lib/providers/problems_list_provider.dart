import 'dart:convert';

import 'package:continental_manual_helper/models/problem.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;

class ProblemsListNotifier extends StateNotifier<List<Problem>> {
  ProblemsListNotifier() : super(const []);

  List<Problem> temp = [];

  void getProblems() async {
    final response = await http.get(
      Uri.parse("https://manual.sunjet-project.de/faq/problems"),
    );
    final responseBody = jsonDecode(response.body) as List<dynamic>;
    state = responseBody.map((el) => Problem.fromJson(el)).toList();
    temp = state;
  }

  void sortProblems(String string) {
    state = temp.where((el) => el.description.contains(string)).toList();
  }
}

final problemsListProvider =
    StateNotifierProvider<ProblemsListNotifier, List<Problem>>(
        (ref) => ProblemsListNotifier());
