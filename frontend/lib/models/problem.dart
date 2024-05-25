import 'package:continental_manual_helper/models/solution.dart';

class Problem {
  final String description;
  final int id;
  final List<Solution>? solutions;

  Problem({
    required this.description,
    required this.id,
    required this.solutions,
  });

  factory Problem.fromJson(Map<String, dynamic> json) {
    return Problem(
      description: json['description'],
      id: json['id'],
      solutions: (json['solutions'] as List<dynamic>?)
          ?.map((solutionJson) =>
              Solution.fromJson(solutionJson as Map<String, dynamic>))
          .toList(),
    );
  }
}
