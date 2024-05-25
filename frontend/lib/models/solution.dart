import 'dart:convert';

import 'package:continental_manual_helper/models/step.dart';
import 'package:http/http.dart' as http;

class Solution {
  final int id;
  final List<StepModel> steps;

  Solution({required this.id, required this.steps});

  factory Solution.fromJson(Map<String, dynamic> json) {
    return Solution(
      id: json['id'],
      steps: (json['steps'] as List<dynamic>)
          .map((stepJson) =>
              StepModel.fromJson(stepJson as Map<String, dynamic>))
          .toList(),
    );
  }

  Future<int> like() async {
    final response = await http
        .get(Uri.parse("https://manual.sunjet-project.de/faq/upvote/$id"));
    final responseBody = json.decode(response.body) as Map<String, dynamic>;
    return responseBody['score'] as int;
  }
}
