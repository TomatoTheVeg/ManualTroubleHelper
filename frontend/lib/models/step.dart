class StepModel {
  final String description;
  final String? code;
  final String? imagePath;
  final int? link;
  final int id;

  StepModel({
    required this.link,
    required this.description,
    required this.code,
    required this.imagePath,
    required this.id,
  });

  factory StepModel.fromJson(Map<String, dynamic> json) {
    return StepModel(
      description: json['description'],
      code: json['code'],
      imagePath: json['imagePath'],
      id: json['id'],
      link: json['link'],
    );
  }
}
